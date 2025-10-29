import type { FieldHook } from 'payload'

const MAX_SEGMENT = 236 // leave room for ".rsc" etc.

export const formatSlug = (val: string): string => {
  let slug = val
    .replace(/ /g, '-')
    .replace(/[^\w\u0600-\u06FF\u0750-\u077F-\/]+/g, '')
    .toLowerCase()
  // trim long slug
  while (encodeURIComponent(slug).length > MAX_SEGMENT) {
    const cut = slug.lastIndexOf('-')
    slug = cut > 0 ? slug.slice(0, cut) : slug.slice(0, slug.length - 1)
  }
  return slug
}

export const formatSlugHook =
  (fallback: string): FieldHook =>
  ({ data, operation, originalDoc, value }) => {
    if (typeof value === 'string') {
      return formatSlug(value)
    }

    if (operation === 'create' || !data?.slug) {
      const fallbackData = data?.[fallback] || originalDoc?.[fallback]

      if (fallbackData && typeof fallbackData === 'string') {
        return formatSlug(value)
      }
    }

    return value
  }
