import { CompanyFilters } from './types'

export const DEFAULT_FILTERS: CompanyFilters = {
  search: '',
  cantons: [],
  cities: [],
  domains: [],
  categories: [],
  stages: [],
  founded_min: 2000,
  founded_max: 2024,
  funding_min: 0,
  funding_max: 500_000_000,
  employee_min: 1,
  employee_max: 5000,
  is_public: null,
  zip_from: '',
  zip_to: '',
  noga_codes: [],
  legal_forms: [],
  has_auditor: null,
  capital_min: 0,
  capital_max: 10_000_000,
  sort: 'name',
  order: 'asc',
  page: 1,
  limit: 24,
}

export const FUNDING_STAGES = [
  'Bootstrapped',
  'Pre-Seed',
  'Seed',
  'Series A',
  'Series B',
  'Series C',
  'Series C+',
  'Series D',
  'Series E',
  'Series F',
  'Growth',
  'Public',
  'Unknown',
]

export const AI_DOMAINS = [
  'NLP',
  'Computer Vision',
  'MLOps',
  'FinTech AI',
  'HealthTech AI',
  'Robotic AI',
  'Data Analytics',
  'Generative AI',
  'Cybersecurity AI',
  'Other',
]

export const CATEGORIES = ['B2B SaaS', 'Deep Tech', 'Platform', 'API', 'Other']

export const LEGAL_FORMS = [
  'AG',
  'GmbH',
  'Einzelfirma',
  'Genossenschaft',
  'Verein',
  'Stiftung',
  'Kommanditgesellschaft',
  'Other',
]

export interface NogaSection {
  section: string
  label: string
  codes: string[]
}

export const NOGA_SECTIONS: NogaSection[] = [
  { section: 'A', label: 'Landwirtschaft, Forstwirtschaft und Fischerei', codes: ['01', '02', '03'] },
  { section: 'B', label: 'Bergbau und Gewinnung von Steinen und Erden', codes: ['05', '06', '07', '08', '09'] },
  { section: 'C', label: 'Verarbeitendes Gewerbe', codes: ['10','11','12','13','14','15','16','17','18','19','20','21','22','23','24','25','26','27','28','29','30','31','32','33'] },
  { section: 'D', label: 'Energieversorgung', codes: ['35'] },
  { section: 'E', label: 'Wasserversorgung; Abwasser- und Abfallentsorgung', codes: ['36', '37', '38', '39'] },
  { section: 'F', label: 'Baugewerbe/Bau', codes: ['41', '42', '43'] },
  { section: 'G', label: 'Handel; Instandhaltung und Reparatur von Kraftfahrzeugen', codes: ['45', '46', '47'] },
  { section: 'H', label: 'Verkehr und Lagerei', codes: ['49', '50', '51', '52', '53'] },
  { section: 'I', label: 'Gastgewerbe / Beherbergung und Gastronomie', codes: ['55', '56'] },
  { section: 'J', label: 'Information und Kommunikation', codes: ['58', '59', '60', '61', '62', '63'] },
  { section: 'K', label: 'Finanz- und Versicherungsdienstleistungen', codes: ['64', '65', '66'] },
  { section: 'L', label: 'Grundstücks- und Wohnungswesen', codes: ['68'] },
  { section: 'M', label: 'Freiberufliche, wissenschaftliche und technische Dienstleistungen', codes: ['69', '70', '71', '72', '73', '74', '75'] },
  { section: 'N', label: 'Sonstige wirtschaftliche Dienstleistungen', codes: ['77', '78', '79', '80', '81', '82'] },
  { section: 'O', label: 'Öffentliche Verwaltung, Verteidigung; Sozialversicherung', codes: ['84'] },
  { section: 'P', label: 'Erziehung und Unterricht', codes: ['85'] },
  { section: 'Q', label: 'Gesundheits- und Sozialwesen', codes: ['86', '87', '88'] },
  { section: 'R', label: 'Kunst, Unterhaltung und Erholung', codes: ['90', '91', '92', '93'] },
  { section: 'S', label: 'Sonstige Dienstleistungen', codes: ['94', '95', '96'] },
  { section: 'T', label: 'Private Haushalte', codes: ['97', '98'] },
  { section: 'U', label: 'Exterritoriale Organisationen und Körperschaften', codes: ['99'] },
]

export const SWISS_CANTONS = [
  { code: 'AG', name: 'Aargau' },
  { code: 'AI', name: 'Appenzell Innerrhoden' },
  { code: 'AR', name: 'Appenzell Ausserrhoden' },
  { code: 'BE', name: 'Bern' },
  { code: 'BL', name: 'Basel-Landschaft' },
  { code: 'BS', name: 'Basel-Stadt' },
  { code: 'FR', name: 'Fribourg' },
  { code: 'GE', name: 'Geneva' },
  { code: 'GL', name: 'Glarus' },
  { code: 'GR', name: 'Graubünden' },
  { code: 'JU', name: 'Jura' },
  { code: 'LU', name: 'Lucerne' },
  { code: 'NE', name: 'Neuchâtel' },
  { code: 'NW', name: 'Nidwalden' },
  { code: 'OW', name: 'Obwalden' },
  { code: 'SG', name: 'St. Gallen' },
  { code: 'SH', name: 'Schaffhausen' },
  { code: 'SO', name: 'Solothurn' },
  { code: 'SZ', name: 'Schwyz' },
  { code: 'TG', name: 'Thurgau' },
  { code: 'TI', name: 'Ticino' },
  { code: 'UR', name: 'Uri' },
  { code: 'VD', name: 'Vaud' },
  { code: 'VS', name: 'Valais' },
  { code: 'ZG', name: 'Zug' },
  { code: 'ZH', name: 'Zurich' },
]

export function filtersToSearchParams(filters: Partial<CompanyFilters>): URLSearchParams {
  const params = new URLSearchParams()
  if (filters.search) params.set('search', filters.search)
  if (filters.cantons?.length) params.set('cantons', filters.cantons.join(','))
  if (filters.cities?.length) params.set('cities', filters.cities.join(','))
  if (filters.domains?.length) params.set('domains', filters.domains.join(','))
  if (filters.categories?.length) params.set('categories', filters.categories.join(','))
  if (filters.stages?.length) params.set('stages', filters.stages.join(','))
  if (filters.founded_min && filters.founded_min !== 2000) params.set('founded_min', String(filters.founded_min))
  if (filters.founded_max && filters.founded_max !== 2024) params.set('founded_max', String(filters.founded_max))
  if (filters.funding_min && filters.funding_min !== 0) params.set('funding_min', String(filters.funding_min))
  if (filters.funding_max && filters.funding_max !== 500_000_000) params.set('funding_max', String(filters.funding_max))
  if (filters.is_public !== null && filters.is_public !== undefined) params.set('is_public', String(filters.is_public))
  if (filters.zip_from) params.set('zip_from', filters.zip_from)
  if (filters.zip_to) params.set('zip_to', filters.zip_to)
  if (filters.noga_codes?.length) params.set('noga_codes', filters.noga_codes.join(','))
  if (filters.legal_forms?.length) params.set('legal_forms', filters.legal_forms.join(','))
  if (filters.has_auditor !== null && filters.has_auditor !== undefined) params.set('has_auditor', String(filters.has_auditor))
  if (filters.capital_min && filters.capital_min !== 0) params.set('capital_min', String(filters.capital_min))
  if (filters.capital_max !== undefined && filters.capital_max !== 10_000_000) params.set('capital_max', String(filters.capital_max))
  if (filters.sort && filters.sort !== 'name') params.set('sort', filters.sort)
  if (filters.order && filters.order !== 'asc') params.set('order', filters.order)
  if (filters.page && filters.page > 1) params.set('page', String(filters.page))
  return params
}

export function searchParamsToFilters(params: URLSearchParams): Partial<CompanyFilters> {
  const filters: Partial<CompanyFilters> = {}
  const search = params.get('search')
  if (search) filters.search = search
  const cantons = params.get('cantons')
  if (cantons) filters.cantons = cantons.split(',').filter(Boolean)
  const cities = params.get('cities')
  if (cities) filters.cities = cities.split(',').filter(Boolean)
  const domains = params.get('domains')
  if (domains) filters.domains = domains.split(',').filter(Boolean)
  const categories = params.get('categories')
  if (categories) filters.categories = categories.split(',').filter(Boolean)
  const stages = params.get('stages')
  if (stages) filters.stages = stages.split(',').filter(Boolean)
  const foundedMin = params.get('founded_min')
  if (foundedMin) filters.founded_min = parseInt(foundedMin)
  const foundedMax = params.get('founded_max')
  if (foundedMax) filters.founded_max = parseInt(foundedMax)
  const fundingMin = params.get('funding_min')
  if (fundingMin) filters.funding_min = parseInt(fundingMin)
  const fundingMax = params.get('funding_max')
  if (fundingMax) filters.funding_max = parseInt(fundingMax)
  const isPublic = params.get('is_public')
  if (isPublic !== null) filters.is_public = isPublic === 'true'
  const zipFrom = params.get('zip_from')
  if (zipFrom) filters.zip_from = zipFrom
  const zipTo = params.get('zip_to')
  if (zipTo) filters.zip_to = zipTo
  const nogaCodes = params.get('noga_codes')
  if (nogaCodes) filters.noga_codes = nogaCodes.split(',').filter(Boolean)
  const legalForms = params.get('legal_forms')
  if (legalForms) filters.legal_forms = legalForms.split(',').filter(Boolean)
  const hasAuditor = params.get('has_auditor')
  if (hasAuditor !== null) filters.has_auditor = hasAuditor === 'true'
  const capitalMin = params.get('capital_min')
  if (capitalMin) filters.capital_min = parseInt(capitalMin)
  const capitalMax = params.get('capital_max')
  if (capitalMax) filters.capital_max = parseInt(capitalMax)
  const sort = params.get('sort')
  if (sort) filters.sort = sort
  const order = params.get('order')
  if (order === 'asc' || order === 'desc') filters.order = order
  const page = params.get('page')
  if (page) filters.page = parseInt(page)
  return filters
}
