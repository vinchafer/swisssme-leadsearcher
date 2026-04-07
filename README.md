# SwissSME Leadsearcher

Zentrale, automatisch aktualisierte Datenbank aller ~717k Schweizer Unternehmen mit maximaler Datenanreicherung.

## Purpose

Ein browserbasiertes Tool (Desktop + Mobile) das alle aktiven Schweizer Firmen aus dem offiziellen Handelsregister (Zefix) anzeigt und nach verschiedenen Kriterien filterbar macht.

**Live:** https://ai-company-radar.vercel.app

## Data Sources

1. **Zefix CSV** (authoritative baseline)
   - Alle 26 Kantone
   - ~717k Unternehmen
   - Täglicher Update vom Open Data Basel-Stadt

2. **Zefix PublicREST API** (enrichment)
   - Zweckbeschreibung (`purpose_text`)
   - VRP Daten (later)

3. **Groq LLM** (NOGA matching)
   - `purpose_text` → NOGA 2008 Codes
   - Confidence-based auto-assignment

4. **Web Crawling** (future)
   - LinkedIn URLs
   - Mitarbeiterzahlen
   - Logo URLs
   - Website

## Tech Stack

- **Frontend:** Next.js 14 (App Router), TypeScript, Tailwind CSS, shadcn/ui, Recharts
- **Backend:** Next.js API Routes, TypeScript
- **Database:** Supabase (PostgreSQL)
- **Hosting:** Vercel
- **Scripts:** TypeScript (tsx/ts-node)

## Project Structure

```
ai-company-radar/
├── app/
│   ├── api/
│   │   ├── companies/          # List + search API
│   │   ├── company/[uid]/      # Detail API
│   │   └── cron/
│   │       └── zefix-sync/     # Monthly auto-sync
│   ├── companies/              # Frontend pages
│   ├── admin/                  # Admin interface
│   └── layout.tsx
├── scripts/
│   ├── zefix-sync.ts           # Import all 26 cantons
│   ├── enrich-purpose-text.ts  # Zefix API enrichment
│   ├── noga-matcher-v2.ts      # NOGA classification
│   ├── setup-db.ts             # DB migrations
│   └── seed.ts                 # Test data
├── lib/
│   ├── supabase.ts             # Supabase client
│   ├── api-helpers.ts          # Shared utilities
│   └── types.ts                # TypeScript types
├── supabase/
│   ├── migrations/             # DB schema
│   └── seed.sql                # Seed data
├── public/
├── .env.local                  # Local env (git ignored)
├── vercel.json                 # Vercel config + crons
└── package.json
```

## Getting Started

### 1. Clone and Install

```bash
git clone https://github.com/vinchafer/swisssme-leadsearcher.git
cd ai-company-radar
npm install
```

### 2. Environment Variables

Copy `.env.example` to `.env.local` and fill in:

```env
NEXT_PUBLIC_SUPABASE_URL=your_supabase_project_url
NEXT_PUBLIC_SUPABASE_ANON_KEY=your_supabase_anon_key
SUPABASE_SERVICE_ROLE_KEY=your_service_role_key
GROQ_API_KEY=your_groq_api_key
CRON_SECRET=your_cron_secret
```

### 3. Database Setup

Run the migration in Supabase SQL Editor:

```bash
# Or via CLI
supabase db push
```

### 4. Import Data

```bash
# Import all 26 cantons from Zefix CSV
npx tsx scripts/zefix-sync.ts

# Enrich with purpose_text from Zefix API
npm run enrich-purpose-text

# Run NOGA classification
npx tsx scripts/noga-matcher-v2.ts
```

### 5. Run Dev Server

```bash
npm run dev
```

Open [http://localhost:3000](http://localhost:3000)

## Scripts

| Script | Description |
|--------|-------------|
| `zefix-sync.ts` | Imports all ~717k companies from Zefix CSV (26 cantons) |
| `enrich-purpose-text.ts` | Fetches `purpose_text` from Zefix REST API |
| `noga-matcher-v2.ts` | Classifies companies by NOGA 2008 via Groq LLM |
| `setup-db.ts` | Creates/updates DB schema |

## Environment Variables

| Variable | Description | Required |
|----------|-------------|----------|
| `NEXT_PUBLIC_SUPABASE_URL` | Supabase project URL | Yes |
| `NEXT_PUBLIC_SUPABASE_ANON_KEY` | Supabase anon key | Yes |
| `SUPABASE_SERVICE_ROLE_KEY` | Supabase service role (scripts) | Yes |
| `GROQ_API_KEY` | Groq API key for NOGA matching | Yes |
| `CRON_SECRET` | Secret for Vercel cron auth | Yes |

## Cron Jobs

Configured in `vercel.json` — runs monthly:
- `GET /api/cron/zefix-sync` — syncs latest Zefix data

## License

MIT
