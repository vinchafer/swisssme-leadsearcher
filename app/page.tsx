import Link from 'next/link'
import { getStats, getCompanies } from '@/lib/queries'
import { StatsBar } from '@/components/StatsBar'
import { FundingChart } from '@/components/FundingChart'
import { DomainPieChart } from '@/components/DomainPieChart'
import { CompanyCard } from '@/components/CompanyCard'
import { CantonMap } from '@/components/CantonMap'
import { ArrowRight, Radar } from 'lucide-react'

export const dynamic = 'force-dynamic'

export default async function HomePage() {
  let stats
  let latestCompanies

  try {
    ;[stats, latestCompanies] = await Promise.all([
      getStats(),
      getCompanies({ sort: 'name', order: 'asc', limit: 6, page: 1 }),
    ])
  } catch {
    stats = {
      totalCompanies: 0,
      totalFundingChf: 0,
      cantonsRepresented: 0,
      avgFoundedYear: 0,
      domainBreakdown: [],
      stageBreakdown: [],
      cantonBreakdown: [],
    }
    latestCompanies = { data: [], count: 0, page: 1, totalPages: 0 }
  }

  const domainData = [
    { name: 'NLP', count: 8 },
    { name: 'Computer Vision', count: 6 },
    { name: 'FinTech AI', count: 7 },
    { name: 'HealthTech AI', count: 4 },
    { name: 'Data Analytics', count: 5 },
    { name: 'Generative AI', count: 3 },
    { name: 'MLOps', count: 3 },
    { name: 'Robotic AI', count: 2 },
    { name: 'Cybersecurity AI', count: 1 },
    { name: 'Other', count: 1 },
  ]

  return (
    <div className="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8 py-12">
      {/* Hero */}
      <div className="text-center mb-16">
        <div className="flex justify-center mb-6">
          <div className="p-4 rounded-2xl bg-[#3b82f6]/10 border border-[#3b82f6]/20">
            <Radar className="h-12 w-12 text-[#3b82f6]" />
          </div>
        </div>
        <h1 className="text-4xl sm:text-5xl lg:text-6xl font-bold text-white mb-4">
          Swiss AI Company Radar
        </h1>
        <p className="text-lg text-[#888888] max-w-2xl mx-auto mb-8">
          Discover and explore AI companies based in Switzerland. Filter by domain, canton, funding stage, and more.
        </p>
        <Link
          href="/companies"
          className="inline-flex items-center gap-2 bg-[#3b82f6] hover:bg-[#2563eb] text-white px-6 py-3 rounded-lg font-medium transition-colors"
        >
          Explore {stats.totalCompanies > 0 ? stats.totalCompanies : '30+'} Companies
          <ArrowRight className="h-4 w-4" />
        </Link>
      </div>

      {/* Stats */}
      <div className="mb-12">
        <StatsBar stats={stats} />
      </div>

      {/* Charts */}
      <div className="grid grid-cols-1 lg:grid-cols-2 gap-6 mb-12">
        <DomainPieChart data={domainData} />
        <FundingChart data={stats.stageBreakdown.length > 0 ? stats.stageBreakdown : [
          { stage: 'Seed', count: 8 },
          { stage: 'Series A', count: 7 },
          { stage: 'Series B', count: 6 },
          { stage: 'Bootstrapped', count: 4 },
          { stage: 'Growth', count: 3 },
          { stage: 'Pre-Seed', count: 2 },
        ]} />
      </div>

      {/* Canton Map */}
      {stats.cantonBreakdown.length > 0 && (
        <div className="mb-12">
          <CantonMap cantonBreakdown={stats.cantonBreakdown} />
        </div>
      )}

      {/* Latest Companies */}
      {latestCompanies.data.length > 0 && (
        <div>
          <div className="flex items-center justify-between mb-6">
            <h2 className="text-xl font-semibold text-white">Featured Companies</h2>
            <Link href="/companies" className="text-sm text-[#3b82f6] hover:text-[#60a5fa] flex items-center gap-1 transition-colors">
              View all <ArrowRight className="h-3 w-3" />
            </Link>
          </div>
          <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-4">
            {latestCompanies.data.map(company => (
              <CompanyCard key={company.id} company={company} />
            ))}
          </div>
        </div>
      )}
    </div>
  )
}
