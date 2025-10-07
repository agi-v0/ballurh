import type { CollectionAfterChangeHook, CollectionAfterDeleteHook } from 'payload'

import { revalidatePath, revalidateTag } from 'next/cache'

import type { BlogPost } from '../../../payload-types'

export const revalidatePost: CollectionAfterChangeHook<BlogPost> = ({
  doc,
  previousDoc,
  req: { payload, context, locale },
}) => {
  if (!context.disableRevalidate) {
    if (doc._status === 'published') {
      const path = `/${locale}/news/${doc.slug}`

      payload.logger.info(`Revalidating post at path: ${path}`)

      revalidatePath(path)
      revalidatePath(`/${locale}/news`)
      revalidateTag('news-sitemap')
    }

    // If the post was previously published, we need to revalidate the old path
    if (previousDoc._status === 'published' && doc._status !== 'published') {
      const oldPath = `/${locale}/news/${previousDoc.slug}`

      payload.logger.info(`Revalidating old post at path: ${oldPath}`)

      revalidatePath(oldPath)
      revalidatePath(`/${locale}/news`)
      revalidateTag('news-sitemap')
    }
  }
  return doc
}

export const revalidateDelete: CollectionAfterDeleteHook<BlogPost> = ({
  doc,
  req: { context, locale },
}) => {
  if (!context.disableRevalidate) {
    const path = `/${locale}/news/${doc.slug}`

    revalidatePath(path)
    revalidateTag('news-sitemap')
  }

  return doc
}
