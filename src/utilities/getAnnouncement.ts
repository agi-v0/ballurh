import type { Setting, BlogPost } from 'src/payload-types'
import configPromise from '@payload-config'
import { getPayload } from 'payload'
import { unstable_cache } from 'next/cache'

export interface Announcement {
  text: string
  link: {
    type?: 'reference' | 'custom' | null
    newTab?: boolean | null
    reference?: {
      relationTo: 'pages' | 'blog-posts' | 'news'
      value: string | any
    } | null
    url?: string | null
    label: string
  }
}

/**
 * Gets announcement data from settings or falls back to recent blog posts
 * Returns null if no announcement bar is set and no recent blog posts exist
 */
async function getAnnouncement(locale: string): Promise<Announcement | null> {
  const payload = await getPayload({ config: configPromise })

  // First, try to get the settings global
  const settings = (await payload.findGlobal({
    slug: 'settings',
    depth: 1,
    locale: locale as 'ar' | 'en',
    fallbackLocale: false,
  })) as Setting

  // Check if there's an enabled announcement
  if (settings?.announcement?.enableAnnouncement) {
    return {
      text: settings.announcement.text || '',
      link: settings.announcement.link || {
        type: 'reference',
        reference: null,
        label: '',
      },
    }
  }

  // If no announcement, look for recent blog posts (within last 2 weeks)
  const twoWeeksAgo = new Date()
  twoWeeksAgo.setDate(twoWeeksAgo.getDate() - 14)

  const recentPosts = await payload.find({
    collection: 'blog-posts',
    depth: 0,
    limit: 1,
    pagination: false,
    fallbackLocale: false,
    where: {
      and: [
        {
          _status: {
            equals: 'published',
          },
        },
        {
          publishedAt: {
            greater_than: twoWeeksAgo.toISOString(),
          },
        },
      ],
    },
    sort: '-publishedAt',
    select: {
      title: true,
      slug: true,
    },
  })

  // If we found a recent post, return it as announcement data
  if (recentPosts.docs.length > 0) {
    const post = recentPosts.docs[0] as BlogPost
    return {
      text: post.title,
      link: {
        type: 'reference',
        reference: {
          relationTo: 'blog-posts',
          value: post.slug,
        },
        label: 'Read more',
      },
    }
  }

  // No announcement and no recent posts
  return null
}

/**
 * Returns a cached version of the announcement data
 */
export const getCachedAnnouncement = (locale: string) =>
  unstable_cache(async () => getAnnouncement(locale), ['announcement-data', locale], {
    tags: ['announcement-data'],
  })
