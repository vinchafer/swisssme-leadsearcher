import { formatCHF } from '@/lib/utils'
import { StatsResponse } from '@/lib/types'
import { Building2, TrendingUp, Map, Calendar } from 'lucide-react'

interface StatsBarProps {
  stats: StatsResponse
}

export function StatsBar({ stats }: StatsBarProps) {
  return (
    <div className="grid grid-cols-2 lg:grid-cols-4 gap-4">
      {[
        { icon: Building2, label: 'Companies', value: stats.totalCompanies.toString(), color: '#3b82f6' },
        { icon: TrendingUp, label: 'Total Funding', value: formatCHF(stats.totalFundingChf), color: '#22c55e' },
        { icon: Map, label: 'Cantons', value: stats.cantonsRepresented.toString(), color: '#f97316' },
        { icon: Calendar, label: 'Avg. Founded', value: stats.avgFoundedYear.toString(), color: '#818cf8' },
      ].map(({ icon: Icon, label, value, color }) => (
        <div key={label} className="bg-[#111111] border border-[#222222] rounded-lg p-4 flex items-center gap-3">
          <div className="p-2 rounded-md" style={{ backgroundColor: `${color}20` }}>
            <Icon className="h-5 w-5" style={{ color }} />
          </div>
          <div>
            <p className="text-2xl font-bold text-white">{value}</p>
            <p className="text-xs text-[#888888]">{label}</p>
          </div>
        </div>
      ))}
    </div>
  )
}
