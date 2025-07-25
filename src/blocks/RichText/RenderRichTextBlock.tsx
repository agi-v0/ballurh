import React from 'react'
import { RichTextBlock } from '@/payload-types'
import { RichText01 } from './variants/RichText01'
import { RichText02 } from './variants/RichText02'

type RichTextBlockWithLocale = RichTextBlock & {
  locale?: string
}

const richTextVariants: Record<string, React.FC<RichTextBlockWithLocale>> = {
  '01': RichText01 as React.FC<RichTextBlockWithLocale>,
  '02': RichText02 as React.FC<RichTextBlockWithLocale>,
}

export const RenderRichTextBlock: React.FC<RichTextBlockWithLocale> = (props) => {
  const { type = '01' } = props

  const RichTextBlockComponent = richTextVariants[type]

  if (!RichTextBlockComponent) {
    return null
  }

  return <RichTextBlockComponent {...props} />
}
