export default function Loading() {
  return (
    <div className="mx-auto max-w-4xl px-4 sm:px-6 lg:px-8 py-8">
      <div className="h-4 w-24 bg-[#1a1a1a] rounded animate-pulse mb-6" />
      <div className="bg-[#111111] border border-[#222222] rounded-lg p-8 animate-pulse">
        <div className="flex items-start gap-4 mb-6">
          <div className="w-16 h-16 bg-[#1a1a1a] rounded-xl" />
          <div>
            <div className="h-8 w-48 bg-[#1a1a1a] rounded mb-2" />
            <div className="h-4 w-32 bg-[#1a1a1a] rounded" />
          </div>
        </div>
        <div className="h-4 w-full bg-[#1a1a1a] rounded mb-2" />
        <div className="h-4 w-3/4 bg-[#1a1a1a] rounded" />
      </div>
    </div>
  )
}
