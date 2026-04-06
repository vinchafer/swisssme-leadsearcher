import { NextRequest, NextResponse } from 'next/server'
import { getCompanies } from '@/lib/queries'
import { CompanyFilters } from '@/lib/types'

export const dynamic = 'force-dynamic'

export async function GET(request: NextRequest) {
  try {
    const { searchParams } = new URL(request.url)

    const filters: Partial<CompanyFilters> = {
      search: searchParams.get('search') ?? undefined,
      cantons: searchParams.get('cantons')?.split(',').filter(Boolean) ?? [],
      cities: searchParams.get('cities')?.split(',').filter(Boolean) ?? [],
      domains: searchParams.get('domains')?.split(',').filter(Boolean) ?? [],
      categories: searchParams.get('categories')?.split(',').filter(Boolean) ?? [],
      stages: searchParams.get('stages')?.split(',').filter(Boolean) ?? [],
      founded_min: searchParams.get('founded_min') ? parseInt(searchParams.get('founded_min')!) : undefined,
      founded_max: searchParams.get('founded_max') ? parseInt(searchParams.get('founded_max')!) : undefined,
      funding_min: searchParams.get('funding_min') ? parseInt(searchParams.get('funding_min')!) : undefined,
      funding_max: searchParams.get('funding_max') ? parseInt(searchParams.get('funding_max')!) : undefined,
      is_public: searchParams.get('is_public') !== null ? searchParams.get('is_public') === 'true' : undefined,
      zip_from: searchParams.get('zip_from') ?? undefined,
      zip_to: searchParams.get('zip_to') ?? undefined,
      noga_codes: searchParams.get('noga_codes')?.split(',').filter(Boolean) ?? [],
      legal_forms: searchParams.get('legal_forms')?.split(',').filter(Boolean) ?? [],
      has_auditor: searchParams.get('has_auditor') !== null ? searchParams.get('has_auditor') === 'true' : undefined,
      capital_min: searchParams.get('capital_min') ? parseInt(searchParams.get('capital_min')!) : undefined,
      capital_max: searchParams.get('capital_max') ? parseInt(searchParams.get('capital_max')!) : undefined,
      sort: searchParams.get('sort') ?? 'name',
      order: (searchParams.get('order') as 'asc' | 'desc') ?? 'asc',
      page: searchParams.get('page') ? parseInt(searchParams.get('page')!) : 1,
      limit: searchParams.get('limit') ? parseInt(searchParams.get('limit')!) : 24,
    }

    const result = await getCompanies(filters)
    return NextResponse.json(result)
  } catch (error) {
    console.error('Error fetching companies:', error)
    return NextResponse.json({ error: 'Failed to fetch companies' }, { status: 500 })
  }
}
