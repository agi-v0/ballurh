import {
  DefaultNodeTypes,
  SerializedBlockNode,
  SerializedLinkNode,
  SerializedHeadingNode,
} from '@payloadcms/richtext-lexical'
import { SerializedEditorState } from '@payloadcms/richtext-lexical/lexical'
import {
  JSXConvertersFunction,
  RichText as RichTextWithoutBlocks,
} from '@payloadcms/richtext-lexical/react'
import { formatSlug } from '@/utilities/formatSlug'
import { cn } from '@/utilities/ui'
import Link from 'next/link'

type NodeTypes = DefaultNodeTypes | SerializedBlockNode<any>

const internalDocToHref = ({ linkNode }: { linkNode: SerializedLinkNode }) => {
  const { value, relationTo } = linkNode.fields.doc!
  if (typeof value !== 'object') {
    throw new Error('Expected value to be an object')
  }
  const slug = value.slug
  return relationTo === 'blog-posts' ? `/blog/${slug}` : `/${slug}`
}

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

const jsxConverters: JSXConvertersFunction<NodeTypes> = ({ defaultConverters }) => ({
  // Hide all other content types - only show headings
  paragraph: () => null,
  text: () => null,
  linebreak: () => null,
  list: () => null,
  listitem: () => null,
  link: () => null,
  quote: () => null,
  blocks: {},
  // Handle all unknown nodes
  unknown: () => null,
  // Lexical uses 'heading' as the node type with a 'tag' property
  heading: ({ node }) => {
    const headingNode = node as SerializedHeadingNode
    const text = extractTextFromHeading(headingNode)
    const slug = formatSlug(text)

    // Get padding based on heading level
    const getPaddingClass = (tag: string) => {
      switch (tag) {
        case 'h1':
          return ''
        case 'h2':
          return 'ps-2'
        case 'h3':
          return 'ps-4'
        case 'h4':
          return 'ps-6'
        default:
          return ''
      }
    }

    const paddingClass = getPaddingClass(headingNode.tag)

    return (
      <Link
        href={`#${slug}`}
        className={cn(
          'group text-body-md flex flex-row items-center gap-2 font-medium text-(color:--color-base-tertiary) transition-colors hover:text-base-primary',
        )}
      >
        {/* <div className="group-hover:bg-base-primary bg-base-quaternary w-0.25 flex-none self-stretch transition-colors" /> */}
        <span className={cn('py-1.5', paddingClass)}>{text}</span>
      </Link>
    )
  },
})

type Props = {
  data: SerializedEditorState
  enableGutter?: boolean
  enableProse?: boolean
} & React.HTMLAttributes<HTMLDivElement>

export default function HeadingLinks(props: Props) {
  const { className, enableProse = false, enableGutter = true, ...rest } = props
  return (
    <RichTextWithoutBlocks
      converters={jsxConverters}
      className={cn(
        {
          'container px-0': enableGutter,
          'max-w-none': !enableGutter,
          'mx-auto prose': enableProse,
        },
        className,
      )}
      {...rest}
    />
  )
}
