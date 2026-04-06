import Link from 'next/link'
import { Company } from '@/lib/types'
import { formatCHF, formatEmployeeRange, getStageColor, getDomainColor } from '@/lib/utils'
import { MapPin, Users, TrendingUp, ExternalLink } from 'lucide-react'

interface CompanyCardProps {
  company: Company
}

export function CompanyCard({ company }: CompanyCardProps) {
  return (
    <Link href={`/companies/${company.slug}`}>
      <div className="group relative h-full rounded-lg border border-[#222222] bg-[#111111] p-5 transition-all duration-150 hover:border-[#3b82f6]/50 hover:shadow-lg hover:shadow-[#3b82f6]/5">
        <div className="flex items-start justify-between gap-3 mb-3">
          <div className="flex items-center gap-3 min-w-0">
            <div className="flex-shrink-0 w-10 h-10 rounded-md bg-[#1a1a1a] border border-[#222222] flex items-center justify-center text-lg font-bold text-[#3b82f6]">
              {company.name.charAt(0)}
            </div>
            <div className="min-w-0">
              <h3 className="font-semibold text-white truncate group-hover:text-[#3b82f6] transition-colors">
                {company.name}
              </h3>
              {company.founded_year && (
                <p className="text-xs text-[#888888]">Est. {company.founded_year}</p>
              )}
            </div>
          </div>
          {company.funding_stage && (
            <span className={`flex-shrink-0 px-2 py-0.5 rounded text-xs font-medium ${getStageColor(company.funding_stage)}`}>
              {company.funding_stage}
            </span>
          )}
        </div>

        {company.description && (
          <p className="text-sm text-[#888888] line-clamp-2 mb-3">
            {company.description}
          </p>
        )}

        <div className="flex flex-wrap gap-1 mb-3">
          {company.domains?.slice(0, 3).map((domain) => (
            <span
              key={domain.id}
              className="px-2 py-0.5 rounded text-xs font-medium"
              style={{ backgroundColor: `${getDomainColor(domain.name)}20`, color: getDomainColor(domain.name) }}
            >
              {domain.name}
            </span>
          ))}
        </div>

        <div className="flex flex-wrap items-center gap-3 text-xs text-[#888888]">
          {(company.headquarters_city || company.headquarters_canton) && (
            <span className="flex items-center gap-1">
              <MapPin className="h-3 w-3" />
              {[company.headquarters_city, company.headquarters_canton].filter(Boolean).join(', ')}
            </span>
          )}
          {(company.employee_count_min || company.employee_count_max) && (
            <span className="flex items-center gap-1">
              <Users className="h-3 w-3" />
              {formatEmployeeRange(company.employee_count_min, company.employee_count_max)}
            </span>
          )}
          {company.funding_total_chf ? (
            <span className="flex items-center gap-1">
              <TrendingUp className="h-3 w-3" />
              {formatCHF(company.funding_total_chf)}
            </span>
          ) : null}
        </div>

        {company.website && (
          <div className="mt-3 pt-3 border-t border-[#222222]">
            <span className="flex items-center gap-1 text-xs text-[#3b82f6] hover:text-[#60a5fa]">
              <ExternalLink className="h-3 w-3" />
              {company.website.replace(/^https?:\/\//, '').replace(/\/$/, '')}
            </span>
          </div>
        )}
      </div>
    </Link>
  )
}

export function CompanyCardSkeleton() {
  return (
    <div className="rounded-lg border border-[#222222] bg-[#111111] p-5 animate-pulse">
      <div className="flex items-start justify-between gap-3 mb-3">
        <div className="flex items-center gap-3">
          <div className="w-10 h-10 rounded-md bg-[#1a1a1a]" />
          <div>
            <div className="h-4 w-32 bg-[#1a1a1a] rounded mb-1" />
            <div className="h-3 w-20 bg-[#1a1a1a] rounded" />
          </div>
        </div>
        <div className="h-5 w-16 bg-[#1a1a1a] rounded" />
      </div>
      <div className="h-3 w-full bg-[#1a1a1a] rounded mb-1" />
      <div className="h-3 w-3/4 bg-[#1a1a1a] rounded mb-3" />
      <div className="flex gap-1">
        <div className="h-5 w-16 bg-[#1a1a1a] rounded" />
        <div className="h-5 w-20 bg-[#1a1a1a] rounded" />
      </div>
    </div>
  )
}
