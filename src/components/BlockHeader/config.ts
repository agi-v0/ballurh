import type { Field } from 'payload'

import {
  FixedToolbarFeature,
  HeadingFeature,
  InlineToolbarFeature,
  lexicalEditor,
  BlocksFeature,
} from '@payloadcms/richtext-lexical'

import { linkGroup } from '@/fields/linkGroup'
import { badge } from '@/fields/badge'
import { StyledList } from '@/blocks/StyledList/config'

const editorWithStyledList = lexicalEditor({
  features: ({ rootFeatures }) => {
    return [
      ...rootFeatures,
      HeadingFeature({ enabledHeadingSizes: ['h2', 'h3', 'h4'] }),
      FixedToolbarFeature(),
      InlineToolbarFeature(),
      BlocksFeature({ blocks: [StyledList] }),
    ]
  },
})

export const blockHeader: Field = {
  name: 'blockHeader',
  type: 'group',
  label: 'Block Header',
  interfaceName: 'BlockHeader',
  fields: [
    {
      name: 'type',
      type: 'select',
      defaultValue: 'center',
      label: 'Type',
      options: [
        {
          label: 'Center',
          value: 'center',
        },
        {
          label: 'Split',
          value: 'split',
        },
        {
          label: 'Start',
          value: 'start',
        },
      ],
      required: true,
    },
    badge({}),

    {
      name: 'headerText',
      type: 'richText',
      editor: editorWithStyledList,
      label: false,
      localized: true,
    },
    linkGroup({
      overrides: {
        maxRows: 2,
      },
    }),
  ],
}
