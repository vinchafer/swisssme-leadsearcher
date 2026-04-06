'use client'
import { useState } from 'react'
import { Company } from '@/lib/types'
import { X } from 'lucide-react'

const EMPLOYEE_RANGES = ['1-9', '10-49', '50-249', '250+']

const inputCls =
  'w-full px-3 py-2 bg-[#1a1a1a] border border-[#222222] rounded-lg text-sm text-white placeholder-[#444444] focus:outline-none focus:border-[#3b82f6]'

function Field({ label, children }: { label: string; children: React.ReactNode }) {
  return (
    <div>
      <label className="block text-xs text-[#888888] mb-1.5">{label}</label>
      {children}
    </div>
  )
}

interface FormState {
  employee_count_min: string
  employee_range: string
  linkedin_url: string
  twitter_url: string
  noga_code: string
  website: string
  description: string
}

interface EnrichmentPayload {
  employee_count_min: number | null
  employee_range: string | null
  linkedin_url: string | null
  twitter_url: string | null
  noga_code: string | null
  website: string | null
  description: string | null
}

interface EditModalProps {
  company: Company
  onClose: () => void
  onSave: (updated: Company) => void
}

export function EditModal({ company, onClose, onSave }: EditModalProps) {
  const [form, setForm] = useState<FormState>({
    employee_count_min: company.employee_count_min?.toString() ?? '',
    employee_range: company.employee_range ?? '',
    linkedin_url: company.linkedin_url ?? '',
    twitter_url: company.twitter_url ?? '',
    noga_code: company.noga_code ?? '',
    website: company.website ?? '',
    description: company.description ?? '',
  })
  const [saving, setSaving] = useState(false)
  const [error, setError] = useState<string | null>(null)

  const set = (key: keyof FormState, val: string) =>
    setForm((f) => ({ ...f, [key]: val }))

  async function handleSave() {
    setSaving(true)
    setError(null)
    try {
      const payload: EnrichmentPayload = {
        employee_count_min: form.employee_count_min ? parseInt(form.employee_count_min) : null,
        employee_range: form.employee_range || null,
        linkedin_url: form.linkedin_url || null,
        twitter_url: form.twitter_url || null,
        noga_code: form.noga_code || null,
        website: form.website || null,
        description: form.description || null,
      }

      const res = await fetch(`/api/admin/companies/${company.id}`, {
        method: 'PATCH',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(payload),
      })

      if (!res.ok) {
        const data = await res.json() as { error?: string }
        setError(data.error ?? 'Fehler beim Speichern')
        return
      }

      const updated: Company = {
        ...company,
        employee_count_min: payload.employee_count_min,
        employee_range: payload.employee_range,
        linkedin_url: payload.linkedin_url,
        twitter_url: payload.twitter_url,
        noga_code: payload.noga_code,
        website: payload.website,
        description: payload.description,
      }
      onSave(updated)
    } catch {
      setError('Netzwerkfehler')
    } finally {
      setSaving(false)
    }
  }

  return (
    <div
      className="fixed inset-0 bg-black/70 flex items-center justify-center z-50 p-4"
      onClick={(e) => { if (e.target === e.currentTarget) onClose() }}
    >
      <div className="bg-[#111111] border border-[#222222] rounded-xl w-full max-w-lg max-h-[90vh] overflow-y-auto">
        {/* Header */}
        <div className="flex items-center justify-between p-5 border-b border-[#222222]">
          <div>
            <h2 className="font-semibold text-white">{company.name}</h2>
            {company.uid_chid && (
              <p className="text-xs text-[#888888] font-mono mt-0.5">{company.uid_chid}</p>
            )}
          </div>
          <button
            onClick={onClose}
            className="text-[#888888] hover:text-white transition-colors"
          >
            <X className="h-5 w-5" />
          </button>
        </div>

        {/* Form */}
        <div className="p-5 space-y-4">
          <Field label="Mitarbeiterzahl">
            <input
              type="number"
              min={0}
              value={form.employee_count_min}
              onChange={(e) => set('employee_count_min', e.target.value)}
              className={inputCls}
              placeholder="z.B. 12"
            />
          </Field>

          <Field label="Mitarbeiter-Range">
            <select
              value={form.employee_range}
              onChange={(e) => set('employee_range', e.target.value)}
              className={inputCls}
            >
              <option value="">— keine Angabe —</option>
              {EMPLOYEE_RANGES.map((r) => (
                <option key={r} value={r}>{r}</option>
              ))}
            </select>
          </Field>

          <Field label="LinkedIn URL">
            <input
              type="url"
              value={form.linkedin_url}
              onChange={(e) => set('linkedin_url', e.target.value)}
              className={inputCls}
              placeholder="https://linkedin.com/company/…"
            />
          </Field>

          <Field label="Twitter / X URL">
            <input
              type="url"
              value={form.twitter_url}
              onChange={(e) => set('twitter_url', e.target.value)}
              className={inputCls}
              placeholder="https://twitter.com/…"
            />
          </Field>

          <Field label="NOGA-Code">
            <input
              type="text"
              value={form.noga_code}
              onChange={(e) => set('noga_code', e.target.value)}
              className={inputCls}
              placeholder="z.B. 62"
              maxLength={6}
            />
          </Field>

          <Field label="Website">
            <input
              type="url"
              value={form.website}
              onChange={(e) => set('website', e.target.value)}
              className={inputCls}
              placeholder="https://…"
            />
          </Field>

          <Field label="Beschreibung">
            <textarea
              value={form.description}
              onChange={(e) => set('description', e.target.value)}
              rows={4}
              className={`${inputCls} resize-y`}
              placeholder="Kurzbeschreibung des Unternehmens…"
            />
          </Field>

          {error && <p className="text-sm text-[#ef4444]">{error}</p>}

          <div className="flex justify-end gap-3 pt-2">
            <button
              onClick={onClose}
              className="px-4 py-2 text-sm text-[#888888] hover:text-white transition-colors"
            >
              Abbrechen
            </button>
            <button
              onClick={handleSave}
              disabled={saving}
              className="px-4 py-2 text-sm bg-[#3b82f6] hover:bg-[#2563eb] text-white rounded-lg transition-colors disabled:opacity-50"
            >
              {saving ? 'Speichern…' : 'Speichern'}
            </button>
          </div>
        </div>
      </div>
    </div>
  )
}
