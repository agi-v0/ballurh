import React from 'react'
import { CustomHtmlBlock as CustomHtmlBlockType } from '@/payload-types'

export const RenderCustomHtmlBlock: React.FC<CustomHtmlBlockType> = ({
  blockHeader,
  htmlContent,
}) => {
  if (!htmlContent) {
    return null
  }

  return (
    <section className="custom-html-block container">
      <div dangerouslySetInnerHTML={{ __html: htmlContent }} />
    </section>
  )
}
