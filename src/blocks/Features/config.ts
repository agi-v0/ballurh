import { deepMerge, type Block, type Field } from 'payload'

import {
  FixedToolbarFeature,
  HeadingFeature,
  InlineToolbarFeature,
  lexicalEditor,
  BlocksFeature,
} from '@payloadcms/richtext-lexical'

import { link } from '@/fields/link'
import { blockHeader } from '@/components/BlockHeader/config'
import { badge } from '@/fields/badge'
import { iconPickerField } from '@/fields/iconPickerField'
import remixIcons from '@/fields/iconPickerField/remix-icons.json'
import { StyledList } from '@/blocks/StyledList/config'

const richTextEditor = lexicalEditor({
  features: ({ rootFeatures }) => {
    return [
      ...rootFeatures,
      FixedToolbarFeature(),
      InlineToolbarFeature(),
      HeadingFeature({ enabledHeadingSizes: ['h2', 'h3', 'h4'] }),
      BlocksFeature({ blocks: [StyledList] }),
    ]
  },
})

const textGroup = (options: Partial<Field>) => {
  const group: Field = {
    name: 'content',
    type: 'group',
    label: false,
    fields: [
      { name: 'title', type: 'text', label: 'Title', required: true, localized: true },
      {
        name: 'subtitle',
        type: 'textarea',
        label: 'Subtitle',
        localized: true,
      },
    ],
  }
  return deepMerge(group, options)
}

const sizeOptions = [
  { label: 'Half', value: 'half' },
  { label: 'Full', value: 'full' },
  { label: 'One Third', value: 'oneThird' },
  { label: 'Two Thirds', value: 'twoThirds' },
  { label: '60 Percent', value: 'sixtyPercent' },
  { label: '40 Percent', value: 'fortyPercent' },
]

export const FeaturesBlock: Block = {
  slug: 'featuresBlock',
  labels: {
    singular: 'Features',
    plural: 'Features',
  },
  interfaceName: 'FeaturesBlock',
  dbName: 'featuresBlock',
  fields: [
    blockHeader,
    {
      name: 'type',
      type: 'select',
      defaultValue: '01',
      options: [
        { label: '01 - Bento', value: '01' },
        { label: '02 - Bento (2) [NOT READY]', value: '02' },
        { label: '03 - Simple Grid (Mini cards)', value: '03' },
        { label: '04 - Basic Image with Text [NOT READY]', value: '04' },
        { label: '05 - Basic Image with Text (2-Column) [NOT READY]', value: '05' },
        { label: '06 - Brief (Card)', value: '06' },
        { label: '07 - Brief (Centered)', value: '07' },
        { label: '08 - 3 Images with Text, with CTA', value: '08' },
      ],
      required: true,
    },
    {
      name: 'blockImage',
      type: 'upload',
      relationTo: 'media',
      localized: true,
      label: 'Image',
      admin: {
        condition: (_, siblingData, { blockData }) => ['04', '06', '07'].includes(blockData?.type),
      },
      // localized: true,
    },
    {
      type: 'collapsible',
      label: 'Call to Action',
      fields: [
        {
          name: 'CTALabel',
          type: 'text',
          label: 'CTA Text',
          localized: true,
          admin: {
            description: 'Extra text to display alongside the link',
          },
        },
        link({
          variants: false,
          colors: false,
        }),
      ],
      admin: {
        condition: (_, siblingData, { blockData }) => ['08'].includes(blockData?.type),
      },
    },
    {
      label: 'Featured stat',
      type: 'collapsible',
      fields: [
        {
          name: 'stat',
          type: 'group',
          fields: [
            {
              type: 'row',
              fields: [
                {
                  name: 'label',
                  type: 'text',
                  // required: true,
                  admin: {
                    width: '50%',
                    description: 'Label for the stat',
                  },
                  localized: true,
                },
                {
                  name: 'value',
                  type: 'text',
                  localized: true,
                  // required: true,
                  admin: {
                    width: '50%',
                    description: 'Value for the stat. Example: 85% or 250 SAR',
                  },
                },
              ],
            },
            {
              type: 'select',
              label: 'Indicator',
              name: 'indicator',
              options: [
                { label: 'Increase', value: 'increase' },
                { label: 'Decrease', value: 'decrease' },
                { label: 'None', value: 'noChange' },
              ],
              defaultValue: 'noChange',
              admin: {
                description: 'Whether the value is an increase or decrease',
              },
            },
          ],
        },
      ],
      admin: {
        condition: (_, siblingData, { blockData }) => ['06'].includes(blockData?.type),
      },
    },
    {
      name: 'columns',
      type: 'array',
      label: 'Feature Columns',
      fields: [
        {
          name: 'size',
          type: 'select',
          defaultValue: 'half',
          options: sizeOptions,
          admin: {
            condition: (_, siblingData, { blockData }) => {
              return ['01', '02', '05'].includes(blockData?.type)
            },
          },
        },

        {
          name: 'image',
          type: 'upload',
          relationTo: 'media',
          label: 'Image',
          localized: true,
          admin: {
            condition: (_, siblingData, { blockData }) =>
              ['01', '02', '04', '05', '08'].includes(blockData?.type),
          },
        },

        iconPickerField({
          name: 'icon',
          label: 'Icon',
          icons: remixIcons,
          admin: {
            condition: (_, siblingData, { blockData }) =>
              ['03', '06', '07'].includes(blockData?.type),
            description:
              'Select an icon from the Remix icon library. You can preview all available icons at https://remixicon.com/',
          },
        }),
        textGroup({
          admin: {
            condition: (_, siblingData, { blockData }) =>
              !['01', '04', '05'].includes(blockData?.type),
          },
        }),
        {
          name: 'richTextContent',
          label: 'Content',
          type: 'richText',
          editor: richTextEditor,
          admin: {
            condition: (_, siblingData, { blockData }) =>
              ['01', '04', '05'].includes(blockData?.type),
          },
          localized: true,
        },
        {
          label: 'Featured stat',
          type: 'collapsible',
          fields: [
            {
              name: 'stat',
              type: 'group',
              fields: [
                {
                  type: 'row',
                  fields: [
                    {
                      name: 'label',
                      type: 'text',
                      // required: true,
                      admin: {
                        width: '50%',
                        description: 'Label for the stat',
                      },
                      localized: true,
                    },
                    {
                      name: 'value',
                      type: 'text',
                      localized: true,

                      // required: true,
                      admin: {
                        width: '50%',
                        description: 'Value for the stat. Example: 85% or 250 SAR',
                      },
                    },
                  ],
                },
                {
                  type: 'select',
                  label: 'Indicator',
                  name: 'indicator',
                  options: [
                    { label: 'Increase', value: 'increase' },
                    { label: 'Decrease', value: 'decrease' },
                    { label: 'None', value: 'noChange' },
                  ],
                  defaultValue: 'noChange',
                  admin: {
                    description: 'Whether the value is an increase or decrease',
                  },
                },
              ],
            },
          ],
          admin: {
            condition: (_, siblingData, { blockData }) => ['01'].includes(blockData?.type),
          },
        },
        {
          type: 'row',
          fields: [
            {
              name: 'enableBadge',
              label: 'Enable Badge',
              type: 'checkbox',
              admin: {
                condition: (_, siblingData, { blockData }) =>
                  ['01', '02', '04', '05'].includes(blockData?.type),
                width: '50%',
              },
            },
            {
              name: 'enableCta',
              label: 'Enable Link',
              type: 'checkbox',
              admin: {
                condition: (_, siblingData, { blockData }) =>
                  ['02', '04', '05'].includes(blockData?.type),
                width: '50%',
              },
            },
            {
              name: 'reverseOrder',
              label: 'Reverse Order',
              type: 'checkbox',
              admin: {
                condition: (_, siblingData, { blockData }) => ['04'].includes(blockData?.type),
              },
            },
          ],
        },
        badge({
          overrides: {
            admin: {
              condition: (_: Partial<any>, siblingData: Partial<any>) =>
                Boolean(siblingData?.enableBadge),
            },
          },
        }),
        {
          type: 'collapsible',
          label: 'Link',
          fields: [
            link({
              variants: false,
              colors: false,
            }),
          ],
          admin: {
            condition: (_, siblingData, { blockData }) => Boolean(siblingData?.enableCta),
          },
        },
      ],
    },

    {
      type: 'group',
      label: 'Block Content',
      fields: [],
    },
  ],
}
