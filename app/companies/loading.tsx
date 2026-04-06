export default function Loading() {
  return (
    <div className="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8 py-8">
      <div className="h-8 w-48 bg-[#1a1a1a] rounded mb-6 animate-pulse" />
      <div className="flex gap-6">
        <div className="w-72 h-96 bg-[#111111] border border-[#222222] rounded-lg animate-pulse hidden lg:block" />
        <div className="flex-1 grid grid-cols-1 sm:grid-cols-2 xl:grid-cols-3 gap-4">
          {Array.from({ length: 6 }).map((_, i) => (
            <div key={i} className="h-48 bg-[#111111] border border-[#222222] rounded-lg animate-pulse" />
          ))}
        </div>
      </div>
    </div>
  )
}
