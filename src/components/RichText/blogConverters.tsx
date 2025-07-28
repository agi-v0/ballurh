import { BannerBlock } from '@/blocks/Banner/Component'
import { RenderCallToActionBlock } from '@/blocks/CallToAction/RenderCallToActionBlock'
import { RenderFAQBlock } from '@/blocks/FAQ/RenderFAQBlock'
import { RenderGalleryBlock } from '@/blocks/Gallery/RenderGalleryBlock'
import { MediaBlock } from '@/blocks/MediaBlock/Component'
import { StyledListBlock } from '@/blocks/StyledList/Component'
import { formatSlug } from '@/utilities/formatSlug'
import type {
  BannerBlock as BannerBlockProps,
  CallToActionBlock as CTABlockProps,
  MediaBlock as MediaBlockProps,
} from '@/payload-types'
import {
  DefaultNodeTypes,
  SerializedBlockNode,
  SerializedHeadingNode,
  SerializedLinkNode,
} from '@payloadcms/richtext-lexical'
import { JSXConvertersFunction, LinkJSXConverter } from '@payloadcms/richtext-lexical/react'
import React from 'react'

type NodeTypes =
  | DefaultNodeTypes
  | SerializedBlockNode<CTABlockProps | MediaBlockProps | BannerBlockProps>

const internalDocToHref = ({ linkNode }: { linkNode: SerializedLinkNode }) => {
  const { value, relationTo } = linkNode.fields.doc!
  if (typeof value !== 'object') {
    throw new Error('Expected value to be an object')
  }
  const slug = value.slug
  return relationTo === 'blog-posts' ? `/blog/${slug}` : `/${slug}`
}

export const blogConverters: JSXConvertersFunction<NodeTypes> = ({ defaultConverters }) => ({
  ...defaultConverters,
  heading: ({ node }) => {
    const headingNode = node as SerializedHeadingNode
    const text = extractTextFromHeading(headingNode)
    const slug = formatSlug(text)

    // Create the heading element dynamically based on the tag
    return React.createElement(
      headingNode.tag,
      {
        id: slug,
        style: {
          borderBottom: headingNode.tag === 'h2' ? '1px solid var(--border)' : 'none',
          paddingBottom: headingNode.tag === 'h2' ? 'calc(var(--spacing) * 2)' : '0',
        },
      },
      text,
    )
  },
  ...LinkJSXConverter({ internalDocToHref }),
  blocks: {
    banner: ({ node }) => <BannerBlock className="col-start-2 mb-4" {...node.fields} />,
    mediaBlock: ({ node }) => (
      <MediaBlock
        className="col-span-3 col-start-1"
        imgClassName="m-0"
        {...node.fields}
        captionClassName="mx-auto max-w-[48rem]"
        enableGutter={false}
        disableInnerContainer={true}
      />
    ),

    // code: ({ node }) => <CodeBlock className="col-start-2" {...node.fields} />,
    callToActionBlock: ({ node }) => (
      <RenderCallToActionBlock {...node.fields} className="p-0 !py-0" />
    ),
    // styledListBlock: ({ node }) => <StyledListBlock {...node.fields} />,
  },
})

// Helper function to extract text content from heading node
const extractTextFromHeading = (node: SerializedHeadingNode): string => {
  if (!node.children) return ''

  return node.children
    .map((child: any) => {
      if (child.type === 'text') {
        return child.text || ''
      }
      // Handle nested elements if needed
      return ''
    })
    .join('')
}
