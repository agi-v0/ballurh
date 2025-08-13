import type { Page } from '@/payload-types'
import { extractTextFromLexical, countWords } from './extractTextFromLexical'

/**
 * Checks if a page has at least one word in the hero section
 * @param page - The page object to check
 * @returns true if the hero contains at least one word, false otherwise
 */
export const hasHeroContent = (page: Page): boolean => {
  if (!page?.hero) return false

  const { hero } = page

  // Check if hero type is 'none' - no content
  if (hero.type === 'none') return false

  let totalWordCount = 0

  // Check richText content
  if (hero.richText) {
    const richTextContent = extractTextFromLexical(hero.richText)
    totalWordCount += countWords(richTextContent)
  }

  // Check badge label
  if (hero.badge?.label) {
    totalWordCount += countWords(hero.badge.label)
  }

  // Check caption
  if (hero.caption) {
    totalWordCount += countWords(hero.caption)
  }

  // Check list items
  if (hero.list?.items && Array.isArray(hero.list.items)) {
    for (const item of hero.list.items) {
      if (item.text) {
        totalWordCount += countWords(item.text)
      }
    }
  }

  // Check logos headline
  if (hero.logos?.headline) {
    totalWordCount += countWords(hero.logos.headline)
  }

  return totalWordCount > 0
}

/**
 * Gets the total word count in the hero section
 * @param page - The page object to check
 * @returns The total number of words in the hero section
 */
export const getHeroWordCount = (page: Page): number => {
  if (!page?.hero) return 0

  const { hero } = page

  if (hero.type === 'none') return 0

  let totalWordCount = 0

  // Check richText content
  if (hero.richText) {
    const richTextContent = extractTextFromLexical(hero.richText)
    totalWordCount += countWords(richTextContent)
  }

  // Check badge label
  if (hero.badge?.label) {
    totalWordCount += countWords(hero.badge.label)
  }

  // Check caption
  if (hero.caption) {
    totalWordCount += countWords(hero.caption)
  }

  // Check list items
  if (hero.list?.items && Array.isArray(hero.list.items)) {
    for (const item of hero.list.items) {
      if (item.text) {
        totalWordCount += countWords(item.text)
      }
    }
  }

  // Check logos headline
  if (hero.logos?.headline) {
    totalWordCount += countWords(hero.logos.headline)
  }

  return totalWordCount
}

/**
 * Gets a breakdown of word counts by content type in the hero section
 * @param page - The page object to check
 * @returns An object with word counts for each content type
 */
export const getHeroContentBreakdown = (
  page: Page,
): {
  richText: number
  badge: number
  caption: number
  listItems: number
  logosHeadline: number
  total: number
} => {
  if (!page?.hero) {
    return {
      richText: 0,
      badge: 0,
      caption: 0,
      listItems: 0,
      logosHeadline: 0,
      total: 0,
    }
  }

  const { hero } = page

  if (hero.type === 'none') {
    return {
      richText: 0,
      badge: 0,
      caption: 0,
      listItems: 0,
      logosHeadline: 0,
      total: 0,
    }
  }

  let richTextCount = 0
  let badgeCount = 0
  let captionCount = 0
  let listItemsCount = 0
  let logosHeadlineCount = 0

  // Check richText content
  if (hero.richText) {
    const richTextContent = extractTextFromLexical(hero.richText)
    richTextCount = countWords(richTextContent)
  }

  // Check badge label
  if (hero.badge?.label) {
    badgeCount = countWords(hero.badge.label)
  }

  // Check caption
  if (hero.caption) {
    captionCount = countWords(hero.caption)
  }

  // Check list items
  if (hero.list?.items && Array.isArray(hero.list.items)) {
    for (const item of hero.list.items) {
      if (item.text) {
        listItemsCount += countWords(item.text)
      }
    }
  }

  // Check logos headline
  if (hero.logos?.headline) {
    logosHeadlineCount = countWords(hero.logos.headline)
  }

  const total = richTextCount + badgeCount + captionCount + listItemsCount + logosHeadlineCount

  return {
    richText: richTextCount,
    badge: badgeCount,
    caption: captionCount,
    listItems: listItemsCount,
    logosHeadline: logosHeadlineCount,
    total,
  }
}
