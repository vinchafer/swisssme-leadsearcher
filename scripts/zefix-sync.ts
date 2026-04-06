/**
 * zefix-sync.ts
 *
 * Downloads Swiss company data from the Open Data Basel-Stadt CSV bulk export
 * and upserts into the `companies` table. Iterates through all 26 cantons.
 * Progress is logged in zefix_sync_log.
 *
 * Usage:
 *   npm run zefix-sync -- [--canton ZH] [--dry-run]
 *
 * Env vars (in .env.local):
 *   DATABASE_URL  — Supabase PostgreSQL connection string
 */

import pg from 'pg'
import { config } from 'dotenv'
import { resolve, dirname } from 'path'
import { fileURLToPath } from 'url'
import { createWriteStream, createReadStream, unlinkSync } from 'fs'
import { tmpdir } from 'os'
import { join } from 'path'
import { parse } from 'csv-parse'
import { Readable } from 'stream'
import { pipeline } from 'stream/promises'

const { Client } = pg

const __filename = fileURLToPath(import.meta.url)
const __dirname = dirname(__filename)
config({ path: resolve(__dirname, '../.env.local') })

const DATABASE_URL = process.env.DATABASE_URL
if (!DATABASE_URL) {
  console.error('\n❌  DATABASE_URL is not set in .env.local\n')
  process.exit(1)
}

// ── Config ────────────────────────────────────────────────────────────────────

const CSV_BASE = 'https://data-bs.ch/stata/zefix_handelsregister/all_cantons'
const CANTON_DELAY_MS = 1000

const ALL_CANTONS = [
  'ZH', 'BE', 'LU', 'UR', 'SZ', 'OW', 'NW', 'GL', 'ZG', 'FR',
  'SO', 'BS', 'BL', 'SH', 'AR', 'AI', 'SG', 'GR', 'AG', 'TG',
  'TI', 'VD', 'VS', 'NE', 'GE', 'JU',
]

// ── CLI args ──────────────────────────────────────────────────────────────────

const args = process.argv.slice(2)

let cantonArg: string | null = null
const cantonFlagIdx = args.findIndex((a) => a === '--canton' || a.startsWith('--canton='))
if (cantonFlagIdx !== -1) {
  const flag = args[cantonFlagIdx]
  cantonArg = flag.startsWith('--canton=')
    ? flag.slice('--canton='.length)
    : (args[cantonFlagIdx + 1] ?? null)
}

const dryRun = args.includes('--dry-run')
const cantons = cantonArg ? [cantonArg.toUpperCase()] : ALL_CANTONS

// ── CSV row shape ─────────────────────────────────────────────────────────────

interface CsvRow {
  canton_id: string
  canton: string
  short_name_canton: string
  district_id: string
  district_de: string
  district_fr: string
  district_it: string
  district_en: string
  muni_id: string
  municipality: string
  company_uri: string
  company_uid: string
  company_legal_name: string
  type_id: string
  company_type_de: string
  company_type_fr: string
  plz: string
  locality: string
  zusatz: string
  street: string
  url_cantonal_register: string
}

// ── Helpers ───────────────────────────────────────────────────────────────────

function slugFromUid(uid: string): string {
  // "CHE473503411" → "che-473-503-411"
  const digits = uid.replace(/^CHE/i, '')
  if (digits.length === 9) {
    return `che-${digits.slice(0, 3)}-${digits.slice(3, 6)}-${digits.slice(6, 9)}`
  }
  return uid.toLowerCase().replace(/[^a-z0-9]+/g, '-')
}

function extractLegalFormCode(typeId: string): string | null {
  if (!typeId || typeId === 'null') return null
  // "https://ld.admin.ch/ech/97/legalforms/0101" → "0101"
  const parts = typeId.split('/')
  return parts[parts.length - 1] ?? null
}

function nullIfEmpty(val: string): string | null {
  if (!val || val === 'null' || val.trim() === '') return null
  return val.trim()
}

function sleep(ms: number): Promise<void> {
  return new Promise((res) => setTimeout(res, ms))
}

// ── Download CSV to temp file ─────────────────────────────────────────────────

async function downloadCsv(canton: string): Promise<string> {
  const url = `${CSV_BASE}/companies_${canton}.csv`
  const tmpPath = join(tmpdir(), `zefix_${canton}_${Date.now()}.csv`)

  const res = await fetch(url)
  if (!res.ok) throw new Error(`HTTP ${res.status} downloading ${url}`)
  if (!res.body) throw new Error(`No response body for ${url}`)

  const fileStream = createWriteStream(tmpPath)
  await pipeline(Readable.fromWeb(res.body as Parameters<typeof Readable.fromWeb>[0]), fileStream)
  return tmpPath
}

// ── Parse CSV into rows ───────────────────────────────────────────────────────

function parseCsv(filePath: string): Promise<CsvRow[]> {
  return new Promise((resolve, reject) => {
    const rows: CsvRow[] = []
    const parser = parse({
      columns: true,
      skip_empty_lines: true,
      trim: true,
      relax_column_count: true,
    })
    parser.on('readable', () => {
      let record: CsvRow | null
      while ((record = parser.read() as CsvRow | null) !== null) {
        rows.push(record)
      }
    })
    parser.on('error', reject)
    parser.on('end', () => resolve(rows))
    createReadStream(filePath).pipe(parser)
  })
}

// ── Upsert one company ────────────────────────────────────────────────────────

async function upsertCompany(
  client: pg.Client,
  row: CsvRow,
): Promise<'inserted' | 'updated' | 'error'> {
  const uid = row.company_uid?.trim()
  const name = row.company_legal_name?.trim()
  if (!uid || !name) return 'error'

  const slug = slugFromUid(uid)
  const canton = nullIfEmpty(row.short_name_canton)
  const city = nullIfEmpty(row.locality)
  const zipCode = nullIfEmpty(row.plz)
  const street = nullIfEmpty(row.street)
  const legalFormName = nullIfEmpty(row.company_type_de)
  const legalFormCode = extractLegalFormCode(row.type_id)

  try {
    const result = await client.query<{ xmax: string }>(
      `INSERT INTO companies (
        name, slug, headquarters_city, headquarters_canton,
        uid_chid, legal_form_code, legal_form_name,
        street, zip_code, country_code,
        data_source, zefix_last_sync
      ) VALUES (
        $1, $2, $3, $4,
        $5, $6, $7,
        $8, $9, 'CH',
        'zefix_csv', NOW()
      )
      ON CONFLICT (uid_chid) DO UPDATE SET
        name                = EXCLUDED.name,
        headquarters_city   = EXCLUDED.headquarters_city,
        headquarters_canton = EXCLUDED.headquarters_canton,
        legal_form_code     = EXCLUDED.legal_form_code,
        legal_form_name     = EXCLUDED.legal_form_name,
        street              = EXCLUDED.street,
        zip_code            = EXCLUDED.zip_code,
        data_source         = 'zefix_csv',
        zefix_last_sync     = NOW(),
        updated_at          = NOW()
      RETURNING xmax`,
      [name, slug, city, canton, uid, legalFormCode, legalFormName, street, zipCode],
    )
    const r = result.rows[0]
    return r && r.xmax === '0' ? 'inserted' : 'updated'
  } catch (err: unknown) {
    const msg = err instanceof Error ? err.message : String(err)
    // Slug conflict: retry with uid suffix
    if (msg.includes('duplicate key') && msg.includes('slug')) {
      try {
        await client.query(
          `INSERT INTO companies (
            name, slug, headquarters_city, headquarters_canton,
            uid_chid, legal_form_code, legal_form_name,
            street, zip_code, country_code,
            data_source, zefix_last_sync
          ) VALUES (
            $1, $2, $3, $4,
            $5, $6, $7,
            $8, $9, 'CH',
            'zefix_csv', NOW()
          )
          ON CONFLICT (uid_chid) DO UPDATE SET
            name            = EXCLUDED.name,
            zefix_last_sync = NOW(),
            updated_at      = NOW()`,
          [name, `${slug}-${uid.slice(-4).toLowerCase()}`, city, canton, uid, legalFormCode, legalFormName, street, zipCode],
        )
        return 'inserted'
      } catch {
        return 'error'
      }
    }
    console.error(`    ❌  upsert failed for ${uid}: ${msg.split('\n')[0]}`)
    return 'error'
  }
}

// ── Sync log helpers ──────────────────────────────────────────────────────────

async function createSyncLog(client: pg.Client, canton: string): Promise<string> {
  const res = await client.query<{ id: string }>(
    `INSERT INTO zefix_sync_log (canton, status) VALUES ($1, 'running') RETURNING id`,
    [canton],
  )
  return res.rows[0].id
}

async function updateSyncLog(
  client: pg.Client,
  id: string,
  stats: { fetched: number; inserted: number; updated: number; errors: number },
  status: 'done' | 'error',
  errorMessage?: string,
): Promise<void> {
  await client.query(
    `UPDATE zefix_sync_log SET
      finished_at    = NOW(),
      total_fetched  = $2,
      total_inserted = $3,
      total_updated  = $4,
      total_errors   = $5,
      status         = $6,
      error_message  = $7
    WHERE id = $1`,
    [id, stats.fetched, stats.inserted, stats.updated, stats.errors, status, errorMessage ?? null],
  )
}

// ── Sync one canton ───────────────────────────────────────────────────────────

async function syncCanton(client: pg.Client, canton: string): Promise<void> {
  const logId = dryRun ? null : await createSyncLog(client, canton)
  const stats = { fetched: 0, inserted: 0, updated: 0, errors: 0 }

  console.log(`\n${dryRun ? '🔍  [DRY-RUN]' : '🔄 '} Syncing canton ${canton}…`)

  let tmpPath: string | null = null
  try {
    process.stdout.write(`    Downloading CSV… `)
    tmpPath = await downloadCsv(canton)
    console.log('done')

    process.stdout.write(`    Parsing CSV… `)
    const rows = await parseCsv(tmpPath)
    stats.fetched = rows.length
    console.log(`${rows.length} companies`)

    if (dryRun) {
      if (rows.length > 0) {
        const sample = rows[0]
        console.log(`    Sample row mapping:`)
        console.log(`      uid_chid            = ${sample.company_uid}`)
        console.log(`      name                = ${sample.company_legal_name}`)
        console.log(`      headquarters_canton = ${sample.short_name_canton}`)
        console.log(`      headquarters_city   = ${sample.locality}`)
        console.log(`      zip_code            = ${sample.plz}`)
        console.log(`      street              = ${sample.street}`)
        console.log(`      legal_form_name     = ${sample.company_type_de}`)
        console.log(`      legal_form_code     = ${extractLegalFormCode(sample.type_id)}`)
        console.log(`      slug                = ${slugFromUid(sample.company_uid)}`)
      }
      console.log(`    🔍  [DRY-RUN] ${canton}: ${stats.fetched} companies would be imported`)
    } else {
      for (const row of rows) {
        const result = await upsertCompany(client, row)
        if (result === 'inserted') stats.inserted++
        else if (result === 'updated') stats.updated++
        else stats.errors++
      }
      if (logId) await updateSyncLog(client, logId, stats, 'done')
      console.log(
        `    ✅  ${canton}: ${stats.fetched} fetched, ${stats.inserted} inserted, ${stats.updated} updated, ${stats.errors} errors`,
      )
    }
  } catch (err: unknown) {
    const msg = err instanceof Error ? err.message : String(err)
    if (logId) await updateSyncLog(client, logId, stats, 'error', msg)
    console.error(`    ❌  ${canton} sync failed: ${msg}`)
  } finally {
    if (tmpPath) {
      try { unlinkSync(tmpPath) } catch { /* ignore */ }
    }
  }
}

// ── Main ──────────────────────────────────────────────────────────────────────

const MIN_SYNC_INTERVAL_DAYS = 25

async function main(): Promise<void> {
  const client = new Client({ connectionString: DATABASE_URL })

  console.log('\n🔌  Connecting to Supabase PostgreSQL…')
  try {
    await client.connect()
    console.log('    Connected ✓')
  } catch (err: unknown) {
    const msg = err instanceof Error ? err.message : String(err)
    console.error(`\n❌  Connection failed: ${msg}\n`)
    process.exit(1)
  }

  // ── Monthly sync guard ────────────────────────────────────────────────────
  if (!cantonArg) {
    const res = await client.query<{ finished_at: Date }>(
      `SELECT finished_at FROM zefix_sync_log
       WHERE status = 'done'
       ORDER BY finished_at DESC
       LIMIT 1`,
    )
    if (res.rows.length > 0) {
      const lastSync = res.rows[0].finished_at
      const daysSince = (Date.now() - new Date(lastSync).getTime()) / (1000 * 60 * 60 * 24)
      if (daysSince < MIN_SYNC_INTERVAL_DAYS) {
        console.log(
          `\n⏭️   Sync skipped — last sync was ${Math.floor(daysSince)} days ago. Minimum interval: ${MIN_SYNC_INTERVAL_DAYS} days.\n`,
        )
        await client.end()
        process.exit(0)
      }
    }
  }

  console.log(`\n🇨🇭  Starting Zefix CSV sync for cantons: ${cantons.join(', ')}`)
  if (dryRun) console.log('    DRY-RUN: no data will be written to the database')

  const startTime = Date.now()

  for (let i = 0; i < cantons.length; i++) {
    await syncCanton(client, cantons[i])
    if (i < cantons.length - 1) await sleep(CANTON_DELAY_MS)
  }

  await client.end()

  const elapsed = Math.round((Date.now() - startTime) / 1000)
  console.log(`\n🎉  Zefix sync complete in ${elapsed}s\n`)
}

main()
