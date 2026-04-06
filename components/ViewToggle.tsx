'use client'
import { LayoutGrid, Table2 } from 'lucide-react'

interface ViewToggleProps {
  view: 'card' | 'table'
  onToggle: (view: 'card' | 'table') => void
}

export function ViewToggle({ view, onToggle }: ViewToggleProps) {
  return (
    <div className="flex items-center gap-1 p-1 bg-[#1a1a1a] border border-[#222222] rounded-md">
      <button
        onClick={() => onToggle('card')}
        className={`p-1.5 rounded transition-colors ${view === 'card' ? 'bg-[#3b82f6] text-white' : 'text-[#888888] hover:text-white'}`}
        title="Card view"
      >
        <LayoutGrid className="h-4 w-4" />
      </button>
      <button
        onClick={() => onToggle('table')}
        className={`p-1.5 rounded transition-colors ${view === 'table' ? 'bg-[#3b82f6] text-white' : 'text-[#888888] hover:text-white'}`}
        title="Table view"
      >
        <Table2 className="h-4 w-4" />
      </button>
    </div>
  )
}
