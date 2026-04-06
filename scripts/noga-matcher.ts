/**
 * noga-matcher.ts
 *
 * Matches companies without a NOGA code to the best-fitting NOGA class
 * by scoring their purpose_text against the NOGA code labels using
 * keyword-based term frequency matching.
 *
 * Usage:
 *   npx ts-node -T scripts/noga-matcher.ts [--limit 1000] [--min-confidence 0.2] [--dry-run]
 *
 * Env vars (in .env.local):
 *   DATABASE_URL  — Supabase PostgreSQL connection string
 */

import pg from 'pg'
import { config } from 'dotenv'
import { resolve, dirname } from 'path'
import { fileURLToPath } from 'url'

const { Client } = pg

const __filename = fileURLToPath(import.meta.url)
const __dirname = dirname(__filename)
config({ path: resolve(__dirname, '../.env.local') })

const DATABASE_URL = process.env.DATABASE_URL
if (!DATABASE_URL) {
  console.error('\n❌  DATABASE_URL is not set in .env.local\n')
  process.exit(1)
}

// ── CLI args ──────────────────────────────────────────────────────────────────

const args = process.argv.slice(2)
const limitArg = args.includes('--limit') ? parseInt(args[args.indexOf('--limit') + 1], 10) : 5000
const minConfidence = args.includes('--min-confidence')
  ? parseFloat(args[args.indexOf('--min-confidence') + 1])
  : 0.15
const dryRun = args.includes('--dry-run')

// ── Types ─────────────────────────────────────────────────────────────────────

interface NogaCode {
  code: string
  label_de: string
  label_fr: string | null
  section: string
  level: number
}

interface Company {
  id: string
  name: string
  purpose_text: string | null
  description: string | null
}

interface MatchResult {
  code: string
  label_de: string
  confidence: number
}

// ── Text helpers ───────────────────────────────────────────────────────────────

/**
 * Tokenise a German text into lowercase words, removing stop words and
 * very short tokens.
 */
const STOP_WORDS = new Set([
  'und', 'oder', 'die', 'der', 'das', 'den', 'dem', 'des', 'ein', 'eine',
  'einer', 'einem', 'einen', 'eines', 'ist', 'sind', 'war', 'waren', 'wird',
  'werden', 'wurde', 'wurden', 'hat', 'haben', 'hatte', 'hatten', 'mit',
  'von', 'zu', 'in', 'an', 'auf', 'für', 'aus', 'bei', 'nach', 'über',
  'unter', 'vor', 'durch', 'zwischen', 'gegen', 'ohne', 'um', 'als', 'wie',
  'auch', 'nicht', 'sowie', 'sowie', 'alle', 'deren', 'welche', 'dass',
  'sich', 'ihre', 'ihrer', 'ihren', 'ihrem', 'ihres', 'seine', 'seiner',
  'seinen', 'seinem', 'seines', 'dieser', 'dieses', 'diesem', 'diesen',
  'jeder', 'jede', 'jedes', 'jeden', 'jedem', 'im', 'vom', 'zum', 'zur',
  'am', 'ins', 'ans', 'beim', 'nach', 'dazu', 'dabei', 'dabei', 'davon',
  'daran', 'darüber', 'darunter', 'davor', 'dahinter',
])

function tokenize(text: string): string[] {
  return text
    .toLowerCase()
    .replace(/[^\wäöüß\s]/g, ' ')
    .split(/\s+/)
    .filter((t) => t.length >= 4 && !STOP_WORDS.has(t))
}

/**
 * Build a token set from a NOGA label, with basic German stemming aliases.
 * Adds plural/compound variants so "Herstellung" matches "Hersteller".
 */
function buildNogaTokens(label: string): string[] {
  const base = tokenize(label)
  const expanded: string[] = [...base]

  for (const token of base) {
    // Add partial stem: strip common suffixes so "herstellung" → "herst"
    if (token.length >= 6) {
      expanded.push(token.slice(0, -2)) // strip last 2 chars
    }
    // Common suffix normalisation
    if (token.endsWith('ung')) expanded.push(token.slice(0, -3))
    if (token.endsWith('ungen')) expanded.push(token.slice(0, -5))
    if (token.endsWith('heit')) expanded.push(token.slice(0, -4))
    if (token.endsWith('keit')) expanded.push(token.slice(0, -4))
    if (token.endsWith('erei')) expanded.push(token.slice(0, -4))
    if (token.endsWith('handel')) expanded.push('handel')
    if (token.endsWith('bau')) expanded.push('bau')
    if (token.endsWith('wesen')) expanded.push('wesen')
  }

  return Array.from(new Set(expanded))
}

// ── Matching logic ─────────────────────────────────────────────────────────────

/**
 * Score a NOGA code against a set of tokens from the company text.
 * Returns a confidence value in [0, 1].
 */
function scoreNoga(
  nogaTokens: string[],
  companyTokens: string[],
  companyTokenSet: Set<string>,
): number {
  if (companyTokens.length === 0 || nogaTokens.length === 0) return 0

  let hits = 0
  for (const nt of nogaTokens) {
    if (companyTokenSet.has(nt)) {
      hits++
    } else {
      // Partial match: check if any company token starts with this noga token
      for (const ct of companyTokens) {
        if (ct.startsWith(nt) || nt.startsWith(ct)) {
          hits += 0.5
          break
        }
      }
    }
  }

  // Normalise by the number of NOGA tokens (precision-style scoring)
  const precision = hits / nogaTokens.length
  // Also consider recall: how many company tokens were matched
  const recall = hits / companyTokens.length
  // F1-like harmonic mean
  if (precision + recall === 0) return 0
  return (2 * precision * recall) / (precision + recall)
}

function findBestNogaMatch(
  text: string,
  nogaCodes: NogaCode[],
  nogaTokenMap: Map<string, string[]>,
): MatchResult | null {
  const companyTokens = tokenize(text)
  if (companyTokens.length === 0) return null

  const companyTokenSet = new Set(companyTokens)
  let bestCode: NogaCode | null = null
  let bestScore = 0

  for (const noga of nogaCodes) {
    const nogaTokens = nogaTokenMap.get(noga.code)
    if (!nogaTokens || nogaTokens.length === 0) continue

    const score = scoreNoga(nogaTokens, companyTokens, companyTokenSet)
    if (score > bestScore) {
      bestScore = score
      bestCode = noga
    }
  }

  if (!bestCode || bestScore < minConfidence) return null

  return {
    code: bestCode.code,
    label_de: bestCode.label_de,
    confidence: Math.round(bestScore * 1000) / 1000,
  }
}

// ── DB helpers ────────────────────────────────────────────────────────────────

async function loadNogaCodes(client: pg.Client): Promise<NogaCode[]> {
  const res = await client.query<NogaCode>(
    `SELECT code, label_de, label_fr, section, level
     FROM noga_codes
     WHERE level = 4
     ORDER BY code`,
  )
  return res.rows
}

async function loadUnmatchedCompanies(
  client: pg.Client,
  limit: number,
): Promise<Company[]> {
  const res = await client.query<Company>(
    `SELECT id, name, purpose_text, description
     FROM companies
     WHERE noga_code IS NULL
       AND (purpose_text IS NOT NULL OR description IS NOT NULL)
     LIMIT $1`,
    [limit],
  )
  return res.rows
}

async function applyMatch(
  client: pg.Client,
  company: Company,
  match: MatchResult,
): Promise<void> {
  await client.query(
    `UPDATE companies SET
       noga_code        = $2,
       noga_label_de    = $3,
       noga_confidence  = $4,
       noga_matched_at  = NOW()
     WHERE id = $1`,
    [company.id, match.code, match.label_de, match.confidence],
  )
}

// ── Main ─────────────────────────────────────────────────────────────────────

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

  // Load reference data
  console.log('\n📋  Loading NOGA codes…')
  const nogaCodes = await loadNogaCodes(client)
  console.log(`    Loaded ${nogaCodes.length} class-level NOGA codes`)

  // Pre-compute token sets for all NOGA codes
  const nogaTokenMap = new Map<string, string[]>()
  for (const noga of nogaCodes) {
    const tokens = buildNogaTokens(noga.label_de)
    if (noga.label_fr) {
      // Include French tokens for bilingual matching
      tokens.push(...buildNogaTokens(noga.label_fr))
    }
    nogaTokenMap.set(noga.code, Array.from(new Set(tokens)))
  }

  // Load unmatched companies
  console.log(`\n🏢  Loading up to ${limitArg} unmatched companies…`)
  const companies = await loadUnmatchedCompanies(client, limitArg)
  console.log(`    Found ${companies.length} companies to process`)

  if (companies.length === 0) {
    console.log('    Nothing to do.')
    await client.end()
    return
  }

  if (dryRun) {
    console.log('\n🔍  DRY RUN — no database writes')
  }

  // Process
  let matched = 0
  let skipped = 0
  let errors = 0

  for (let i = 0; i < companies.length; i++) {
    const company = companies[i]
    const text = [company.purpose_text, company.description, company.name]
      .filter(Boolean)
      .join(' ')

    const match = findBestNogaMatch(text, nogaCodes, nogaTokenMap)

    if (!match) {
      skipped++
      continue
    }

    if (dryRun) {
      console.log(
        `  [DRY] ${company.name} → ${match.code} ${match.label_de} (${match.confidence})`,
      )
      matched++
      continue
    }

    try {
      await applyMatch(client, company, match)
      matched++
    } catch (err: unknown) {
      const msg = err instanceof Error ? err.message : String(err)
      console.error(`  ❌  Failed to update ${company.name}: ${msg.split('\n')[0]}`)
      errors++
    }

    // Progress every 500 companies
    if ((i + 1) % 500 === 0) {
      console.log(
        `    Progress: ${i + 1}/${companies.length} — matched ${matched}, skipped ${skipped}, errors ${errors}`,
      )
    }
  }

  await client.end()

  console.log('\n📊  Summary:')
  console.log(`    Companies processed : ${companies.length}`)
  console.log(`    Matched             : ${matched}`)
  console.log(`    Skipped (no match)  : ${skipped}`)
  console.log(`    Errors              : ${errors}`)
  console.log(`    Min confidence used : ${minConfidence}`)
  if (dryRun) console.log('    (dry run — no writes)')
  console.log()
}

main()
