import Link from 'next/link'
import { Radar } from 'lucide-react'

export function Navbar() {
  return (
    <nav className="sticky top-0 z-50 border-b border-[#222222] bg-[#0d0d0d]/95 backdrop-blur-sm">
      <div className="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8">
        <div className="flex h-16 items-center justify-between">
          <Link href="/" className="flex items-center gap-2 text-white hover:text-[#3b82f6] transition-colors">
            <Radar className="h-6 w-6 text-[#3b82f6]" />
            <span className="font-semibold text-lg">Swiss AI Radar</span>
          </Link>
          <div className="flex items-center gap-6">
            <Link href="/companies" className="text-[#888888] hover:text-white text-sm transition-colors">
              Companies
            </Link>
            <Link href="/companies" className="bg-[#3b82f6] hover:bg-[#2563eb] text-white px-4 py-1.5 rounded text-sm font-medium transition-colors">
              Explore
            </Link>
          </div>
        </div>
      </div>
    </nav>
  )
}
