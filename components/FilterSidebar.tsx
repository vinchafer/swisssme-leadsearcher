'use client'
import { useState, useEffect } from 'react'
import { ChevronDown, ChevronUp, RotateCcw } from 'lucide-react'
import { CompanyFilters } from '@/lib/types'
import { AI_DOMAINS, FUNDING_STAGES, SWISS_CANTONS, NOGA_SECTIONS, LEGAL_FORMS } from '@/lib/filters'
import { SearchBar } from './SearchBar'
import { useDebounce } from '@/hooks/useDebounce'

function formatCHF(val: number): string {
  return 'CHF ' + val.toLocaleString('de-CH')
}

function TriToggle({ value, onChange }: { value: boolean | null; onChange: (v: boolean | null) => void }) {
  const options: { label: string; value: boolean | null }[] = [
    { label: 'Alle', value: null },
    { label: 'Ja', value: true },
    { label: 'Nein', value: false },
  ]
  return (
    <div className="flex rounded border border-[#222222] overflow-hidden">
      {options.map(opt => (
        <button
          key={String(opt.value)}
          onClick={() => onChange(opt.value)}
          className={`flex-1 py-1.5 text-sm transition-colors ${
            value === opt.value
              ? 'bg-[#3b82f6] text-white'
              : 'bg-[#1a1a1a] text-[#888888] hover:text-white'
          }`}
        >
          {opt.label}
        </button>
      ))}
    </div>
  )
}

interface FilterSidebarProps {
  filters: CompanyFilters
  onFiltersChange: (filters: Partial<CompanyFilters>) => void
  onReset: () => void
  activeFilterCount: number
  resultCount: number
}

function FilterSection({ title, defaultOpen = true, children }: { title: string; defaultOpen?: boolean; children: React.ReactNode }) {
  const [open, setOpen] = useState(defaultOpen)
  return (
    <div className="border-b border-[#222222] py-4">
      <button onClick={() => setOpen(!open)} className="flex w-full items-center justify-between text-sm font-medium text-white mb-3">
        {title}
        {open ? <ChevronUp className="h-4 w-4 text-[#888888]" /> : <ChevronDown className="h-4 w-4 text-[#888888]" />}
      </button>
      {open && children}
    </div>
  )
}

function MultiCheckbox({ options, selected, onChange }: { options: string[]; selected: string[]; onChange: (values: string[]) => void }) {
  const toggle = (val: string) => {
    onChange(selected.includes(val) ? selected.filter(v => v !== val) : [...selected, val])
  }
  return (
    <div className="space-y-2 max-h-48 overflow-y-auto scrollbar-thin">
      {options.map(opt => (
        <label key={opt} className="flex items-center gap-2 cursor-pointer group">
          <input
            type="checkbox"
            checked={selected.includes(opt)}
            onChange={() => toggle(opt)}
            className="rounded border-[#444444] bg-[#1a1a1a] text-[#3b82f6] focus:ring-[#3b82f6] focus:ring-offset-0"
          />
          <span className="text-sm text-[#888888] group-hover:text-white transition-colors">{opt}</span>
        </label>
      ))}
    </div>
  )
}

export function FilterSidebar({ filters, onFiltersChange, onReset, activeFilterCount, resultCount }: FilterSidebarProps) {
  const [localSearch, setLocalSearch] = useState(filters.search)
  const debouncedSearch = useDebounce(localSearch, 300)
  const [nogaSection, setNogaSection] = useState<string>('')

  useEffect(() => {
    if (debouncedSearch !== filters.search) {
      onFiltersChange({ search: debouncedSearch })
    }
  // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [debouncedSearch])

  const cantonOptions = SWISS_CANTONS.map(c => c.code)

  return (
    <aside className="w-full lg:w-72 flex-shrink-0">
      <div className="bg-[#111111] border border-[#222222] rounded-lg p-4 sticky top-20">
        <div className="flex items-center justify-between mb-4">
          <div>
            <h2 className="font-semibold text-white">Filters</h2>
            <p className="text-xs text-[#888888]">{resultCount} companies</p>
          </div>
          {activeFilterCount > 0 && (
            <button onClick={onReset} className="flex items-center gap-1 text-xs text-[#888888] hover:text-white transition-colors">
              <RotateCcw className="h-3 w-3" />
              Reset{' '}
              <span className="bg-[#3b82f6] text-white rounded-full w-4 h-4 flex items-center justify-center text-[10px]">{activeFilterCount}</span>
            </button>
          )}
        </div>

        <div className="mb-4">
          <SearchBar
            value={localSearch}
            onChange={(val) => {
              setLocalSearch(val)
            }}
          />
        </div>

        <FilterSection title="AI Domain">
          <MultiCheckbox
            options={AI_DOMAINS}
            selected={filters.domains}
            onChange={(domains) => onFiltersChange({ domains })}
          />
        </FilterSection>

        <FilterSection title="Funding Stage">
          <MultiCheckbox
            options={FUNDING_STAGES}
            selected={filters.stages}
            onChange={(stages) => onFiltersChange({ stages })}
          />
        </FilterSection>

        <FilterSection title="Canton" defaultOpen={false}>
          <MultiCheckbox
            options={cantonOptions}
            selected={filters.cantons}
            onChange={(cantons) => onFiltersChange({ cantons })}
          />
        </FilterSection>

        <FilterSection title="Founded Year" defaultOpen={false}>
          <div className="flex items-center gap-2">
            <input
              type="number"
              min={2000}
              max={filters.founded_max}
              value={filters.founded_min}
              onChange={(e) => onFiltersChange({ founded_min: parseInt(e.target.value) })}
              className="w-full px-2 py-1.5 bg-[#1a1a1a] border border-[#222222] rounded text-white text-sm focus:outline-none focus:border-[#3b82f6]"
            />
            <span className="text-[#888888]">–</span>
            <input
              type="number"
              min={filters.founded_min}
              max={2024}
              value={filters.founded_max}
              onChange={(e) => onFiltersChange({ founded_max: parseInt(e.target.value) })}
              className="w-full px-2 py-1.5 bg-[#1a1a1a] border border-[#222222] rounded text-white text-sm focus:outline-none focus:border-[#3b82f6]"
            />
          </div>
        </FilterSection>

        <FilterSection title="Public Companies" defaultOpen={false}>
          <label className="flex items-center gap-2 cursor-pointer">
            <input
              type="checkbox"
              checked={filters.is_public === true}
              onChange={(e) => onFiltersChange({ is_public: e.target.checked ? true : null })}
              className="rounded border-[#444444] bg-[#1a1a1a] text-[#3b82f6]"
            />
            <span className="text-sm text-[#888888]">Public companies only</span>
          </label>
        </FilterSection>

        <FilterSection title="PLZ-Bereich" defaultOpen={false}>
          <div className="flex items-center gap-2">
            <input
              type="text"
              placeholder="Von PLZ"
              maxLength={4}
              value={filters.zip_from}
              onChange={(e) => onFiltersChange({ zip_from: e.target.value })}
              className="w-full px-2 py-1.5 bg-[#1a1a1a] border border-[#222222] rounded text-white text-sm focus:outline-none focus:border-[#3b82f6] placeholder-[#444444]"
            />
            <span className="text-[#888888]">–</span>
            <input
              type="text"
              placeholder="Bis PLZ"
              maxLength={4}
              value={filters.zip_to}
              onChange={(e) => onFiltersChange({ zip_to: e.target.value })}
              className="w-full px-2 py-1.5 bg-[#1a1a1a] border border-[#222222] rounded text-white text-sm focus:outline-none focus:border-[#3b82f6] placeholder-[#444444]"
            />
          </div>
        </FilterSection>

        <FilterSection title="NOGA Branche" defaultOpen={false}>
          <div className="space-y-2">
            <select
              value={nogaSection}
              onChange={(e) => setNogaSection(e.target.value)}
              className="w-full px-2 py-1.5 bg-[#1a1a1a] border border-[#222222] rounded text-white text-sm focus:outline-none focus:border-[#3b82f6]"
            >
              <option value="">Sektion wählen…</option>
              {NOGA_SECTIONS.map(s => (
                <option key={s.section} value={s.section}>
                  {s.section} – {s.label}
                </option>
              ))}
            </select>
            {nogaSection && (
              <MultiCheckbox
                options={NOGA_SECTIONS.find(s => s.section === nogaSection)?.codes ?? []}
                selected={filters.noga_codes}
                onChange={(noga_codes) => onFiltersChange({ noga_codes })}
              />
            )}
          </div>
        </FilterSection>

        <FilterSection title="Rechtsform" defaultOpen={false}>
          <MultiCheckbox
            options={LEGAL_FORMS}
            selected={filters.legal_forms}
            onChange={(legal_forms) => onFiltersChange({ legal_forms })}
          />
        </FilterSection>

        <FilterSection title="Revisionsstelle" defaultOpen={false}>
          <TriToggle
            value={filters.has_auditor}
            onChange={(has_auditor) => onFiltersChange({ has_auditor })}
          />
        </FilterSection>

        <FilterSection title="Kapital" defaultOpen={false}>
          <div className="space-y-3">
            <div>
              <div className="flex justify-between text-xs text-[#888888] mb-1">
                <span>Min</span>
                <span>{formatCHF(filters.capital_min)}</span>
              </div>
              <input
                type="range"
                min={0}
                max={10_000_000}
                step={100_000}
                value={filters.capital_min}
                onChange={(e) => onFiltersChange({ capital_min: parseInt(e.target.value) })}
                className="w-full accent-[#3b82f6]"
              />
            </div>
            <div>
              <div className="flex justify-between text-xs text-[#888888] mb-1">
                <span>Max</span>
                <span>{formatCHF(filters.capital_max)}</span>
              </div>
              <input
                type="range"
                min={0}
                max={10_000_000}
                step={100_000}
                value={filters.capital_max}
                onChange={(e) => onFiltersChange({ capital_max: parseInt(e.target.value) })}
                className="w-full accent-[#3b82f6]"
              />
            </div>
          </div>
        </FilterSection>
      </div>
    </aside>
  )
}
