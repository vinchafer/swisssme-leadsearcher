'use client'
import { useEffect } from 'react'
import Link from 'next/link'

export default function Error({ error, reset }: { error: Error & { digest?: string }; reset: () => void }) {
  useEffect(() => {
    console.error(error)
  }, [error])

  return (
    <div className="flex items-center justify-center min-h-[60vh]">
      <div className="text-center">
        <h2 className="text-xl font-semibold text-white mb-2">Something went wrong</h2>
        <p className="text-[#888888] text-sm mb-4">{error.message}</p>
        <div className="flex gap-3 justify-center">
          <button onClick={reset} className="px-4 py-2 bg-[#3b82f6] hover:bg-[#2563eb] text-white rounded-lg text-sm transition-colors">
            Try again
          </button>
          <Link href="/" className="px-4 py-2 border border-[#222222] text-[#888888] hover:text-white rounded-lg text-sm transition-colors">
            Go home
          </Link>
        </div>
      </div>
    </div>
  )
}
