'use client'

import {
  Select,
  SelectContent,
  SelectItem,
  SelectTrigger,
  SelectValue,
} from '@/components/ui/select'
import React, { useState, useEffect } from 'react'
import { useRouter } from 'next/navigation'
import { GlobeIcon } from 'lucide-react'

export const LanguageSwitcher: React.FC<{ locale: string }> = ({ locale }) => {
  const router = useRouter()
  const [value, setValue] = useState(locale) // Set initial value to the current locale

  const languages = [
    { code: 'ar', label: 'العربية' },
    { code: 'en', label: 'EN' },
  ]

  const onLanguageChange = (newLocale: string) => {
    const currentPath = window.location.pathname
    const newPath = currentPath.replace(`/${locale}`, `/${newLocale}`)
    router.push(newPath)
    setValue(newLocale)
  }

  useEffect(() => {
    setValue(locale) // Ensure the selected value stays updated when the locale changes
  }, [locale])

  return (
    <Select onValueChange={onLanguageChange} value={value}>
      <SelectTrigger
        aria-label="Select a language"
        className="w-auto gap-1 rounded-xl border-none bg-transparent px-3 text-sm text-base-secondary hover:bg-neutral/10 data-[state=open]:bg-transparent"
      >
        {value !== 'en' ? 'EN' : 'العربية'}
        {/* <GlobeIcon className="size-4 text-base-tertiary" /> */}
      </SelectTrigger>
      <SelectContent
        position="popper"
        align="center"
        className="space-y-0.5 rounded-xl border-none bg-white/10 p-1 shadow-sm backdrop-blur-xs"
      >
        {languages.map((language) => (
          <SelectItem
            key={language.code}
            value={language.code}
            className="rounded-[10px] hover:bg-neutral/5!"
          >
            {language.label}
          </SelectItem>
        ))}
      </SelectContent>
    </Select>
  )
}
