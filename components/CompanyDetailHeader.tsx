import { Company } from '@/lib/types'
import { formatCHF, formatEmployeeRange, getStageColor, getDomainColor } from '@/lib/utils'
import { MapPin, Users, Globe, TrendingUp, Calendar, Building2 } from 'lucide-react'

interface CompanyDetailHeaderProps {
  company: Company
}

export function CompanyDetailHeader({ company }: CompanyDetailHeaderProps) {
  return (
    <div className="bg-[#111111] border border-[#222222] rounded-lg p-6 lg:p-8">
      <div className="flex items-start gap-4 mb-6">
        <div className="w-16 h-16 rounded-xl bg-[#1a1a1a] border border-[#222222] flex items-center justify-center text-2xl font-bold text-[#3b82f6] flex-shrink-0">
          {company.name.charAt(0)}
        </div>
        <div className="flex-1 min-w-0">
          <div className="flex flex-wrap items-center gap-2 mb-1">
            <h1 className="text-2xl font-bold text-white">{company.name}</h1>
            {company.funding_stage && (
              <span className={`px-2.5 py-0.5 rounded text-sm font-medium ${getStageColor(company.funding_stage)}`}>
                {company.funding_stage}
              </span>
            )}
            {company.is_public && (
              <span className="px-2.5 py-0.5 rounded text-sm font-medium bg-teal-900 text-teal-300">Public</span>
            )}
          </div>
          {company.website && (
            <a href={company.website} target="_blank" rel="noopener noreferrer" className="flex items-center gap-1 text-[#3b82f6] hover:text-[#60a5fa] text-sm transition-colors">
              <Globe className="h-3.5 w-3.5" />
              {company.website.replace(/^https?:\/\//, '').replace(/\/$/, '')}
            </a>
          )}
        </div>
      </div>

      {company.description && (
        <p className="text-[#888888] leading-relaxed mb-6">{company.description}</p>
      )}

      <div className="grid grid-cols-2 sm:grid-cols-3 lg:grid-cols-5 gap-4 mb-6">
        {[
          { icon: MapPin, label: 'Location', value: [company.headquarters_city, company.headquarters_canton].filter(Boolean).join(', ') || 'N/A' },
          { icon: Calendar, label: 'Founded', value: company.founded_year?.toString() ?? 'N/A' },
          { icon: Users, label: 'Employees', value: formatEmployeeRange(company.employee_count_min, company.employee_count_max) },
          { icon: TrendingUp, label: 'Total Funding', value: formatCHF(company.funding_total_chf) },
          { icon: Building2, label: 'Type', value: company.is_public ? 'Public' : 'Private' },
        ].map(({ icon: Icon, label, value }) => (
          <div key={label} className="bg-[#1a1a1a] rounded-lg p-3">
            <div className="flex items-center gap-1.5 text-[#888888] text-xs mb-1">
              <Icon className="h-3 w-3" />
              {label}
            </div>
            <p className="text-white font-medium text-sm">{value}</p>
          </div>
        ))}
      </div>

      <div className="flex flex-wrap gap-2">
        {company.domains?.map(domain => (
          <span
            key={domain.id}
            className="px-3 py-1 rounded-full text-sm font-medium"
            style={{ backgroundColor: `${getDomainColor(domain.name)}20`, color: getDomainColor(domain.name) }}
          >
            {domain.name}
          </span>
        ))}
        {company.categories?.map(cat => (
          <span key={cat.id} className="px-3 py-1 rounded-full text-sm font-medium bg-[#1a1a1a] text-[#888888] border border-[#222222]">
            {cat.name}
          </span>
        ))}
        {company.tags?.map(tag => (
          <span key={tag.id} className="px-3 py-1 rounded-full text-xs bg-[#1a1a1a] text-[#444444] border border-[#222222]">
            #{tag.name}
          </span>
        ))}
      </div>
    </div>
  )
}
