// import { Integration, Page, BlogPost, Solution } from '@/payload-types'
import { Page, BlogPost } from '@/payload-types'
import { DefaultTypedEditorState } from '@payloadcms/richtext-lexical'

export interface BlockHeaderType {
  className?: string | null
  badgeClassName?: string | null
  richTextClassName?: string | null
  linksClassName?: string | null
  type: 'center' | 'split' | 'start'
  badge?: {
    type?: ('label' | 'reference') | null
    label?: string | null
    color?: ('blue' | 'red' | 'green' | 'yellow' | 'gray' | 'inverted' | 'outline') | null
    /**
     * Select an icon from the Remix icon library. You can preview all available icons at https://remixicon.com/
     */
    icon?: string | null
    icon_position?: ('flex-row' | 'flex-row-reverse') | null
  }
  headerText?: {
    root: {
      type: string
      children: {
        type: string
        version: number
        [k: string]: unknown
      }[]
      direction: ('ltr' | 'rtl') | null
      format: 'left' | 'start' | 'center' | 'right' | 'end' | 'justify' | ''
      indent: number
      version: number
    }
    [k: string]: unknown
  } | null
  links?:
    | {
        link: {
          type?: ('reference' | 'custom') | null
          newTab?: boolean | null
          reference?:
            | ({
                relationTo: 'pages'
                value: string | Page
              } | null)
            | ({
                relationTo: 'blog-posts'
                value: string | BlogPost
              } | null)
          url?: string | null
          label: string
          /**
           * Choose the button style.
           */
          color?: ('brand' | 'neutral') | null
          /**
           * Choose how the link should be rendered.
           */
          variant?: ('primary' | 'secondary' | 'tertiary' | 'ghost' | 'link') | null
        }
        id?: string | null
      }[]
    | null
}
