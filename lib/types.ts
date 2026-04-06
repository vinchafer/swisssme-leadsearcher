export interface Company {
  id: string
  name: string
  slug: string
  description: string | null
  website: string | null
  logo_url: string | null
  founded_year: number | null
  headquarters_city: string | null
  headquarters_canton: string | null
  employee_count_min: number | null
  employee_count_max: number | null
  funding_total_chf: number | null
  funding_stage: string | null
  valuation_chf: number | null
  is_public: boolean
  stock_ticker: string | null
  created_at: string
  updated_at: string
  // Swiss commercial registry fields
  uid_chid: string | null
  legal_form_name: string | null
  purpose_text: string | null
  capital_chf: number | null
  has_auditor: boolean | null
  auditor_name: string | null
  street: string | null
  house_number: string | null
  zip_code: string | null
  noga_code: string | null
  noga_label_de: string | null
  noga_confidence: number | null
  employee_range: string | null
  linkedin_url: string | null
  twitter_url: string | null
  data_source: string | null
  domains?: AIDomain[]
  categories?: CompanyCategory[]
  tags?: CompanyTag[]
  funding_rounds?: FundingRound[]
}

export interface AIDomain {
  id: string
  name: string
  slug: string
  description: string | null
}

export interface CompanyCategory {
  id: string
  name: string
  slug: string
  description: string | null
  color: string | null
}

export interface CompanyTag {
  id: string
  name: string
  slug: string
}

export interface FundingRound {
  id: string
  company_id: string
  round_type: string | null
  amount_chf: number | null
  announced_date: string | null
  lead_investor: string | null
  created_at: string
}

export interface CompanyFilters {
  search: string
  cantons: string[]
  cities: string[]
  domains: string[]
  categories: string[]
  stages: string[]
  founded_min: number
  founded_max: number
  funding_min: number
  funding_max: number
  employee_min: number
  employee_max: number
  is_public: boolean | null
  zip_from: string
  zip_to: string
  noga_codes: string[]
  legal_forms: string[]
  has_auditor: boolean | null
  capital_min: number
  capital_max: number
  sort: string
  order: 'asc' | 'desc'
  page: number
  limit: number
}

export interface CompaniesResponse {
  data: Company[]
  count: number
  page: number
  totalPages: number
}

export interface StatsResponse {
  totalCompanies: number
  totalFundingChf: number
  cantonsRepresented: number
  avgFoundedYear: number
  domainBreakdown: { name: string; count: number }[]
  stageBreakdown: { stage: string; count: number }[]
  cantonBreakdown: { canton: string; count: number }[]
}
