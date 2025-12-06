import { cn } from '@/utilities/ui'

import { Link } from '@/i18n/navigation'
import React, { Fragment } from 'react'

import type { BlogPost } from '@/payload-types'

import { Media } from '@/components/MediaResponsive'
import { formatDateTime } from '@/utilities/formatDateTime'
import { useLocale } from 'next-intl'

export type CardPostData = Pick<
  BlogPost,
  'slug' | 'categories' | 'meta' | 'title' | 'publishedAt' | 'heroImage'
>

export const Card: React.FC<{
  alignItems?: 'center'
  className?: string
  doc?: CardPostData
  relationTo?: 'blog' | 'news'
  showCategories?: boolean
  title?: string
}> = (props) => {
  const locale = useLocale()
  const { className, doc, relationTo, showCategories, title: titleFromProps } = props

  const { slug, categories, meta, title, publishedAt, heroImage } = doc || {}
  const { description, image: metaImage } = meta || {}

  const hasCategories = categories && Array.isArray(categories) && categories.length > 0
  const titleToUse = titleFromProps || title
  const sanitizedDescription = description?.replace(/\s/g, ' ') // replace non-breaking space with white space
  const href = `/${relationTo}/${slug}`

  const dataTimeFormat = locale === 'en' ? 'en-US' : 'ar-SA'
  return (
    <article
      className={cn(
        'grid grid-cols-1 gap-4 overflow-hidden hover:cursor-pointer max-md:gap-space-7 md:grid-cols-16',
        className,
      )}
    >
      {/* <div className="relative w-full">
        {!metaImage && <div className="">No image</div>}
        {metaImage && typeof metaImage !== 'string' && <Media resource={metaImage} size="33vw" />}
      </div> */}
      <div className="flex flex-col gap-2 pe-6 md:col-span-4">
        {publishedAt && (
          <span
            className="text-sm text-base-tertiary"
            // dateTime={publishedAt}
          >
            {formatDateTime(publishedAt, dataTimeFormat)}
          </span>
        )}
        {showCategories && hasCategories && (
          <div className="text-sm font-medium text-blr-orange uppercase">
            {showCategories &&
              hasCategories &&
              categories?.map((category, index) => {
                if (typeof category === 'object') {
                  const { title: titleFromCategory } = category

                  const categoryTitle = titleFromCategory || 'Untitled category'

                  const isLast = index === categories.length - 1

                  return (
                    <Fragment key={index}>
                      {categoryTitle}
                      {!isLast && <Fragment>, &nbsp;</Fragment>}
                    </Fragment>
                  )
                }

                return null
              })}
          </div>
        )}
      </div>
      <div className="pe-6 md:col-span-8">
        {titleToUse && (
          <h3 className="_rtl:leading-snug text-h3 font-semibold ltr:leading-tight">
            <Link className="hover:text-base-secondary" href={href}>
              {titleToUse}
            </Link>
          </h3>
        )}
        {description && <p className="mt-2 text-sm text-base-secondary">{sanitizedDescription}</p>}
      </div>
      {heroImage && (
        <Media
          resource={heroImage}
          className="h-full w-full md:col-span-4"
          imgClassName="h-auto w-full rounded-3xl object-cover"
        />
      )}
    </article>
  )
}
