import { NextRequest, NextResponse } from 'next/server'
import { createClient } from '@supabase/supabase-js'

export const dynamic = 'force-dynamic'

// Only these fields may ever be updated via the enrichment API.
// Zefix/registry fields (uid_chid, legal_form, name, purpose_text, etc.) are never touched.
const ALLOWED_FIELDS = new Set([
  'employee_count_min',
  'employee_range',
  'linkedin_url',
  'twitter_url',
  'noga_code',
  'website',
  'description',
])

function createAdminClient() {
  const url = process.env.NEXT_PUBLIC_SUPABASE_URL ?? ''
  const serviceKey = process.env.SUPABASE_SERVICE_ROLE_KEY ?? ''
  if (!url || !serviceKey) {
    throw new Error('Missing Supabase admin config (SUPABASE_SERVICE_ROLE_KEY)')
  }
  return createClient(url, serviceKey, { auth: { persistSession: false } })
}

interface RouteContext {
  params: Promise<{ id: string }>
}

export async function PATCH(request: NextRequest, { params }: RouteContext) {
  try {
    const { id } = await params

    if (!id) {
      return NextResponse.json({ error: 'Missing company id' }, { status: 400 })
    }

    const body: Record<string, unknown> = await request.json()

    // Whitelist — silently drop any non-enrichment fields
    const update: Record<string, unknown> = {}
    for (const [key, value] of Object.entries(body)) {
      if (ALLOWED_FIELDS.has(key)) {
        update[key] = value
      }
    }

    if (Object.keys(update).length === 0) {
      return NextResponse.json({ error: 'No valid enrichment fields provided' }, { status: 400 })
    }

    update.updated_at = new Date().toISOString()

    const client = createAdminClient()
    const { error } = await client.from('companies').update(update).eq('id', id)

    if (error) throw new Error(error.message)

    return NextResponse.json({ success: true })
  } catch (err) {
    console.error('Admin PATCH error:', err)
    const message = err instanceof Error ? err.message : 'Unknown error'
    return NextResponse.json({ error: message }, { status: 500 })
  }
}
