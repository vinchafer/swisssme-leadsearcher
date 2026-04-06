'use client'
import { X } from 'lucide-react'
import { CompanyFilters } from '@/lib/types'
import { DEFAULT_FILTERS } from '@/lib/filters'

interface FilterChipsProps {
  filters: CompanyFilters
  onRemove: (key: keyof CompanyFilters, value?: string) => void
  onReset: () => void
}

export function FilterChips({ filters, onRemove, onReset }: FilterChipsProps) {
  const chips: { label: string; onRemove: () => void }[] = []

  if (filters.search) chips.push({ label: `Search: "${filters.search}"`, onRemove: () => onRemove('search') })
  filters.cantons.forEach(c => chips.push({ label: `Canton: ${c}`, onRemove: () => onRemove('cantons', c) }))
  filters.cities.forEach(c => chips.push({ label: `City: ${c}`, onRemove: () => onRemove('cities', c) }))
  filters.domains.forEach(d => chips.push({ label: `Domain: ${d}`, onRemove: () => onRemove('domains', d) }))
  filters.categories.forEach(c => chips.push({ label: `Category: ${c}`, onRemove: () => onRemove('categories', c) }))
  filters.stages.forEach(s => chips.push({ label: `Stage: ${s}`, onRemove: () => onRemove('stages', s) }))
  if (filters.is_public !== null) chips.push({ label: filters.is_public ? 'Public companies only' : 'Private only', onRemove: () => onRemove('is_public') })
  if (filters.founded_min !== DEFAULT_FILTERS.founded_min || filters.founded_max !== DEFAULT_FILTERS.founded_max) {
    chips.push({ label: `Founded: ${filters.founded_min}–${filters.founded_max}`, onRemove: () => onRemove('founded_min') })
  }

  if (chips.length === 0) return null

  return (
    <div className="flex flex-wrap gap-2 items-center">
      {chips.map((chip, i) => (
        <button
          key={i}
          onClick={chip.onRemove}
          className="flex items-center gap-1 px-2.5 py-1 rounded-full bg-[#1a1a1a] border border-[#3b82f6]/30 text-[#3b82f6] text-xs hover:border-[#3b82f6] hover:bg-[#3b82f6]/10 transition-colors"
        >
          {chip.label}
          <X className="h-3 w-3" />
        </button>
      ))}
      {chips.length > 1 && (
        <button
          onClick={onReset}
          className="text-xs text-[#888888] hover:text-white underline transition-colors"
        >
          Reset all
        </button>
      )}
    </div>
  )
}
