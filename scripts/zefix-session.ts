/**
 * zefix-session.ts
 *
 * Uses Playwright to pass the Imperva WAF challenge on zefix.admin.ch, then
 * routes all API calls through page.evaluate() so that every request goes
 * through the browser's own network stack (TLS fingerprint, cookies, etc.)
 * rather than Node's HTTP client.  This is required because Imperva ties the
 * session cookie to the JA3/TLS fingerprint of the client that solved the
 * challenge — replaying the cookie from a plain Node fetch() still gets 403.
 */

import { chromium, type Browser, type Page } from 'playwright'

const ZEFIX_ORIGIN = 'https://www.zefix.admin.ch'
const CHALLENGE_TIMEOUT_MS = 30_000
const POLL_INTERVAL_MS = 500

/** Minimal fetch-compatible response surface. */
export interface ZefixResponse {
  ok: boolean
  status: number
  text(): Promise<string>
  json(): Promise<unknown>
}

/** A live session backed by a Playwright Page. */
export interface ZefixSession {
  /** Execute an HTTP request from inside the browser page. */
  request(
    url: string,
    init: { method: string; headers: Record<string, string>; body: string },
  ): Promise<ZefixResponse>
  /** Re-navigate to zefix.admin.ch to refresh the Imperva session. */
  refresh(): Promise<void>
  /** Close the browser. Call once the sync is complete. */
  close(): Promise<void>
}

/** Shapes passed into / out of page.evaluate() — must be JSON-serialisable. */
interface BrowserFetchArg {
  url: string
  method: string
  headers: Record<string, string>
  body: string
}

interface BrowserFetchResult {
  ok: boolean
  status: number
  text: string
}

async function warmUp(page: Page): Promise<void> {
  await page.goto(ZEFIX_ORIGIN, { waitUntil: 'domcontentloaded', timeout: CHALLENGE_TIMEOUT_MS })

  // Poll until Imperva sets the session cookie.
  const deadline = Date.now() + CHALLENGE_TIMEOUT_MS
  while (Date.now() < deadline) {
    await page.waitForTimeout(POLL_INTERVAL_MS)
    const cookies = await page.context().cookies(ZEFIX_ORIGIN)
    if (cookies.some((c) => c.name === 'cookiesession1')) break
  }

  // Let any remaining challenge scripts settle.
  await page.waitForLoadState('networkidle', { timeout: 8_000 }).catch(() => {})
}

export async function acquireZefixSession(): Promise<ZefixSession> {
  const browser: Browser = await chromium.launch({ headless: true })
  const context = await browser.newContext({
    userAgent:
      'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 ' +
      '(KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36',
  })

  const page: Page = await context.newPage()
  await warmUp(page)

  return {
    async request(url, { method, headers, body }) {
      // Run fetch() inside the browser so the request uses the browser's TLS
      // fingerprint and automatically carries the Imperva session cookies.
      const result = await page.evaluate<BrowserFetchResult, BrowserFetchArg>(
        async ({ url, method, headers, body }) => {
          const res = await fetch(url, { method, headers, body })
          return { ok: res.ok, status: res.status, text: await res.text() }
        },
        { url, method, headers, body },
      )

      return {
        ok: result.ok,
        status: result.status,
        text: async () => result.text,
        json: async () => JSON.parse(result.text) as unknown,
      }
    },

    async refresh() {
      await warmUp(page)
    },

    async close() {
      await browser.close()
    },
  }
}
