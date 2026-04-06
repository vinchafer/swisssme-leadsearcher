/**
 * enrich-purpose-text.ts
 *
 * Fetches the Gesellschaftszweck (purpose text) for each company via the
 * Zefix REST API and writes it into the `purpose_text` column.
 *
 * Usage:
 *   npm run enrich-purpose-text                       # Full run
 *   npm run enrich-purpose-text -- --limit=100        # First N companies
 *   npm run enrich-purpose-text -- --canton=ZH        # Single canton
 *   npm run enrich-purpose-text -- --dry-run          # Preview only, no DB writes
 *
 * Env vars (in .env.local):
 *   DATABASE_URL       — Supabase PostgreSQL connection string
 *   ZEFIX_USERNAME     — Zefix API username (email)
 *   ZEFIX_PASSWORD     — Zefix API password
 */

import pg from 'pg'
import { config } from 'dotenv'
import { resolve, dirname } from 'path'
import { fileURLToPath } from 'url'

const { Client } = pg

const __filename = fileURLToPath(import.meta.url)
const __dirname = dirname(__filename)
config({ path: resolve(__dirname, '../.env.local') })

// ── Validate env ──────────────────────────────────────────────────────────────

const DATABASE_URL = process.env.DATABASE_URL
const ZEFIX_USERNAME = process.env.ZEFIX_USERNAME
const ZEFIX_PASSWORD = process.env.ZEFIX_PASSWORD

if (!DATABASE_URL) { console.error('\n❌  DATABASE_URL is not set in .env.local\n'); process.exit(1) }
if (!ZEFIX_USERNAME) { console.error('\n❌  ZEFIX_USERNAME is not set in .env.local\n'); process.exit(1) }
if (!ZEFIX_PASSWORD) { console.error('\n❌  ZEFIX_PASSWORD is not set in .env.local\n'); process.exit(1) }

const ZEFIX_API = 'https://www.zefix.admin.ch/ZefixPublicREST/api/v1'
const BASIC_AUTH = Buffer.from(`${ZEFIX_USERNAME}:${ZEFIX_PASSWORD}`).toString('base64')

// ── CLI args ──────────────────────────────────────────────────────────────────

const args = process.argv.slice(2)
const dryRun = args.includes('--dry-run')

function getArg(name: string): string | null {
  const flag = args.find(a => a === `--${name}` || a.startsWith(`--${name}=`))
  if (!flag) return null
  if (flag.startsWith(`--${name}=`)) return flag.slice(`--${name}=`.length)
  const idx = args.indexOf(flag)
  return args[idx + 1] ?? null
}

const limitArg = getArg('limit')
const cantonArg = getArg('canton')
const BATCH_SIZE = 5
const BATCH_DELAY_MS = 2000
const REQUEST_TIMEOUT_MS = 30_000
const LOG_EVERY = 100

// ── Helpers ───────────────────────────────────────────────────────────────────

function sleep(ms: number): Promise<void> {
  return new Promise(res => setTimeout(res, ms))
}

function formatEta(processedSoFar: number, totalToProcess: number, elapsedMs: number): string {
  if (processedSoFar === 0) return '?'
  const rate = processedSoFar / (elapsedMs / 1000) // per second
  const remaining = totalToProcess - processedSoFar
  const etaSecs = remaining / rate
  if (etaSecs < 60) return `${Math.round(etaSecs)}s`
  if (etaSecs < 3600) return `${Math.round(etaSecs / 60)}m`
  return `${(etaSecs / 3600).toFixed(1)}h`
}

function formatDuration(ms: number): string {
  const s = Math.round(ms / 1000)
  if (s < 60) return `${s}s`
  if (s < 3600) return `${Math.floor(s / 60)}m ${s % 60}s`
  return `${Math.floor(s / 3600)}h ${Math.floor((s % 3600) / 60)}m`
}

// ── Zefix API fetch ───────────────────────────────────────────────────────────

type FetchResult =
  | { status: 'ok'; purpose: string | null }
  | { status: 'not_found' }
  | { status: 'auth_error' }
  | { status: 'server_error'; code: number }
  | { status: 'timeout' }
  | { status: 'network_error'; message: string }

async function fetchPurpose(uid: string, attempt = 1): Promise<FetchResult> {
  const controller = new AbortController()
  const timer = setTimeout(() => controller.abort(), REQUEST_TIMEOUT_MS)

  try {
    const res = await fetch(`${ZEFIX_API}/company/uid/${uid}`, {
      headers: {
        'Authorization': `Basic ${BASIC_AUTH}`,
        'Accept': 'application/json',
      },
      signal: controller.signal,
    })
    clearTimeout(timer)

    if (res.status === 401 || res.status === 403) return { status: 'auth_error' }
    if (res.status === 404) return { status: 'not_found' }

    if (res.status >= 500) {
      // Exponential backoff: 2s, 4s, 8s
      if (attempt <= 3) {
        await sleep(2000 * Math.pow(2, attempt - 1))
        return fetchPurpose(uid, attempt + 1)
      }
      return { status: 'server_error', code: res.status }
    }

    if (res.status !== 200) return { status: 'server_error', code: res.status }

    const data = await res.json() as unknown
    // API returns an array of company entries
    const entries = Array.isArray(data) ? data : [data]
    const first = entries[0] as Record<string, unknown> | undefined
    const purpose = (first?.purpose as string | null | undefined) ?? null

    return { status: 'ok', purpose: purpose?.trim() || null }

  } catch (err: unknown) {
    clearTimeout(timer)
    if (err instanceof Error && err.name === 'AbortError') return { status: 'timeout' }
    const msg = err instanceof Error ? err.message : String(err)
    return { status: 'network_error', message: msg }
  }
}

// ── DB helpers ────────────────────────────────────────────────────────────────

async function updatePurpose(client: pg.Client, uid: string, purpose: string): Promise<void> {
  await client.query(
    `UPDATE companies SET purpose_text = $1, updated_at = NOW() WHERE uid_chid = $2`,
    [purpose, uid],
  )
}

async function verifyFinalCount(client: pg.Client): Promise<number> {
  const r = await client.query<{ count: string }>(
    `SELECT COUNT(*) FROM companies WHERE purpose_text IS NOT NULL`,
  )
  return parseInt(r.rows[0].count, 10)
}

// ── Main ──────────────────────────────────────────────────────────────────────

async function main() {
  console.log('\n🔌  Connecting to Supabase PostgreSQL…')
  const client = new Client({ connectionString: DATABASE_URL })
  await client.connect()
  console.log('    Connected ✓\n')

  // Build query for companies to enrich
  let query = `
    SELECT uid_chid, name
    FROM companies
    WHERE purpose_text IS NULL
      AND data_source = 'zefix_csv'
      AND uid_chid IS NOT NULL
  `
  const params: string[] = []
  if (cantonArg) {
    params.push(cantonArg.toUpperCase())
    query += ` AND headquarters_canton = $${params.length}`
  }
  query += ` ORDER BY uid_chid`
  if (limitArg) {
    params.push(limitArg)
    query += ` LIMIT $${params.length}`
  }

  const { rows: companies } = await client.query<{ uid_chid: string; name: string }>(query, params)
  const total = companies.length

  if (total === 0) {
    console.log('✅  No companies need enrichment. purpose_text is already populated.')
    await client.end()
    return
  }

  console.log(`📋  Companies to enrich: ${total.toLocaleString()}`)
  if (cantonArg) console.log(`    Canton filter: ${cantonArg.toUpperCase()}`)
  if (limitArg)  console.log(`    Limit: ${limitArg}`)
  if (dryRun)    console.log(`    🔍 DRY RUN — no DB writes`)
  console.log(`    Batch size: ${BATCH_SIZE}, delay: ${BATCH_DELAY_MS}ms between batches`)
  console.log(`    Est. time: ~${formatEta(BATCH_SIZE, total, BATCH_DELAY_MS)}\n`)

  const stats = {
    processed: 0,
    updated: 0,
    not_found: 0,
    timeout: 0,
    network_error: 0,
    server_error: 0,
    no_purpose: 0,  // API returned ok but purpose was empty
  }

  const startTime = Date.now()
  let authFailed = false

  // Process in batches
  for (let i = 0; i < companies.length; i += BATCH_SIZE) {
    if (authFailed) break

    const batch = companies.slice(i, i + BATCH_SIZE)

    await Promise.all(batch.map(async ({ uid_chid: uid, name }) => {
      const result = await fetchPurpose(uid)
      stats.processed++

      switch (result.status) {
        case 'auth_error':
          console.error(`\n🔐  AUTH FAILED for ${uid} — check ZEFIX_USERNAME / ZEFIX_PASSWORD`)
          authFailed = true
          break

        case 'not_found':
          stats.not_found++
          break

        case 'timeout':
          stats.timeout++
          console.log(`    ⏱  Timeout: ${uid} (${name})`)
          break

        case 'network_error':
          stats.network_error++
          console.log(`    🌐  Network error: ${uid} — ${result.message}`)
          break

        case 'server_error':
          stats.server_error++
          console.log(`    ❌  Server error HTTP ${result.code}: ${uid}`)
          break

        case 'ok':
          if (!result.purpose) {
            stats.no_purpose++
          } else if (!dryRun) {
            await updatePurpose(client, uid, result.purpose)
            stats.updated++
          } else {
            // dry-run: show sample
            if (stats.processed <= 5) {
              console.log(`    🔍  [dry-run] ${uid} (${name})\n        → "${result.purpose.slice(0, 100)}"`)
            }
            stats.updated++
          }
          break
      }
    }))

    // Progress log every LOG_EVERY companies
    if (stats.processed % LOG_EVERY === 0 || stats.processed === total) {
      const elapsed = Date.now() - startTime
      const eta = formatEta(stats.processed, total, elapsed)
      const pct = ((stats.processed / total) * 100).toFixed(1)
      console.log(
        `    📊  ${stats.processed.toLocaleString()}/${total.toLocaleString()} (${pct}%)` +
        ` | ✅ ${stats.updated} updated` +
        ` | ⚠️  ${stats.not_found + stats.timeout + stats.server_error + stats.network_error} failed` +
        ` | ETA: ${eta}`
      )
    }

    if (authFailed) break

    // Delay between batches (skip after last batch)
    if (i + BATCH_SIZE < companies.length) {
      await sleep(BATCH_DELAY_MS)
    }
  }

  // ── Final summary ─────────────────────────────────────────────────────────
  const elapsed = Date.now() - startTime
  const finalCount = await verifyFinalCount(client)

  console.log('\n' + '─'.repeat(60))
  console.log('🏁  ENRICHMENT COMPLETE')
  console.log('─'.repeat(60))
  console.log(`    Total processed : ${stats.processed.toLocaleString()}`)
  console.log(`    Updated         : ${stats.updated.toLocaleString()}`)
  console.log(`    No purpose text : ${stats.no_purpose.toLocaleString()} (API returned empty)`)
  console.log(`    Not found (404) : ${stats.not_found.toLocaleString()}`)
  console.log(`    Timeouts        : ${stats.timeout.toLocaleString()}`)
  console.log(`    Network errors  : ${stats.network_error.toLocaleString()}`)
  console.log(`    Server errors   : ${stats.server_error.toLocaleString()}`)
  console.log(`    Time taken      : ${formatDuration(elapsed)}`)
  if (!dryRun) {
    console.log(`\n    DB verify: companies WITH purpose_text = ${finalCount.toLocaleString()}`)
  }
  console.log('─'.repeat(60) + '\n')

  await client.end()

  if (authFailed) process.exit(1)
}

main().catch(err => {
  console.error('\n💥  Fatal error:', err instanceof Error ? err.message : err)
  process.exit(1)
})
