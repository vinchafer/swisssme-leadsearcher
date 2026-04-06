/**
 * /api/cron/zefix-sync
 *
 * Vercel Cron endpoint — runs on the 1st of each month at 02:00 UTC.
 * Configured in vercel.json: { "crons": [{ "path": "/api/cron/zefix-sync", "schedule": "0 2 1 * *" }] }
 *
 * Logic:
 *  1. Check 25-day guard (prevent accidental re-runs)
 *  2. If guard active → return { status: 'skipped' }
 *  3. Otherwise → spawn zefix-sync as a detached background process
 *     (works locally / on long-running servers; on Vercel Hobby the process
 *      will be killed after 10s — use Vercel Pro or an external runner for
 *      the full sync. The guard + scheduling logic still works either way.)
 *  4. Always return HTTP 200 so Vercel doesn't retry.
 *
 * Test locally:
 *   curl http://localhost:3001/api/cron/zefix-sync
 */

import { NextResponse } from 'next/server'
import pg from 'pg'
import { spawn } from 'child_process'
import { resolve } from 'path'

export const dynamic = 'force-dynamic'

const GUARD_DAYS = 25

interface SyncLogRow {
  id: string
  started_at: string
  finished_at: string | null
  canton: string | null
  total_fetched: number | null
  total_inserted: number | null
  total_updated: number | null
  total_errors: number | null
  status: string
  error_message: string | null
}

// ── DB helper ─────────────────────────────────────────────────────────────────

async function getLastSyncInfo(client: pg.Client): Promise<{
  lastSync: Date | null
  lastLog: SyncLogRow | null
  daysSinceLast: number | null
}> {
  const r = await client.query<SyncLogRow>(
    `SELECT * FROM zefix_sync_log ORDER BY started_at DESC LIMIT 1`,
  )
  if (r.rows.length === 0) return { lastSync: null, lastLog: null, daysSinceLast: null }

  const lastLog = r.rows[0]
  const lastSync = new Date(lastLog.started_at)
  const daysSinceLast = (Date.now() - lastSync.getTime()) / (1000 * 60 * 60 * 24)
  return { lastSync, lastLog, daysSinceLast }
}

async function insertSyncTriggerLog(client: pg.Client): Promise<string> {
  const r = await client.query<{ id: string }>(
    `INSERT INTO zefix_sync_log (canton, status) VALUES ('ALL', 'triggered') RETURNING id`,
  )
  return r.rows[0].id
}

// ── Spawn sync process ────────────────────────────────────────────────────────

function spawnSyncProcess(projectRoot: string): { pid: number | undefined; launched: boolean } {
  try {
    const script = resolve(projectRoot, 'scripts/zefix-sync.ts')
    const child = spawn('npx', ['tsx', script], {
      cwd: projectRoot,
      detached: true,
      stdio: 'ignore',
      env: { ...process.env },
    })
    child.unref()
    return { pid: child.pid, launched: true }
  } catch (err) {
    return { pid: undefined, launched: false }
  }
}

// ── Route handler ─────────────────────────────────────────────────────────────

export async function GET() {
  const startedAt = new Date().toISOString()

  // Validate env
  if (!process.env.DATABASE_URL) {
    return NextResponse.json({
      status: 'error',
      message: 'DATABASE_URL is not configured',
      timestamp: startedAt,
    })
  }

  const client = new pg.Client({ connectionString: process.env.DATABASE_URL })

  try {
    await client.connect()

    // ── 25-day guard ────────────────────────────────────────────────────────
    const { lastSync, lastLog, daysSinceLast } = await getLastSyncInfo(client)

    if (daysSinceLast !== null && daysSinceLast < GUARD_DAYS) {
      const nextSyncDate = new Date(lastSync!.getTime() + GUARD_DAYS * 24 * 60 * 60 * 1000)
      await client.end()
      return NextResponse.json({
        status: 'skipped',
        reason: `${GUARD_DAYS}-day guard active`,
        message: `Last sync was ${daysSinceLast.toFixed(1)} days ago. Next sync allowed after ${nextSyncDate.toISOString().slice(0, 10)}.`,
        last_sync: lastSync?.toISOString() ?? null,
        last_status: lastLog?.status ?? null,
        timestamp: startedAt,
      })
    }

    // ── Trigger sync ────────────────────────────────────────────────────────
    const logId = await insertSyncTriggerLog(client)

    // Detect environment
    const isVercel = !!process.env.VERCEL
    const projectRoot = resolve(process.cwd())

    let spawnResult: { pid: number | undefined; launched: boolean } = { pid: undefined, launched: false }
    if (!isVercel) {
      // Local / server: spawn detached background process
      spawnResult = spawnSyncProcess(projectRoot)
    }

    const lastSyncSummary = lastLog
      ? {
          started_at: lastLog.started_at,
          canton: lastLog.canton,
          total_fetched: lastLog.total_fetched,
          total_inserted: lastLog.total_inserted,
          total_updated: lastLog.total_updated,
          total_errors: lastLog.total_errors,
          status: lastLog.status,
        }
      : null

    await client.end()

    if (isVercel) {
      // On Vercel: the sync cannot run inline (would timeout).
      // Log the trigger and return guidance.
      return NextResponse.json({
        status: 'triggered',
        message: 'Sync trigger logged. Full Zefix sync (26 cantons, ~693k companies) exceeds Vercel function timeout. Run `npm run zefix-sync` on your local machine or a long-running server.',
        log_id: logId,
        days_since_last_sync: daysSinceLast !== null ? parseFloat(daysSinceLast.toFixed(1)) : null,
        last_sync: lastSyncSummary,
        timestamp: startedAt,
        note: 'To run fully on Vercel, migrate to Vercel Pro + background functions, or use an external job runner (GitHub Actions, Railway, etc.)',
      })
    }

    return NextResponse.json({
      status: spawnResult.launched ? 'success' : 'error',
      message: spawnResult.launched
        ? `Zefix sync process spawned (PID: ${spawnResult.pid}). All 26 cantons will sync in background.`
        : 'Failed to spawn sync process — check server logs.',
      log_id: logId,
      pid: spawnResult.pid,
      days_since_last_sync: daysSinceLast !== null ? parseFloat(daysSinceLast.toFixed(1)) : null,
      last_sync: lastSyncSummary,
      timestamp: startedAt,
    })

  } catch (err: unknown) {
    try { await client.end() } catch { /* ignore */ }
    const message = err instanceof Error ? err.message : String(err)
    console.error('[cron/zefix-sync] Error:', message)
    // Always return 200 — Vercel retries on non-200
    return NextResponse.json({
      status: 'error',
      message,
      timestamp: startedAt,
    })
  }
}
