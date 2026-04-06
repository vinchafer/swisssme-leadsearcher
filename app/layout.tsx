import type { Metadata } from 'next'
import { Inter } from 'next/font/google'
import './globals.css'
import { Navbar } from '@/components/Navbar'

const inter = Inter({ subsets: ['latin'] })

export const metadata: Metadata = {
  title: 'Swiss AI Radar — AI Company Directory Switzerland',
  description: 'Discover and explore AI companies in Switzerland. Filter by canton, domain, funding stage, and more.',
  openGraph: {
    title: 'Swiss AI Radar',
    description: 'The definitive directory of AI companies in Switzerland',
    type: 'website',
  },
}

export default function RootLayout({ children }: { children: React.ReactNode }) {
  return (
    <html lang="en" className="dark">
      <body className={`${inter.className} bg-[#0d0d0d] text-white min-h-screen`}>
        <Navbar />
        <main>{children}</main>
        <footer className="border-t border-[#1a1a1a] mt-12 py-6 px-4 text-center">
          <p className="text-xs text-[#555555] leading-relaxed max-w-2xl mx-auto">
            Firmendaten: © Zefix / EHRA (eidg. Amt für das Handelsregister).{' '}
            Daten ohne Gewähr. Verbindlich ist einzig der beglaubigte Registerauszug
            des zuständigen Handelsregisteramts.
          </p>
        </footer>
      </body>
    </html>
  )
}
