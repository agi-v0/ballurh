import { formatDateTime } from 'src/utilities/formatDateTime'
import React from 'react'

import type { BlogPost, Media as MediaType, User } from '@/payload-types'

import { Media } from '@/components/MediaResponsive'
import { formatAuthors } from '@/utilities/formatAuthors'
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
    <div className="relative z-1 container pt-header pb-8">
      {categories && categories.length > 1 && (
        <div className="mb-6 text-sm uppercase">
          {categories.map((category, index) => {
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
      )}

      <h1 className="mb-8 text-center text-h1 font-semibold text-base-primary ltr:leading-[1.125] rtl:leading-snug">
        {title}
      </h1>

      <div className="flex flex-row justify-center gap-space-8">
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
            <p className="text-main font-medium text-base-secondary">
              {formatAuthors(populatedAuthors)}
            </p>
          </div>
        )}
        {publishedAt && (
          <div className="flex flex-col items-center gap-2 text-base-tertiary">
            <span className="text-sm">{t('publishedAt')}</span>
            <time className="text-main text-base-secondary" dateTime={publishedAt}>
              {formatDateTime(publishedAt)}
            </time>
          </div>
        )}
        {content && (
          <div className="flex flex-col items-center gap-2 text-base-tertiary">
            <span className="text-sm">{t('readTime')}</span>
            <p className="text-main text-base-secondary">{readTime.text}</p>
          </div>
        )}
      </div>
      {heroImage && typeof heroImage !== 'string' && (
        <Media
          className="relative container mt-8 h-auto w-full max-w-4xl select-none"
          priority
          imgClassName="rounded-3xl object-cover"
          resource={heroImage}
        />
      )}
    </div>
  )
}
