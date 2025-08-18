import type { Block } from 'payload'
import {
  FixedToolbarFeature,
  HeadingFeature,
  InlineToolbarFeature,
  lexicalEditor,
  BlocksFeature,
} from '@payloadcms/richtext-lexical'
import { blockHeader } from '@/components/BlockHeader/config'
import { StyledList } from '@/blocks/StyledList/config'

const richTextEditor = lexicalEditor({
  features: ({ rootFeatures }) => {
    return [
      ...rootFeatures,
      FixedToolbarFeature(),
      InlineToolbarFeature(),
      HeadingFeature({ enabledHeadingSizes: ['h1', 'h2', 'h3', 'h4', 'h5', 'h6'] }),
      BlocksFeature({ blocks: [StyledList] }),
    ]
  },
})

export const RichTextBlock: Block = {
  slug: 'richTextBlock',
  labels: {
    singular: 'Rich Text',
    plural: 'Rich Text',
  },
  interfaceName: 'RichTextBlock',
  dbName: 'richTextBlock',
  fields: [
    blockHeader,
    {
      type: 'group',
      label: 'Block Content',
      fields: [
        {
          name: 'type',
          type: 'select',
          defaultValue: '01',
          options: [
            { label: '01 - Standard', value: '01' },
            { label: '02 - Card', value: '02' },
          ],
          required: true,
        },
        {
          name: 'maxWidth',
          type: 'select',
          defaultValue: 'default',
          options: [
            { label: 'Default', value: 'default' },
            { label: 'Small', value: 'small' },
            { label: 'Large', value: 'large' },
            { label: 'Full Width', value: 'full' },
          ],
          admin: {
            description: 'Controls the maximum width of the content container',
          },
        },
        {
          name: 'columns',
          type: 'number',
          defaultValue: 1,
          required: true,
          max: 3,
          min: 1,
          admin: {
            description: 'Controls the number of columns in the content',
          },
        },
        {
          name: 'content',
          type: 'richText',
          editor: richTextEditor,
          required: true,
          localized: true,
        },
      ],
    },
  ],
}
