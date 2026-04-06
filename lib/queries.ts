import { createServerClient } from './supabase'
import { Company, CompaniesResponse, StatsResponse, CompanyFilters } from './types'

export async function getCompanies(filters: Partial<CompanyFilters>): Promise<CompaniesResponse> {
  const client = createServerClient()
  const page = filters.page ?? 1
  const limit = filters.limit ?? 24
  const from = (page - 1) * limit
  const to = from + limit - 1

  let query = client
    .from('companies')
    .select('*', { count: 'estimated' })

  if (filters.search) {
    query = query.or(`name.ilike.%${filters.search}%,description.ilike.%${filters.search}%`)
  }
  if (filters.cantons && filters.cantons.length > 0) {
    query = query.in('headquarters_canton', filters.cantons)
  }
  if (filters.cities && filters.cities.length > 0) {
    query = query.in('headquarters_city', filters.cities)
  }
  if (filters.stages && filters.stages.length > 0) {
    query = query.in('funding_stage', filters.stages)
  }
  if (filters.founded_min) {
    query = query.gte('founded_year', filters.founded_min)
  }
  if (filters.founded_max) {
    query = query.lte('founded_year', filters.founded_max)
  }
  if (filters.funding_min) {
    query = query.gte('funding_total_chf', filters.funding_min)
  }
  if (filters.funding_max && filters.funding_max < 500_000_000) {
    query = query.lte('funding_total_chf', filters.funding_max)
  }
  if (filters.is_public !== null && filters.is_public !== undefined) {
    query = query.eq('is_public', filters.is_public)
  }
  if (filters.zip_from) {
    query = query.gte('headquarters_zip', filters.zip_from)
  }
  if (filters.zip_to) {
    query = query.lte('headquarters_zip', filters.zip_to)
  }
  if (filters.noga_codes && filters.noga_codes.length > 0) {
    query = query.in('noga_code', filters.noga_codes)
  }
  if (filters.legal_forms && filters.legal_forms.length > 0) {
    query = query.in('legal_form', filters.legal_forms)
  }
  if (filters.has_auditor !== null && filters.has_auditor !== undefined) {
    query = query.eq('has_auditor', filters.has_auditor)
  }
  if (filters.capital_min) {
    query = query.gte('share_capital_chf', filters.capital_min)
  }
  if (filters.capital_max !== undefined && filters.capital_max < 10_000_000) {
    query = query.lte('share_capital_chf', filters.capital_max)
  }

  const sortField = filters.sort ?? 'name'
  const sortOrder = filters.order ?? 'asc'
  const ascending = sortOrder === 'asc'

  if (sortField === 'name') query = query.order('name', { ascending })
  else if (sortField === 'founded_year') query = query.order('founded_year', { ascending: false })
  else if (sortField === 'funding_total_chf') query = query.order('funding_total_chf', { ascending: false, nullsFirst: false })
  else if (sortField === 'employee_count_max') query = query.order('employee_count_max', { ascending: false, nullsFirst: false })

  query = query.range(from, to)

  const { data, error, count } = await query

  if (error) throw new Error(error.message)

  const companies = (data ?? []).map((company) => ({
    ...company,
    domains: company.domains?.map((d: { domain: unknown }) => d.domain) ?? [],
    categories: company.categories?.map((c: { category: unknown }) => c.category) ?? [],
    tags: company.tags?.map((t: { tag: unknown }) => t.tag) ?? [],
  })) as Company[]

  return {
    data: companies,
    count: count ?? 0,
    page,
    totalPages: Math.ceil((count ?? 0) / limit),
  }
}

export async function getCompanyBySlug(slug: string): Promise<Company | null> {
  const client = createServerClient()
  const { data, error } = await client
    .from('companies')
    .select(`
      *,
      domains:company_domain_map(domain:ai_domains(*)),
      categories:company_category_map(category:company_categories(*)),
      tags:company_tag_map(tag:company_tags(*)),
      funding_rounds(*)
    `)
    .eq('slug', slug)
    .single()

  if (error) return null
  if (!data) return null

  return {
    ...data,
    domains: data.domains?.map((d: { domain: unknown }) => d.domain) ?? [],
    categories: data.categories?.map((c: { category: unknown }) => c.category) ?? [],
    tags: data.tags?.map((t: { tag: unknown }) => t.tag) ?? [],
  } as Company
}

export async function getStats(): Promise<StatsResponse> {
  const client = createServerClient()

  const [companiesResult, cantonsResult] = await Promise.all([
    client.from('companies').select('funding_total_chf, founded_year, funding_stage, headquarters_canton', { count: 'exact' }),
    client.from('companies').select('headquarters_canton').not('headquarters_canton', 'is', null),
  ])

  const companies = companiesResult.data ?? []
  const totalFunding = companies.reduce((sum, c) => sum + (c.funding_total_chf ?? 0), 0)
  const years = companies.filter(c => c.founded_year).map(c => c.founded_year as number)
  const avgYear = years.length > 0 ? Math.round(years.reduce((a, b) => a + b, 0) / years.length) : 0

  const cantonCounts: Record<string, number> = {}
  ;(cantonsResult.data ?? []).forEach(c => {
    if (c.headquarters_canton) {
      cantonCounts[c.headquarters_canton] = (cantonCounts[c.headquarters_canton] ?? 0) + 1
    }
  })

  const stageCounts: Record<string, number> = {}
  companies.forEach(c => {
    const stage = c.funding_stage ?? 'Unknown'
    stageCounts[stage] = (stageCounts[stage] ?? 0) + 1
  })

  return {
    totalCompanies: companiesResult.count ?? 0,
    totalFundingChf: totalFunding,
    cantonsRepresented: Object.keys(cantonCounts).length,
    avgFoundedYear: avgYear,
    domainBreakdown: [],
    stageBreakdown: Object.entries(stageCounts).map(([stage, count]) => ({ stage, count })),
    cantonBreakdown: Object.entries(cantonCounts).map(([canton, count]) => ({ canton, count })).sort((a, b) => b.count - a.count),
  }
}

export async function getAllCantons(): Promise<string[]> {
  const client = createServerClient()
  const { data } = await client
    .from('companies')
    .select('headquarters_canton')
    .not('headquarters_canton', 'is', null)
    .order('headquarters_canton')

  const cantons = [...new Set((data ?? []).map(d => d.headquarters_canton as string))]
  return cantons.filter(Boolean)
}

export async function getAllCities(): Promise<string[]> {
  const client = createServerClient()
  const { data } = await client
    .from('companies')
    .select('headquarters_city')
    .not('headquarters_city', 'is', null)
    .order('headquarters_city')

  const cities = [...new Set((data ?? []).map(d => d.headquarters_city as string))]
  return cities.filter(Boolean)
}

export async function getAllTags(): Promise<string[]> {
  const client = createServerClient()
  const { data } = await client.from('company_tags').select('name').order('name')
  return (data ?? []).map(d => d.name)
}
