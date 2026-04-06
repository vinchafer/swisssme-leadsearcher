import Link from 'next/link'

export default function NotFound() {
  return (
    <div className="flex items-center justify-center min-h-[60vh]">
      <div className="text-center">
        <h1 className="text-6xl font-bold text-[#222222] mb-4">404</h1>
        <h2 className="text-xl font-semibold text-white mb-2">Page not found</h2>
        <p className="text-[#888888] text-sm mb-6">The page you&apos;re looking for doesn&apos;t exist.</p>
        <Link href="/" className="px-4 py-2 bg-[#3b82f6] hover:bg-[#2563eb] text-white rounded-lg text-sm transition-colors">
          Go home
        </Link>
      </div>
    </div>
  )
}
