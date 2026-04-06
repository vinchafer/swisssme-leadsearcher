# Swiss AI Radar — AI Company Directory Switzerland

A full-stack Next.js 14 application for discovering and exploring AI companies based in Switzerland. Filter by domain, canton, funding stage, and more.

## Overview

Swiss AI Radar is a comprehensive directory of 30+ Swiss AI companies with:
- Advanced filtering by canton, AI domain, funding stage, and founded year
- Card and table view modes
- Company detail pages with funding history
- Interactive charts showing domain distribution and funding stages
- Canton-based company distribution map
- Full-text search

## Tech Stack

- **Framework**: Next.js 14 (App Router)
- **Language**: TypeScript
- **Styling**: Tailwind CSS v4
- **Database**: Supabase (PostgreSQL)
- **UI Components**: shadcn/ui
- **Charts**: Recharts
- **Icons**: Lucide React

## Getting Started

### 1. Clone and Install

```bash
git clone <repository-url>
cd ai-company-radar
npm install
```

### 2. Set Up Environment Variables

Edit `.env.local`:

```env
NEXT_PUBLIC_SUPABASE_URL=your_supabase_project_url
NEXT_PUBLIC_SUPABASE_ANON_KEY=your_supabase_anon_key
NEXT_PUBLIC_SITE_URL=http://localhost:3000
```

### 3. Set Up Supabase Database

#### Create a Supabase Project

1. Go to [supabase.com](https://supabase.com) and create a new project
2. Copy your project URL and anon key into `.env.local`

#### Run the Migration

In the Supabase SQL Editor, run the contents of `supabase/migrations/001_initial_schema.sql`

#### Seed the Database

In the Supabase SQL Editor, run the contents of `supabase/seed.sql`

### 4. Run Development Server

```bash
npm run dev
```

Open [http://localhost:3000](http://localhost:3000) in your browser.

## Environment Variables

| Variable | Description | Required |
|----------|-------------|----------|
| `NEXT_PUBLIC_SUPABASE_URL` | Your Supabase project URL | Yes |
| `NEXT_PUBLIC_SUPABASE_ANON_KEY` | Your Supabase anonymous key | Yes |
| `NEXT_PUBLIC_SITE_URL` | The public URL of your site | No |

## Database Schema

The database consists of the following tables:

- **companies** — Main company data (name, location, funding, etc.)
- **ai_domains** — AI technology domains (NLP, Computer Vision, etc.)
- **company_categories** — Company types (B2B SaaS, Deep Tech, etc.)
- **company_tags** — Searchable tags for companies
- **funding_rounds** — Individual funding round records
- **company_domain_map** — Many-to-many: companies to domains
- **company_category_map** — Many-to-many: companies to categories
- **company_tag_map** — Many-to-many: companies to tags

## Deployment

### Deploy to Vercel

```bash
npm install -g vercel
vercel --prod
```

Or connect your GitHub repository to Vercel and it will auto-deploy.

Make sure to add your environment variables in the Vercel project settings.

## Project Structure

```
ai-company-radar/
├── app/                    # Next.js App Router pages
│   ├── api/                # API routes
│   │   ├── companies/      # Companies endpoint
│   │   └── stats/          # Statistics endpoint
│   ├── companies/          # Companies directory page
│   │   └── [slug]/         # Company detail page
│   ├── layout.tsx          # Root layout
│   ├── page.tsx            # Homepage
│   └── globals.css         # Global styles
├── components/             # React components
│   ├── Navbar.tsx
│   ├── CompanyCard.tsx
│   ├── CompanyTable.tsx
│   ├── FilterSidebar.tsx
│   ├── FilterChips.tsx
│   ├── FundingChart.tsx
│   ├── DomainPieChart.tsx
│   ├── CantonMap.tsx
│   ├── StatsBar.tsx
│   └── ...
├── hooks/                  # Custom React hooks
│   ├── useFilters.ts
│   ├── useCompanies.ts
│   └── useDebounce.ts
├── lib/                    # Utilities and data layer
│   ├── types.ts            # TypeScript interfaces
│   ├── supabase.ts         # Supabase client
│   ├── queries.ts          # Database queries
│   ├── filters.ts          # Filter utilities
│   └── utils.ts            # Helper functions
└── supabase/               # Database files
    ├── migrations/         # Schema migrations
    └── seed.sql            # Seed data
```

## License

MIT
