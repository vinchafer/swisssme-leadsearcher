import { type ClassValue, clsx } from 'clsx'
import { twMerge } from 'tailwind-merge'

export function cn(...inputs: ClassValue[]) {
  return twMerge(clsx(inputs))
}

export function formatCHF(amount: number | null): string {
  if (amount === null || amount === 0) return 'N/A'
  if (amount >= 1_000_000_000) return `CHF ${(amount / 1_000_000_000).toFixed(1)}B`
  if (amount >= 1_000_000) return `CHF ${(amount / 1_000_000).toFixed(0)}M`
  if (amount >= 1_000) return `CHF ${(amount / 1_000).toFixed(0)}K`
  return `CHF ${amount}`
}

export function formatEmployeeRange(min: number | null, max: number | null): string {
  if (!min && !max) return 'N/A'
  if (!max) return `${min}+`
  return `${min}–${max}`
}

export function getStageColor(stage: string | null): string {
  const colors: Record<string, string> = {
    'Bootstrapped': 'bg-gray-700 text-gray-300',
    'Pre-Seed': 'bg-purple-900 text-purple-300',
    'Seed': 'bg-blue-900 text-blue-300',
    'Series A': 'bg-green-900 text-green-300',
    'Series B': 'bg-yellow-900 text-yellow-300',
    'Series C': 'bg-orange-900 text-orange-300',
    'Series C+': 'bg-orange-900 text-orange-300',
    'Growth': 'bg-red-900 text-red-300',
    'Public': 'bg-teal-900 text-teal-300',
    'Unknown': 'bg-gray-800 text-gray-400',
    'Series D': 'bg-pink-900 text-pink-300',
    'Series E': 'bg-rose-900 text-rose-300',
    'Series F': 'bg-fuchsia-900 text-fuchsia-300',
  }
  return colors[stage ?? ''] ?? 'bg-gray-800 text-gray-400'
}

export function getDomainColor(domain: string): string {
  const colors: Record<string, string> = {
    'NLP': '#3b82f6',
    'Computer Vision': '#22c55e',
    'MLOps': '#818cf8',
    'FinTech AI': '#f97316',
    'HealthTech AI': '#ec4899',
    'Robotic AI': '#eab308',
    'Data Analytics': '#06b6d4',
    'Generative AI': '#a855f7',
    'Cybersecurity AI': '#ef4444',
    'Other': '#888888',
  }
  return colors[domain] ?? '#888888'
}
