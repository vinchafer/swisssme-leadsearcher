'use client'
import { BarChart, Bar, XAxis, YAxis, Tooltip, ResponsiveContainer, Cell } from 'recharts'
import { StatsResponse } from '@/lib/types'

interface FundingChartProps {
  data: StatsResponse['stageBreakdown']
}

const COLORS = ['#3b82f6', '#22c55e', '#f97316', '#818cf8', '#ec4899', '#eab308', '#06b6d4', '#a855f7', '#ef4444', '#888888']

export function FundingChart({ data }: FundingChartProps) {
  const sorted = [...data].sort((a, b) => b.count - a.count)

  return (
    <div className="bg-[#111111] border border-[#222222] rounded-lg p-5">
      <h3 className="text-sm font-semibold text-white mb-4">Companies by Funding Stage</h3>
      <ResponsiveContainer width="100%" height={220}>
        <BarChart data={sorted} margin={{ top: 0, right: 0, left: -20, bottom: 0 }}>
          <XAxis dataKey="stage" tick={{ fill: '#888888', fontSize: 11 }} axisLine={false} tickLine={false} />
          <YAxis tick={{ fill: '#888888', fontSize: 11 }} axisLine={false} tickLine={false} />
          <Tooltip
            contentStyle={{ backgroundColor: '#1a1a1a', border: '1px solid #222222', borderRadius: '6px' }}
            labelStyle={{ color: '#ffffff' }}
            itemStyle={{ color: '#888888' }}
          />
          <Bar dataKey="count" radius={[4, 4, 0, 0]}>
            {sorted.map((_, index) => (
              <Cell key={`cell-${index}`} fill={COLORS[index % COLORS.length]} />
            ))}
          </Bar>
        </BarChart>
      </ResponsiveContainer>
    </div>
  )
}
