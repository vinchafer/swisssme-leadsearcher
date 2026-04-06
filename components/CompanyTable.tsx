'use client'
import Link from 'next/link'
import { Company } from '@/lib/types'
import { formatCHF, formatEmployeeRange, getStageColor, getDomainColor } from '@/lib/utils'
import { ExternalLink } from 'lucide-react'

interface CompanyTableProps {
  companies: Company[]
}

export function CompanyTable({ companies }: CompanyTableProps) {
  if (companies.length === 0) {
    return (
      <div className="text-center py-16 text-[#888888]">
        <p className="text-lg">No companies found</p>
        <p className="text-sm mt-1">Try adjusting your filters</p>
      </div>
    )
  }

  return (
    <div className="overflow-x-auto rounded-lg border border-[#222222]">
      <table className="w-full text-sm">
        <thead>
          <tr className="border-b border-[#222222] bg-[#111111]">
            <th className="text-left px-4 py-3 text-[#888888] font-medium">Company</th>
            <th className="text-left px-4 py-3 text-[#888888] font-medium hidden md:table-cell">City</th>
            <th className="text-left px-4 py-3 text-[#888888] font-medium hidden md:table-cell">Canton</th>
            <th className="text-left px-4 py-3 text-[#888888] font-medium hidden lg:table-cell">Domain</th>
            <th className="text-left px-4 py-3 text-[#888888] font-medium">Stage</th>
            <th className="text-left px-4 py-3 text-[#888888] font-medium hidden lg:table-cell">Founded</th>
            <th className="text-left px-4 py-3 text-[#888888] font-medium hidden xl:table-cell">Funding</th>
            <th className="text-left px-4 py-3 text-[#888888] font-medium hidden sm:table-cell">Employees</th>
          </tr>
        </thead>
        <tbody>
          {companies.map((company, i) => (
            <tr
              key={company.id}
              className={`border-b border-[#222222] hover:bg-[#1a1a1a] transition-colors ${i % 2 === 0 ? 'bg-[#0d0d0d]' : 'bg-[#111111]'}`}
            >
              <td className="px-4 py-3">
                <Link href={`/companies/${company.slug}`} className="flex items-center gap-2 hover:text-[#3b82f6] transition-colors">
                  <div className="w-7 h-7 rounded bg-[#1a1a1a] border border-[#222222] flex items-center justify-center text-xs font-bold text-[#3b82f6] flex-shrink-0">
                    {company.name.charAt(0)}
                  </div>
                  <div>
                    <div className="font-medium text-white">{company.name}</div>
                    {company.website && (
                      <a href={company.website} target="_blank" rel="noopener noreferrer" className="text-xs text-[#444444] hover:text-[#3b82f6] flex items-center gap-0.5" onClick={e => e.stopPropagation()}>
                        <ExternalLink className="h-2.5 w-2.5" />
                        {company.website.replace(/^https?:\/\//, '').replace(/\/$/, '').slice(0, 30)}
                      </a>
                    )}
                  </div>
                </Link>
              </td>
              <td className="px-4 py-3 text-[#888888] hidden md:table-cell">{company.headquarters_city ?? '—'}</td>
              <td className="px-4 py-3 hidden md:table-cell">
                {company.headquarters_canton && (
                  <span className="px-2 py-0.5 rounded bg-[#1a1a1a] text-[#888888] text-xs">{company.headquarters_canton}</span>
                )}
              </td>
              <td className="px-4 py-3 hidden lg:table-cell">
                <div className="flex flex-wrap gap-1">
                  {company.domains?.slice(0, 2).map(d => (
                    <span key={d.id} className="px-1.5 py-0.5 rounded text-xs" style={{ backgroundColor: `${getDomainColor(d.name)}20`, color: getDomainColor(d.name) }}>
                      {d.name}
                    </span>
                  ))}
                </div>
              </td>
              <td className="px-4 py-3">
                {company.funding_stage && (
                  <span className={`px-2 py-0.5 rounded text-xs font-medium ${getStageColor(company.funding_stage)}`}>
                    {company.funding_stage}
                  </span>
                )}
              </td>
              <td className="px-4 py-3 text-[#888888] hidden lg:table-cell">{company.founded_year ?? '—'}</td>
              <td className="px-4 py-3 text-[#888888] hidden xl:table-cell">{formatCHF(company.funding_total_chf)}</td>
              <td className="px-4 py-3 text-[#888888] hidden sm:table-cell">{formatEmployeeRange(company.employee_count_min, company.employee_count_max)}</td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  )
}
