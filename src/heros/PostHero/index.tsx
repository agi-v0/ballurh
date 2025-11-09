import { formatDateTime } from 'src/utilities/formatDateTime'
import React from 'react'

import type { BlogPost, Media as MediaType, User } from '@/payload-types'

import { Media } from '@/components/MediaResponsive'
import { formatAuthors } from '@/utilities/formatAuthors'
import { Icon } from '@iconify-icon/react/dist/iconify.mjs'
import { getReadTimeFromLexical } from '@/utilities/extractTextFromLexical'
import { useLocale, useTranslations } from 'next-intl'

export const PostHero: React.FC<{
  post: BlogPost
}> = ({ post }) => {
  const t = useTranslations('Blog')
  const locale = useLocale() as 'en' | 'ar'

  const { categories, heroImage, populatedAuthors, publishedAt, title, content } = post

  const hasAuthors =
    populatedAuthors && populatedAuthors.length > 0 && formatAuthors(populatedAuthors) !== ''

  const readTime = getReadTimeFromLexical(content, locale, t)

  return (
    <div className="relative -mt-header flex items-end">
      <div className="relative z-1 container pb-8 text-white">
        <div className="mb-6 text-sm uppercase">
          {categories?.map((category, index) => {
            if (typeof category === 'object' && category !== null) {
              const { title: categoryTitle } = category

              const titleToUse = categoryTitle || 'Untitled category'

              const isLast = index === categories.length - 1

              return (
                <React.Fragment key={index}>
                  {titleToUse}
                  {!isLast && <React.Fragment>, &nbsp;</React.Fragment>}
                </React.Fragment>
              )
            }
            return null
          })}
        </div>

        <h1 className="mb-8 text-h1 font-semibold">{title}</h1>

        <div className="flex flex-col gap-4 md:flex-row md:gap-space-8">
          {hasAuthors && (
            <div className="flex flex-row items-center gap-2">
              <div className="flex flex-row items-center -space-x-[0.6rem]">
                {populatedAuthors.map((author: any) => {
                  if (!author.avatar) return null
                  return (
                    <Media
                      key={author.id}
                      resource={author.avatar as MediaType}
                      imgClassName="object-cover"
                      className="size-6 shrink-0 overflow-hidden rounded-full ring-3 ring-background-neutral md:size-8 lg:size-10"
                    />
                  )
                })}
              </div>
              <p className="text-main font-medium text-inverted-secondary">
                {formatAuthors(populatedAuthors)}
              </p>
            </div>
          )}
          {publishedAt && (
            <div className="flex flex-col gap-2 text-inverted-tertiary">
              <span className="text-sm">{t('publishedAt')}</span>
              <time className="text-main text-inverted-secondary" dateTime={publishedAt}>
                {formatDateTime(publishedAt)}
              </time>
            </div>
          )}
          {content && (
            <div className="flex flex-col gap-2 text-inverted-tertiary">
              <span className="text-sm">{t('readTime')}</span>
              <p className="text-main text-inverted-secondary">{readTime.text}</p>
            </div>
          )}
        </div>
      </div>
      <div className="min-h-[80vh] select-none">
        {heroImage && typeof heroImage !== 'string' && (
          <Media fill priority imgClassName="-z-10 object-cover" resource={heroImage} />
        )}
        <div className="pointer-events-none absolute bottom-0 left-0 h-1/2 w-full bg-linear-to-t from-slate-950 to-transparent" />
      </div>
    </div>
  )
}
