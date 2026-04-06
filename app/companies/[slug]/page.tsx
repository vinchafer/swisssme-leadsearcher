import { notFound } from 'next/navigation'
import Link from 'next/link'
import { getCompanyBySlug } from '@/lib/queries'
import { CompanyDetailHeader } from '@/components/CompanyDetailHeader'
import { FundingTimeline } from '@/components/FundingTimeline'
import { ArrowLeft, MapPin, Globe, Linkedin, Shield } from 'lucide-react'
import type { Metadata } from 'next'

export const dynamic = 'force-dynamic'

interface PageProps {
  params: Promise<{ slug: string }>
}

export async function generateMetadata({ params }: PageProps): Promise<Metadata> {
  const { slug } = await params
  const company = await getCompanyBySlug(slug)
  if (!company) return { title: 'Company Not Found' }
  return {
    title: `${company.name} — Swiss AI Radar`,
    description: company.description ?? `${company.name} is a Swiss AI company based in ${company.headquarters_city}.`,
    openGraph: {
      title: company.name,
      description: company.description ?? '',
    },
  }
}

function SectionCard({ title, children }: { title: string; children: React.ReactNode }) {
  return (
    <div className="bg-[#111111] border border-[#222222] rounded-lg p-6">
      <h2 className="text-base font-semibold text-white mb-4">{title}</h2>
      {children}
    </div>
  )
}

function KeyFact({ label, value }: { label: string; value: string }) {
  return (
    <div className="bg-[#1a1a1a] rounded-lg p-4">
      <p className="text-xs text-[#888888] mb-1">{label}</p>
      <p className="text-sm font-medium text-white">{value}</p>
    </div>
  )
}

export default async function CompanyDetailPage({ params }: PageProps) {
  const { slug } = await params
  const company = await getCompanyBySlug(slug)
  if (!company) notFound()

  const fullAddress = [company.street, company.house_number].filter(Boolean).join(' ')
  const cityLine = [company.zip_code, company.headquarters_city, company.headquarters_canton].filter(Boolean).join(' ')

  const capitalFormatted =
    company.capital_chf != null
      ? 'CHF ' + company.capital_chf.toLocaleString('de-CH')
      : '—'

  const confidencePct =
    company.noga_confidence != null ? Math.round(company.noga_confidence * 100) : null

  const auditorValue =
    company.has_auditor === true ? 'Ja' : company.has_auditor === false ? 'Nein' : '—'

  return (
    <div className="mx-auto max-w-4xl px-4 sm:px-6 lg:px-8 py-8">
      <Link
        href="/companies"
        className="inline-flex items-center gap-2 text-[#888888] hover:text-white text-sm mb-6 transition-colors"
      >
        <ArrowLeft className="h-4 w-4" />
        Back to companies
      </Link>

      {/* 1. Header */}
      <CompanyDetailHeader company={company} />

      {/* Zefix source badge */}
      {company.data_source === 'zefix' && (
        <div className="mt-3 flex flex-wrap items-center gap-2">
          <span className="inline-flex items-center gap-1.5 px-2.5 py-1 bg-[#111111] border border-[#222222] rounded text-xs text-[#888888]">
            Quelle: Zefix Handelsregister (EHRA)
          </span>
          <span className="text-xs text-[#555555]">
            Diese Daten sind ohne Gewähr und haben keine Rechtswirkung.
          </span>
        </div>
      )}

      <div className="mt-6 space-y-4">
        {/* 2. Zweck */}
        {company.purpose_text && (
          <SectionCard title="Zweck">
            <p className="text-[#888888] text-sm leading-relaxed">{company.purpose_text}</p>
          </SectionCard>
        )}

        {/* 3. Key facts */}
        <SectionCard title="Eckdaten">
          <div className="grid grid-cols-2 sm:grid-cols-4 gap-3">
            <KeyFact label="UID / CHID" value={company.uid_chid ?? '—'} />
            <KeyFact label="Kapital" value={capitalFormatted} />
            <KeyFact label="Rechtsform" value={company.legal_form_name ?? '—'} />
            <KeyFact label="Revisionsstelle" value={auditorValue} />
          </div>
          {company.auditor_name && (
            <p className="flex items-center gap-1.5 text-xs text-[#888888] mt-3">
              <Shield className="h-3 w-3 flex-shrink-0" />
              {company.auditor_name}
            </p>
          )}
        </SectionCard>

        {/* 4. NOGA */}
        {company.noga_code && (
          <SectionCard title="NOGA-Klassifikation">
            <div className="flex items-start gap-3">
              <span className="px-2.5 py-1 bg-[#1a1a1a] border border-[#222222] rounded text-sm font-mono text-[#3b82f6] flex-shrink-0">
                {company.noga_code}
              </span>
              <div className="flex-1 min-w-0">
                <p className="text-sm text-white">{company.noga_label_de ?? '—'}</p>
                {confidencePct !== null && (
                  <div className="mt-2">
                    <div className="flex justify-between text-xs text-[#888888] mb-1">
                      <span>Konfidenz</span>
                      <span>{confidencePct}%</span>
                    </div>
                    <div className="h-1.5 bg-[#222222] rounded-full overflow-hidden">
                      <div
                        className="h-full bg-[#3b82f6] rounded-full"
                        style={{ width: `${confidencePct}%` }}
                      />
                    </div>
                  </div>
                )}
              </div>
            </div>
          </SectionCard>
        )}

        {/* 5. Address */}
        {(fullAddress || cityLine) && (
          <SectionCard title="Adresse">
            <div className="flex items-start gap-2">
              <MapPin className="h-4 w-4 mt-0.5 flex-shrink-0 text-[#3b82f6]" />
              <div className="text-sm space-y-0.5">
                {fullAddress && <p className="text-white">{fullAddress}</p>}
                {cityLine && <p className="text-[#888888]">{cityLine}</p>}
              </div>
            </div>
          </SectionCard>
        )}

        {/* 6. Funding rounds */}
        {company.funding_rounds && company.funding_rounds.length > 0 && (
          <div className="bg-[#111111] border border-[#222222] rounded-lg p-6">
            <FundingTimeline rounds={company.funding_rounds} />
          </div>
        )}

        {/* 7. External links */}
        {(company.website || company.linkedin_url) && (
          <SectionCard title="Links">
            <div className="flex flex-wrap gap-3">
              {company.website && (
                <a
                  href={company.website}
                  target="_blank"
                  rel="noopener noreferrer"
                  className="inline-flex items-center gap-2 px-4 py-2 bg-[#1a1a1a] border border-[#222222] rounded-lg text-sm text-[#888888] hover:text-white hover:border-[#3b82f6] transition-colors"
                >
                  <Globe className="h-4 w-4" />
                  Website
                </a>
              )}
              {company.linkedin_url && (
                <a
                  href={company.linkedin_url}
                  target="_blank"
                  rel="noopener noreferrer"
                  className="inline-flex items-center gap-2 px-4 py-2 bg-[#1a1a1a] border border-[#222222] rounded-lg text-sm text-[#888888] hover:text-white hover:border-[#0077b5] transition-colors"
                >
                  <Linkedin className="h-4 w-4" />
                  LinkedIn
                </a>
              )}
            </div>
          </SectionCard>
        )}
      </div>
    </div>
  )
}
