'use client'
import { useCallback, useMemo } from 'react'
import { useRouter, useSearchParams, usePathname } from 'next/navigation'
import { CompanyFilters } from '@/lib/types'
import { DEFAULT_FILTERS, filtersToSearchParams, searchParamsToFilters } from '@/lib/filters'

export function useFilters() {
  const router = useRouter()
  const pathname = usePathname()
  const searchParams = useSearchParams()

  const filters: CompanyFilters = useMemo(() => ({
    ...DEFAULT_FILTERS,
    ...searchParamsToFilters(searchParams),
  }), [searchParams])

  const setFilters = useCallback((newFilters: Partial<CompanyFilters>) => {
    const updated = { ...filters, ...newFilters, page: 1 }
    const params = filtersToSearchParams(updated)
    router.push(`${pathname}?${params.toString()}`, { scroll: false })
  }, [filters, router, pathname])

  const resetFilters = useCallback(() => {
    router.push(pathname, { scroll: false })
  }, [router, pathname])

  const activeFilterCount = useMemo(() => {
    let count = 0
    if (filters.search) count++
    if (filters.cantons.length) count++
    if (filters.cities.length) count++
    if (filters.domains.length) count++
    if (filters.categories.length) count++
    if (filters.stages.length) count++
    if (filters.founded_min !== DEFAULT_FILTERS.founded_min || filters.founded_max !== DEFAULT_FILTERS.founded_max) count++
    if (filters.funding_min !== DEFAULT_FILTERS.funding_min || filters.funding_max !== DEFAULT_FILTERS.funding_max) count++
    if (filters.is_public !== null) count++
    if (filters.zip_from || filters.zip_to) count++
    if (filters.noga_codes.length) count++
    if (filters.legal_forms.length) count++
    if (filters.has_auditor !== null) count++
    if (filters.capital_min !== DEFAULT_FILTERS.capital_min || filters.capital_max !== DEFAULT_FILTERS.capital_max) count++
    return count
  }, [filters])

  return { filters, setFilters, resetFilters, activeFilterCount }
}
