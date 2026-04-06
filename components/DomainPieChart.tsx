'use client'
import { PieChart, Pie, Cell, Tooltip, ResponsiveContainer, Legend } from 'recharts'
import { getDomainColor } from '@/lib/utils'

interface DomainPieChartProps {
  data: { name: string; count: number }[]
}

export function DomainPieChart({ data }: DomainPieChartProps) {
  return (
    <div className="bg-[#111111] border border-[#222222] rounded-lg p-5">
      <h3 className="text-sm font-semibold text-white mb-4">AI Domain Distribution</h3>
      <ResponsiveContainer width="100%" height={220}>
        <PieChart>
          <Pie
            data={data}
            cx="50%"
            cy="50%"
            innerRadius={60}
            outerRadius={90}
            paddingAngle={2}
            dataKey="count"
          >
            {data.map((entry) => (
              <Cell key={entry.name} fill={getDomainColor(entry.name)} />
            ))}
          </Pie>
          <Tooltip
            contentStyle={{ backgroundColor: '#1a1a1a', border: '1px solid #222222', borderRadius: '6px' }}
            labelStyle={{ color: '#ffffff' }}
            itemStyle={{ color: '#888888' }}
          />
          <Legend
            formatter={(value) => <span style={{ color: '#888888', fontSize: '11px' }}>{value}</span>}
          />
        </PieChart>
      </ResponsiveContainer>
    </div>
  )
}
