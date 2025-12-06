export const formatDateTime = (timestamp?: string, locale: string = 'ar-SA'): string => {
  const now = new Date()
  let date = now
  if (timestamp) date = new Date(timestamp)
  return date
    .toLocaleDateString(locale, {
      day: '2-digit',
      month: 'short',
      year: 'numeric',
    })
    .toLocaleUpperCase()
}
