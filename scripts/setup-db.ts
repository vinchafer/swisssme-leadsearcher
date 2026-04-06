import { readFileSync } from 'fs'
import { resolve, dirname } from 'path'
import { fileURLToPath } from 'url'
import pg from 'pg'
import { config } from 'dotenv'

const { Client } = pg

// ESM-compatible __dirname
const __filename = fileURLToPath(import.meta.url)
const __dirname = dirname(__filename)

// Load .env.local
config({ path: resolve(__dirname, '../.env.local') })

const DATABASE_URL = process.env.DATABASE_URL

if (!DATABASE_URL) {
  console.error('\n❌  DATABASE_URL is not set in .env.local')
  console.error('   Find it in: Supabase Dashboard → Settings → Database → Connection string (URI)')
  console.error('   Format:     postgresql://postgres.REF:PASSWORD@aws-0-REGION.pooler.supabase.com:6543/postgres\n')
  process.exit(1)
}

/**
 * Split a SQL file into individual statements, stripping line comments.
 */
function splitStatements(sql: string): string[] {
  const stripped = sql.replace(/--[^\n]*/g, '')
  return stripped
    .split(';')
    .map((s) => s.trim())
    .filter((s) => s.length > 0)
}

async function runFile(client: pg.Client, filePath: string, label: string): Promise<number> {
  console.log(`\n📄  Running ${label}…`)
  const sql = readFileSync(filePath, 'utf8')
  const statements = splitStatements(sql)
  console.log(`    Found ${statements.length} statements`)

  let ok = 0
  let failed = 0

  for (let i = 0; i < statements.length; i++) {
    const stmt = statements[i]
    const preview = stmt.replace(/\s+/g, ' ').slice(0, 80)
    try {
      await client.query(stmt)
      console.log(`    ✅  [${i + 1}/${statements.length}] ${preview}`)
      ok++
    } catch (err: unknown) {
      const msg = err instanceof Error ? err.message : String(err)
      // Silently skip "already exists" so the script is safely re-runnable
      if (msg.includes('already exists') || msg.includes('duplicate key')) {
        console.log(`    ⚠️   [${i + 1}/${statements.length}] skipped — ${msg.split('\n')[0]}`)
        ok++
      } else {
        console.error(`    ❌  [${i + 1}/${statements.length}] FAILED — ${msg.split('\n')[0]}`)
        console.error(`        Statement: ${preview}`)
        failed++
      }
    }
  }

  const status = failed === 0 ? '✅' : '❌'
  console.log(`\n    ${status}  ${label}: ${ok} ok, ${failed} failed`)
  return failed
}

async function main() {
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

  const root = resolve(__dirname, '..')
  const migrationFile = resolve(root, 'supabase', 'migrations', '001_initial_schema.sql')
  const migration003File = resolve(root, 'supabase', 'migrations', '003_zefix_schema.sql')
  const seedFile = resolve(root, 'supabase', 'seed.sql')
  const nogaSeedFile = resolve(root, 'supabase', 'noga_seed.sql')

  let totalFailed = 0
  totalFailed += await runFile(client, migrationFile, '001_initial_schema.sql')
  totalFailed += await runFile(client, migration003File, '003_zefix_schema.sql')
  totalFailed += await runFile(client, seedFile, 'seed.sql')
  totalFailed += await runFile(client, nogaSeedFile, 'noga_seed.sql')

  await client.end()

  if (totalFailed > 0) {
    console.error(`\n🚨  Setup finished with ${totalFailed} error(s). Review the output above.\n`)
    process.exit(1)
  } else {
    console.log('\n🎉  Database setup complete — all statements executed successfully.\n')
  }
}

main()
