/**
 * noga-matcher-v2.ts
 *
 * LLM-powered NOGA 2008 classification using Groq API.
 * Hybrid approach: keyword pre-filter (v1 logic) → top 8 candidates → Groq final decision.
 *
 * Usage:
 *   npx tsx scripts/noga-matcher-v2.ts [--limit 10000] [--batch 10] [--min-confidence 0.5] [--dry-run]
 *
 * Env vars (in .env.local):
 *   DATABASE_URL  — Supabase PostgreSQL connection string
 *   GROQ_API_KEY  — Groq API key
 */

import pg from 'pg'
import { config } from 'dotenv'
import { resolve, dirname } from 'path'
import { fileURLToPath } from 'url'
import * as fs from 'fs'

const { Client } = pg

const __filename = fileURLToPath(import.meta.url)
const __dirname = dirname(__filename)
config({ path: resolve(__dirname, '../.env.local') })

const DATABASE_URL = process.env.DATABASE_URL
const GROQ_API_KEY = process.env.GROQ_API_KEY

if (!DATABASE_URL) {
  console.error('\n❌  DATABASE_URL is not set in .env.local\n')
  process.exit(1)
}
if (!GROQ_API_KEY) {
  console.error('\n❌  GROQ_API_KEY is not set in .env.local\n')
  process.exit(1)
}

// ── CLI args ──────────────────────────────────────────────────────────────────

const args = process.argv.slice(2)
const limitArg = args.includes('--limit') ? parseInt(args[args.indexOf('--limit') + 1], 10) : 10000
const batchSize = args.includes('--batch') ? parseInt(args[args.indexOf('--batch') + 1], 10) : 10
const minConfidence = args.includes('--min-confidence')
  ? parseFloat(args[args.indexOf('--min-confidence') + 1])
  : 0.5
const dryRun = args.includes('--dry-run')
const logFile = args.includes('--log') ? args[args.indexOf('--log') + 1] : null

// ── Logging ───────────────────────────────────────────────────────────────────

function log(msg: string): void {
  const line = `${msg}\n`
  process.stdout.write(line)
  if (logFile) fs.appendFileSync(logFile, line)
}

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
  noga_code: string | null
  noga_label_de?: string
  confidence: number
  reason?: string
  source: 'groq' | 'keyword_fallback'
}

// ── Groq API ──────────────────────────────────────────────────────────────────

interface GroqResponse {
  noga_code: string | null
  confidence: number
  reason: string
}

async function sleep(ms: number): Promise<void> {
  return new Promise((resolve) => setTimeout(resolve, ms))
}

async function callGroq(prompt: string, retries = 3): Promise<GroqResponse | null> {
  for (let attempt = 0; attempt <= retries; attempt++) {
    try {
      const res = await fetch('https://api.groq.com/openai/v1/chat/completions', {
        method: 'POST',
        headers: {
          Authorization: `Bearer ${GROQ_API_KEY}`,
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({
          model: 'llama-3.3-70b-versatile',
          messages: [{ role: 'user', content: prompt }],
          max_tokens: 150,
          temperature: 0.1,
          response_format: { type: 'json_object' },
        }),
      })

      if (res.status === 429) {
        const retryAfter = parseInt(res.headers.get('retry-after') ?? '10', 10) * 1000
        await sleep(retryAfter || Math.pow(2, attempt) * 2000)
        continue
      }

      if (!res.ok) {
        const text = await res.text()
        throw new Error(`HTTP ${res.status}: ${text.slice(0, 200)}`)
      }

      const data = (await res.json()) as { choices: { message: { content: string } }[] }
      const content = data.choices[0]?.message?.content ?? ''

      try {
        const parsed = JSON.parse(content) as GroqResponse
        return parsed
      } catch {
        // Groq returned non-JSON despite response_format — extract manually
        const match = content.match(/"noga_code"\s*:\s*"([^"]+)"/)
        const confMatch = content.match(/"confidence"\s*:\s*([\d.]+)/)
        if (match) {
          return {
            noga_code: match[1],
            confidence: confMatch ? parseFloat(confMatch[1]) : 0.6,
            reason: 'parsed from text',
          }
        }
        return null
      }
    } catch (err: unknown) {
      if (attempt === retries) {
        return null
      }
      await sleep(Math.pow(2, attempt) * 1000)
    }
  }
  return null
}

// ── Keyword pre-filter (from v1) ──────────────────────────────────────────────

const STOP_WORDS = new Set([
  'und', 'oder', 'die', 'der', 'das', 'den', 'dem', 'des', 'ein', 'eine',
  'einer', 'einem', 'einen', 'eines', 'ist', 'sind', 'war', 'waren', 'wird',
  'werden', 'wurde', 'wurden', 'hat', 'haben', 'hatte', 'hatten', 'mit',
  'von', 'zu', 'in', 'an', 'auf', 'für', 'aus', 'bei', 'nach', 'über',
  'unter', 'vor', 'durch', 'zwischen', 'gegen', 'ohne', 'um', 'als', 'wie',
  'auch', 'nicht', 'sowie', 'alle', 'deren', 'welche', 'dass',
  'sich', 'ihre', 'ihrer', 'ihren', 'ihrem', 'ihres', 'seine', 'seiner',
  'seinen', 'seinem', 'seines', 'dieser', 'dieses', 'diesem', 'diesen',
  'im', 'vom', 'zum', 'zur', 'am', 'ins', 'ans', 'beim', 'dazu', 'dabei',
  'davon', 'daran',
])

function tokenize(text: string): string[] {
  return text
    .toLowerCase()
    .replace(/[^\wäöüß\s]/g, ' ')
    .split(/\s+/)
    .filter((t) => t.length >= 4 && !STOP_WORDS.has(t))
}

function buildNogaTokens(label: string): string[] {
  const base = tokenize(label)
  const expanded: string[] = [...base]
  for (const token of base) {
    if (token.length >= 6) expanded.push(token.slice(0, -2))
    if (token.endsWith('ung')) expanded.push(token.slice(0, -3))
    if (token.endsWith('ungen')) expanded.push(token.slice(0, -5))
    if (token.endsWith('heit')) expanded.push(token.slice(0, -4))
    if (token.endsWith('keit')) expanded.push(token.slice(0, -4))
    if (token.endsWith('erei')) expanded.push(token.slice(0, -4))
  }
  return Array.from(new Set(expanded))
}

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
      for (const ct of companyTokens) {
        if (ct.startsWith(nt) || nt.startsWith(ct)) {
          hits += 0.5
          break
        }
      }
    }
  }
  const precision = hits / nogaTokens.length
  const recall = hits / companyTokens.length
  if (precision + recall === 0) return 0
  return (2 * precision * recall) / (precision + recall)
}

function getTopCandidates(
  text: string,
  nogaCodes: NogaCode[],
  nogaTokenMap: Map<string, string[]>,
  topN = 8,
): Array<{ code: NogaCode; score: number }> {
  const companyTokens = tokenize(text)
  if (companyTokens.length === 0) return []

  const companyTokenSet = new Set(companyTokens)
  const scored: Array<{ code: NogaCode; score: number }> = []

  for (const noga of nogaCodes) {
    const nogaTokens = nogaTokenMap.get(noga.code)
    if (!nogaTokens?.length) continue
    const score = scoreNoga(nogaTokens, companyTokens, companyTokenSet)
    if (score > 0) scored.push({ code: noga, score })
  }

  scored.sort((a, b) => b.score - a.score)
  return scored.slice(0, topN)
}

// ── Groq prompt builder ───────────────────────────────────────────────────────

function buildPrompt(company: Company, candidates: Array<{ code: NogaCode; score: number }>): string {
  const purposeText = [company.purpose_text, company.description, company.name]
    .filter(Boolean)
    .join(' | ')

  const formattedCandidates = candidates.length > 0
    ? candidates.map((c) => `- ${c.code.code}: ${c.code.label_de}`).join('\n')
    : '(no keyword matches — use your best judgment based on purpose text)'

  return `You are a Swiss business classification expert using NOGA 2008 codes.

Classify this company into the most fitting NOGA code.

Company name: ${company.name}
Business purpose: ${purposeText}

Candidate NOGA codes (pre-filtered by keyword relevance):
${formattedCandidates}

Return ONLY valid JSON in this exact format:
{"noga_code": "XX.XX", "confidence": 0.85, "reason": "brief reason"}

Rules:
- confidence must be between 0.0 and 1.0
- If no candidate fits well, return the closest one with lower confidence
- If truly none match, return: {"noga_code": null, "confidence": 0.0, "reason": "no match"}
- noga_code must be exactly as listed (e.g. "46.19" not "4619")`
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

async function loadUnmatchedCompanies(client: pg.Client, limit: number): Promise<Company[]> {
  const res = await client.query<Company>(
    `SELECT id, name, purpose_text, description
     FROM companies
     WHERE noga_code IS NULL
       AND purpose_text IS NOT NULL
     ORDER BY id
     LIMIT $1`,
    [limit],
  )
  return res.rows
}

async function applyMatches(
  client: pg.Client,
  updates: Array<{ company: Company; match: MatchResult }>,
): Promise<void> {
  for (const { company, match } of updates) {
    if (!match.noga_code) continue
    await client.query(
      `UPDATE companies SET
         noga_code        = $2,
         noga_label_de    = $3,
         noga_confidence  = $4,
         noga_matched_at  = NOW()
       WHERE id = $1`,
      [company.id, match.noga_code, match.noga_label_de ?? null, match.confidence],
    )
  }
}

// ── Main ──────────────────────────────────────────────────────────────────────

async function main(): Promise<void> {
  const client = new Client({ connectionString: DATABASE_URL })

  log('\n🔌  Connecting to Supabase PostgreSQL…')
  await client.connect()
  log('    Connected ✓')

  log('\n📋  Loading NOGA codes…')
  const nogaCodes = await loadNogaCodes(client)
  log(`    Loaded ${nogaCodes.length} class-level NOGA codes`)

  const nogaTokenMap = new Map<string, string[]>()
  for (const noga of nogaCodes) {
    const tokens = buildNogaTokens(noga.label_de)
    if (noga.label_fr) tokens.push(...buildNogaTokens(noga.label_fr))
    nogaTokenMap.set(noga.code, Array.from(new Set(tokens)))
  }

  log(`\n🏢  Loading up to ${limitArg} unmatched companies with purpose_text…`)
  const companies = await loadUnmatchedCompanies(client, limitArg)
  log(`    Found ${companies.length} companies to process`)

  if (companies.length === 0) {
    log('    Nothing to do.')
    await client.end()
    return
  }

  if (dryRun) log('\n🔍  DRY RUN — no database writes\n')

  const startTime = Date.now()
  let processed = 0
  let matched = 0
  let skipped = 0
  let groqFailed = 0
  let keywordFallback = 0

  // Process sequentially — 2s delay between Groq calls stays under free-tier 30 RPM limit
  const updates: Array<{ company: Company; match: MatchResult }> = []

  for (let i = 0; i < companies.length; i++) {
    const company = companies[i]
    const text = [company.purpose_text, company.description, company.name]
      .filter(Boolean)
      .join(' ')

    const candidates = getTopCandidates(text, nogaCodes, nogaTokenMap, 8)
    const prompt = buildPrompt(company, candidates)

    let result: MatchResult | null = null

    if (!dryRun) {
      const groqResult = await callGroq(prompt)
      if (groqResult?.noga_code) {
        // Validate the returned code exists in our list
        const matchedNoga = nogaCodes.find((n) => n.code === groqResult.noga_code)
        result = {
          noga_code: groqResult.noga_code,
          noga_label_de: matchedNoga?.label_de,
          confidence: groqResult.confidence,
          reason: groqResult.reason,
          source: 'groq',
        }
      } else {
        groqFailed++
        // Fallback to top keyword candidate
        if (candidates.length > 0 && candidates[0].score >= 0.15) {
          result = {
            noga_code: candidates[0].code.code,
            noga_label_de: candidates[0].code.label_de,
            confidence: candidates[0].score,
            source: 'keyword_fallback',
          }
          keywordFallback++
        }
      }
    } else {
      if (candidates.length > 0) {
        log(
          `  [DRY] ${company.name.slice(0, 50).padEnd(50)} → ${candidates[0].code.code} ${candidates[0].code.label_de.slice(0, 40)} (kw: ${candidates[0].score.toFixed(3)})`,
        )
        result = {
          noga_code: candidates[0].code.code,
          noga_label_de: candidates[0].code.label_de,
          confidence: candidates[0].score,
          source: 'keyword_fallback',
        }
      }
    }

    if (result?.noga_code && result.confidence >= minConfidence) {
      updates.push({ company, match: result })
      matched++
    } else {
      skipped++
    }
    processed++

    // Write to DB every batchSize companies
    if (!dryRun && (updates.length >= batchSize || i === companies.length - 1)) {
      if (updates.length > 0) {
        try {
          await applyMatches(client, updates)
          updates.length = 0
        } catch (err: unknown) {
          const msg = err instanceof Error ? err.message : String(err)
          log(`  ⚠️  Batch write error: ${msg.slice(0, 100)}`)
          updates.length = 0
        }
      }
    }

    // Progress log every batchSize companies
    if (processed % batchSize === 0 || i === companies.length - 1) {
      const elapsed = (Date.now() - startTime) / 1000
      const rate = processed / elapsed
      const remaining = companies.length - processed
      const etaMin = rate > 0 ? Math.round(remaining / rate / 60) : 0
      const pct = ((processed / companies.length) * 100).toFixed(1)
      log(
        `  ⏳  ${processed.toLocaleString('de-CH')}/${companies.length.toLocaleString('de-CH')} (${pct}%) | ✅ ${matched} matched | ⚠️ ${groqFailed} groq-fail | ↩️ ${keywordFallback} keyword-fb | ETA: ${etaMin}min`,
      )
    }

    // 2s between Groq calls → ~30 RPM, within free-tier limit
    if (!dryRun && i < companies.length - 1) {
      await sleep(2000)
    }
  }

  await client.end()

  const totalMin = Math.round((Date.now() - startTime) / 60000)
  log('\n📊  Summary:')
  log(`    Processed          : ${processed.toLocaleString('de-CH')}`)
  log(`    Matched (written)  : ${matched.toLocaleString('de-CH')}`)
  log(`    Skipped (low conf) : ${skipped.toLocaleString('de-CH')}`)
  log(`    Groq failures      : ${groqFailed.toLocaleString('de-CH')}`)
  log(`    Keyword fallbacks  : ${keywordFallback.toLocaleString('de-CH')}`)
  log(`    Total time         : ${totalMin}min`)
  log(`    Min confidence     : ${minConfidence}`)
  if (dryRun) log('    (dry run — no writes)')
  log('')
}

main().catch((err) => {
  console.error('\n❌  Fatal error:', err)
  process.exit(1)
})
