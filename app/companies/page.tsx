'use client'
import { useState, Suspense } from 'react'
import { useFilters } from '@/hooks/useFilters'
import { useCompanies } from '@/hooks/useCompanies'
import { FilterSidebar } from '@/components/FilterSidebar'
import { FilterChips } from '@/components/FilterChips'
import { CompanyCard, CompanyCardSkeleton } from '@/components/CompanyCard'
import { CompanyTable } from '@/components/CompanyTable'
import { ViewToggle } from '@/components/ViewToggle'
import { CompanyFilters } from '@/lib/types'
import { SlidersHorizontal, ChevronDown } from 'lucide-react'

function CompaniesContent() {
  const { filters, setFilters, resetFilters, activeFilterCount } = useFilters()
  const { companies, count, totalPages, loading } = useCompanies(filters)
  const [view, setView] = useState<'card' | 'table'>('card')
  const [sidebarOpen, setSidebarOpen] = useState(false)

  const handleFilterRemove = (key: keyof CompanyFilters, value?: string) => {
    if (value && Array.isArray(filters[key])) {
      const arr = filters[key] as string[]
      setFilters({ [key]: arr.filter(v => v !== value) } as Partial<CompanyFilters>)
    } else {
      if (key === 'is_public') {
        setFilters({ is_public: null })
      } else if (key === 'search') {
        setFilters({ search: '' })
      } else if (key === 'founded_min' || key === 'founded_max') {
        setFilters({ founded_min: 2000, founded_max: 2024 })
      }
    }
  }

  return (
    <div className="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8 py-8">
      <div className="mb-6">
        <h1 className="text-2xl font-bold text-white mb-1">Swiss AI Companies</h1>
        <p className="text-[#888888] text-sm">{count} companies in the database</p>
      </div>

      {/* Mobile filter toggle */}
      <div className="lg:hidden mb-4">
        <button
          onClick={() => setSidebarOpen(!sidebarOpen)}
          className="flex items-center gap-2 px-4 py-2 bg-[#111111] border border-[#222222] rounded-lg text-sm text-white"
        >
          <SlidersHorizontal className="h-4 w-4" />
          Filters
          {activeFilterCount > 0 && (
            <span className="bg-[#3b82f6] text-white rounded-full w-5 h-5 flex items-center justify-center text-xs">{activeFilterCount}</span>
          )}
          <ChevronDown className={`h-4 w-4 text-[#888888] transition-transform ${sidebarOpen ? 'rotate-180' : ''}`} />
        </button>
      </div>

      <div className="flex gap-6">
        {/* Sidebar */}
        <div className={`${sidebarOpen ? 'block' : 'hidden'} lg:block w-full lg:w-72 flex-shrink-0`}>
          <FilterSidebar
            filters={filters}
            onFiltersChange={setFilters}
            onReset={resetFilters}
            activeFilterCount={activeFilterCount}
            resultCount={count}
          />
        </div>

        {/* Main content */}
        <div className="flex-1 min-w-0">
          {/* Toolbar */}
          <div className="flex items-center justify-between gap-3 mb-4 flex-wrap">
            <FilterChips
              filters={filters}
              onRemove={handleFilterRemove}
              onReset={resetFilters}
            />
            <div className="flex items-center gap-3 ml-auto">
              <select
                value={filters.sort}
                onChange={(e) => setFilters({ sort: e.target.value })}
                className="px-3 py-1.5 bg-[#1a1a1a] border border-[#222222] rounded-md text-white text-sm focus:outline-none focus:border-[#3b82f6]"
              >
                <option value="name">Name A–Z</option>
                <option value="founded_year">Founded (newest)</option>
                <option value="funding_total_chf">Funding (highest)</option>
                <option value="employee_count_max">Employees (largest)</option>
              </select>
              <ViewToggle view={view} onToggle={setView} />
            </div>
          </div>

          {/* Results */}
          {loading ? (
            <div className="grid grid-cols-1 sm:grid-cols-2 xl:grid-cols-3 gap-4">
              {Array.from({ length: 6 }).map((_, i) => <CompanyCardSkeleton key={i} />)}
            </div>
          ) : companies.length === 0 ? (
            <div className="text-center py-16">
              <p className="text-[#888888] text-lg mb-2">No companies found</p>
              <p className="text-[#444444] text-sm mb-4">Try adjusting your filters</p>
              <button onClick={resetFilters} className="px-4 py-2 bg-[#3b82f6] hover:bg-[#2563eb] text-white rounded-lg text-sm transition-colors">
                Reset filters
              </button>
            </div>
          ) : view === 'card' ? (
            <div className="grid grid-cols-1 sm:grid-cols-2 xl:grid-cols-3 gap-4">
              {companies.map(company => <CompanyCard key={company.id} company={company} />)}
            </div>
          ) : (
            <CompanyTable companies={companies} />
          )}

          {/* Pagination */}
          {totalPages > 1 && (
            <div className="flex items-center justify-center gap-2 mt-8">
              <button
                onClick={() => setFilters({ page: filters.page - 1 })}
                disabled={filters.page <= 1}
                className="px-3 py-1.5 bg-[#1a1a1a] border border-[#222222] rounded text-sm text-white disabled:opacity-40 hover:border-[#3b82f6] transition-colors"
              >
                Previous
              </button>
              <span className="text-sm text-[#888888]">Page {filters.page} of {totalPages}</span>
              <button
                onClick={() => setFilters({ page: filters.page + 1 })}
                disabled={filters.page >= totalPages}
                className="px-3 py-1.5 bg-[#1a1a1a] border border-[#222222] rounded text-sm text-white disabled:opacity-40 hover:border-[#3b82f6] transition-colors"
              >
                Next
              </button>
            </div>
          )}
        </div>
      </div>
    </div>
  )
}

export default function CompaniesPage() {
  return (
    <Suspense fallback={
      <div className="flex items-center justify-center min-h-[60vh]">
        <div className="w-8 h-8 border-2 border-[#3b82f6] border-t-transparent rounded-full animate-spin" />
      </div>
    }>
      <CompaniesContent />
    </Suspense>
  )
}
