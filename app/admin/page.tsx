'use client'
import { useState, useEffect, useCallback } from 'react'
import { Company } from '@/lib/types'
import { EditModal } from './components/EditModal'
import { Search, ChevronLeft, ChevronRight } from 'lucide-react'

const PAGE_SIZE = 50

export default function AdminPage() {
  const [search, setSearch] = useState('')
  const [debouncedSearch, setDebouncedSearch] = useState('')
  const [page, setPage] = useState(1)
  const [companies, setCompanies] = useState<Company[]>([])
  const [total, setTotal] = useState(0)
  const [loading, setLoading] = useState(true)
  const [selected, setSelected] = useState<Company | null>(null)

  useEffect(() => {
    const t = setTimeout(() => setDebouncedSearch(search), 300)
    return () => clearTimeout(t)
  }, [search])

  useEffect(() => { setPage(1) }, [debouncedSearch])

  const fetchCompanies = useCallback(async () => {
    setLoading(true)
    try {
      const params = new URLSearchParams({
        limit: String(PAGE_SIZE),
        page: String(page),
        sort: 'name',
        order: 'asc',
      })
      if (debouncedSearch) params.set('search', debouncedSearch)
      const res = await fetch(`/api/companies?${params}`)
      const data = await res.json() as { data: Company[]; count: number }
      setCompanies(data.data ?? [])
      setTotal(data.count ?? 0)
    } finally {
      setLoading(false)
    }
  }, [debouncedSearch, page])

  useEffect(() => { fetchCompanies() }, [fetchCompanies])

  const totalPages = Math.ceil(total / PAGE_SIZE) || 1

  return (
    <div className="min-h-screen bg-[#0a0a0a] text-white p-8">
      <div className="max-w-7xl mx-auto">
        <div className="mb-6">
          <h1 className="text-2xl font-bold text-white mb-1">Admin — Company Enrichment</h1>
          <p className="text-sm text-[#888888]">{total} companies total</p>
        </div>

        {/* Search */}
        <div className="relative mb-4 max-w-sm">
          <Search className="absolute left-3 top-1/2 -translate-y-1/2 h-4 w-4 text-[#888888]" />
          <input
            type="text"
            placeholder="Suchen nach Name…"
            value={search}
            onChange={(e) => setSearch(e.target.value)}
            className="w-full pl-9 pr-3 py-2 bg-[#111111] border border-[#222222] rounded-lg text-sm text-white placeholder-[#444444] focus:outline-none focus:border-[#3b82f6]"
          />
        </div>

        {/* Table */}
        <div className="bg-[#111111] border border-[#222222] rounded-lg overflow-x-auto">
          <table className="w-full text-sm">
            <thead>
              <tr className="border-b border-[#222222] text-left">
                <th className="px-4 py-3 text-xs text-[#888888] font-medium whitespace-nowrap">Name</th>
                <th className="px-4 py-3 text-xs text-[#888888] font-medium whitespace-nowrap">UID</th>
                <th className="px-4 py-3 text-xs text-[#888888] font-medium whitespace-nowrap">Kanton</th>
                <th className="px-4 py-3 text-xs text-[#888888] font-medium whitespace-nowrap">NOGA</th>
                <th className="px-4 py-3 text-xs text-[#888888] font-medium whitespace-nowrap">Mitarbeiter</th>
                <th className="px-4 py-3 text-xs text-[#888888] font-medium whitespace-nowrap">Revision</th>
              </tr>
            </thead>
            <tbody>
              {loading ? (
                <tr>
                  <td colSpan={6} className="px-4 py-12 text-center text-[#888888]">
                    Laden…
                  </td>
                </tr>
              ) : companies.length === 0 ? (
                <tr>
                  <td colSpan={6} className="px-4 py-12 text-center text-[#888888]">
                    Keine Treffer
                  </td>
                </tr>
              ) : (
                companies.map((c) => (
                  <tr
                    key={c.id}
                    onClick={() => setSelected(c)}
                    className="border-b border-[#1a1a1a] hover:bg-[#1a1a1a] cursor-pointer transition-colors"
                  >
                    <td className="px-4 py-3 text-white font-medium max-w-[220px] truncate">
                      {c.name}
                    </td>
                    <td className="px-4 py-3 text-[#888888] font-mono text-xs whitespace-nowrap">
                      {c.uid_chid ?? '—'}
                    </td>
                    <td className="px-4 py-3 text-[#888888]">{c.headquarters_canton ?? '—'}</td>
                    <td className="px-4 py-3 text-[#888888] font-mono text-xs">
                      {c.noga_code ?? '—'}
                    </td>
                    <td className="px-4 py-3 text-[#888888]">{c.employee_range ?? '—'}</td>
                    <td className="px-4 py-3">
                      {c.has_auditor === true ? (
                        <span className="text-[#22c55e] text-xs">Ja</span>
                      ) : c.has_auditor === false ? (
                        <span className="text-[#ef4444] text-xs">Nein</span>
                      ) : (
                        <span className="text-[#888888] text-xs">—</span>
                      )}
                    </td>
                  </tr>
                ))
              )}
            </tbody>
          </table>
        </div>

        {/* Pagination */}
        <div className="flex items-center justify-between mt-4 text-sm text-[#888888]">
          <span>
            Seite {page} von {totalPages}
          </span>
          <div className="flex gap-2">
            <button
              disabled={page <= 1}
              onClick={() => setPage((p) => p - 1)}
              className="flex items-center gap-1 px-3 py-1.5 bg-[#111111] border border-[#222222] rounded hover:border-[#3b82f6] disabled:opacity-40 disabled:cursor-not-allowed transition-colors"
            >
              <ChevronLeft className="h-4 w-4" />
              Zurück
            </button>
            <button
              disabled={page >= totalPages}
              onClick={() => setPage((p) => p + 1)}
              className="flex items-center gap-1 px-3 py-1.5 bg-[#111111] border border-[#222222] rounded hover:border-[#3b82f6] disabled:opacity-40 disabled:cursor-not-allowed transition-colors"
            >
              Weiter
              <ChevronRight className="h-4 w-4" />
            </button>
          </div>
        </div>
      </div>

      {selected && (
        <EditModal
          company={selected}
          onClose={() => setSelected(null)}
          onSave={(updated) => {
            setCompanies((cs) => cs.map((c) => (c.id === updated.id ? updated : c)))
            setSelected(null)
          }}
        />
      )}
    </div>
  )
}
