'use client'
import { StatsResponse } from '@/lib/types'

interface CantonMapProps {
  cantonBreakdown: StatsResponse['cantonBreakdown']
}

export function CantonMap({ cantonBreakdown }: CantonMapProps) {
  const max = Math.max(...cantonBreakdown.map(c => c.count), 1)

  return (
    <div className="bg-[#111111] border border-[#222222] rounded-lg p-5">
      <h3 className="text-sm font-semibold text-white mb-4">Companies by Canton</h3>
      <div className="grid grid-cols-2 sm:grid-cols-3 gap-2">
        {cantonBreakdown.slice(0, 12).map(({ canton, count }) => (
          <div key={canton} className="flex items-center justify-between bg-[#1a1a1a] rounded-md px-3 py-2">
            <span className="text-sm font-medium text-white">{canton}</span>
            <div className="flex items-center gap-2">
              <div className="h-1.5 rounded-full bg-[#3b82f6]" style={{ width: `${Math.max((count / max) * 60, 8)}px` }} />
              <span className="text-xs text-[#888888]">{count}</span>
            </div>
          </div>
        ))}
      </div>
    </div>
  )
}
