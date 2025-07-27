import React from 'react'
import { CMSLink } from '@/components/Link'
import RichText from '@/components/RichText'
import { Badge } from '@/components/ui/badge'
import { cn } from '@/utilities/ui'
import { BlockHeaderType } from '@/components/BlockHeader/types'
import { countWords, extractTextFromLexical } from '@/utilities/extractTextFromLexical'

export const BlockHeader: React.FC<BlockHeaderType> = (props) => {
  const {
    headerText,
    links,
    badge,
    className,
    badgeClassName,
    richTextClassName,
    linksClassName,
    type,
  } = props

  const headerTextLength = countWords(extractTextFromLexical(headerText))

  if (!headerTextLength) return null

  return (
    <div
      className={cn(
        'pt-section-large',
        'gap-y-space-md container grid grid-cols-1 justify-items-start',
        type === 'split' && 'md:gap-space-sm md:grid-cols-2',
        type === 'center' && 'justify-items-center',
        className,
      )}
    >
      {badge?.label && <Badge size="lg" {...badge} className={cn('col-span-2', badgeClassName)} />}

      {headerText && (
        <RichText
          className={cn(
            'mx-0 w-full max-w-4xl',
            type === 'center' && 'text-center text-pretty',
            type === 'split' &&
              'md:col-span-2 md:grid md:grid-cols-subgrid [&>*:is(h1,h2,h3,h4,h5,h6)]:pe-(--spacing-xl)',
            '[&_p]:text-body-lg',
            richTextClassName,
          )}
          data={headerText}
          enableGutter={false}
        />
      )}
      {Array.isArray(links) && links.length > 0 && (
        <ul
          className={cn(
            'col-span-2 flex w-full flex-row gap-1',
            type === 'center' && 'justify-center',
            type === 'split' && 'md:col-start-2',
            linksClassName,
          )}
        >
          {links.map(({ link }, i) => {
            return (
              <li key={i} className="">
                <CMSLink className="w-full" size={'lg'} {...link} />
              </li>
            )
          })}
        </ul>
      )}
    </div>
  )
}
