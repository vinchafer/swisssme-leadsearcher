import { FundingRound } from '@/lib/types'
import { formatCHF } from '@/lib/utils'
import { Calendar, TrendingUp } from 'lucide-react'

interface FundingTimelineProps {
  rounds: FundingRound[]
}

export function FundingTimeline({ rounds }: FundingTimelineProps) {
  if (rounds.length === 0) return null

  const sorted = [...rounds].sort((a, b) => {
    if (!a.announced_date || !b.announced_date) return 0
    return new Date(b.announced_date).getTime() - new Date(a.announced_date).getTime()
  })

  return (
    <div>
      <h2 className="text-lg font-semibold text-white mb-4">Funding History</h2>
      <div className="space-y-3">
        {sorted.map((round) => (
          <div key={round.id} className="flex items-start gap-3 bg-[#111111] border border-[#222222] rounded-lg p-4">
            <div className="p-1.5 rounded-md bg-[#22c55e]/20">
              <TrendingUp className="h-4 w-4 text-[#22c55e]" />
            </div>
            <div className="flex-1">
              <div className="flex items-center justify-between">
                <span className="font-medium text-white">{round.round_type ?? 'Unknown Round'}</span>
                <span className="font-bold text-[#22c55e]">{formatCHF(round.amount_chf)}</span>
              </div>
              {round.announced_date && (
                <div className="flex items-center gap-1 text-xs text-[#888888] mt-1">
                  <Calendar className="h-3 w-3" />
                  {new Date(round.announced_date).toLocaleDateString('en-CH', { year: 'numeric', month: 'long' })}
                </div>
              )}
              {round.lead_investor && (
                <p className="text-xs text-[#888888] mt-0.5">Lead: {round.lead_investor}</p>
              )}
            </div>
          </div>
        ))}
      </div>
    </div>
  )
}
