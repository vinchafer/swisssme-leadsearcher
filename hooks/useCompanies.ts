'use client'
import { useState, useEffect } from 'react'
import { Company, CompanyFilters } from '@/lib/types'
import { filtersToSearchParams } from '@/lib/filters'

interface UseCompaniesResult {
  companies: Company[]
  count: number
  totalPages: number
  loading: boolean
  error: string | null
}

export function useCompanies(filters: Partial<CompanyFilters>): UseCompaniesResult {
  const [companies, setCompanies] = useState<Company[]>([])
  const [count, setCount] = useState(0)
  const [totalPages, setTotalPages] = useState(0)
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState<string | null>(null)

  useEffect(() => {
    const fetchCompanies = async () => {
      setLoading(true)
      setError(null)
      try {
        const params = filtersToSearchParams(filters)
        const res = await fetch(`/api/companies?${params.toString()}`)
        if (!res.ok) throw new Error('Failed to fetch companies')
        const json = await res.json()
        setCompanies(json.data)
        setCount(json.count)
        setTotalPages(json.totalPages)
      } catch (err) {
        setError(err instanceof Error ? err.message : 'Unknown error')
      } finally {
        setLoading(false)
      }
    }
    fetchCompanies()
  // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [JSON.stringify(filters)])

  return { companies, count, totalPages, loading, error }
}
