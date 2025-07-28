import type { Block } from 'payload'

import {
  FixedToolbarFeature,
  HeadingFeature,
  InlineToolbarFeature,
  lexicalEditor,
} from '@payloadcms/richtext-lexical'

import { iconPickerField } from '@/fields/iconPickerField'
import remixIcons from '@/fields/iconPickerField/remix-icons.json'

import { badge } from '@/fields/badge'
import { linkGroup } from '@/fields/linkGroup'
import { mediaGroup } from '@/fields/media'

export const CallToActionBlock: Block = {
  slug: 'callToActionBlock',
  interfaceName: 'CallToActionBlock',
  dbName: 'callToActionBlock',
  labels: {
    singular: 'Call to Action',
    plural: 'Calls to Action',
  },
  fields: [
    {
      name: 'type',
      type: 'select',
      defaultValue: '01',
      options: [
        { label: '01 - Card (Split) [NOT READY]', value: '01' },
        { label: '02 - Card (Centered) [NOT READY]', value: '02' },
        { label: '03 - Brief (Centered) [NOT READY]', value: '03' },
        { label: '04 - Banner [NOT READY]', value: '04' },
        { label: '05 - Brief (Inverted Colors) [NOT READY]', value: '05' },
        { label: '06 - Form (Centered) [NOT READY]', value: '06' },
        { label: '07 - Form (Card - Split) [NOT READY]', value: '07' },
      ],
      required: true,
    },
    badge({}),
    {
      name: 'richText',
      type: 'richText',
      localized: true,
      editor: lexicalEditor({
        features: ({ rootFeatures }) => {
          return [
            ...rootFeatures,
            HeadingFeature({ enabledHeadingSizes: ['h1', 'h2', 'h3', 'h4'] }),
            FixedToolbarFeature(),
            InlineToolbarFeature(),
          ]
        },
      }),
      label: false,
    },
    {
      type: 'collapsible',
      label: 'Media',
      admin: {
        initCollapsed: true,
      },
      fields: [
        {
          name: 'media',
          type: 'group',
          label: false,
          admin: {
            hideGutter: true,
          },
          fields: [
            mediaGroup({
              mediaOverrides: {
                localized: true,
                relationTo: 'media',
                required: false,
              },
              overrides: {
                admin: {
                  hideGutter: true,
                },
                name: 'desktop',
                label: 'Default (Desktop)',
              },
            }),
            mediaGroup({
              mediaOverrides: {
                localized: true,
                relationTo: 'media',
                required: false,
              },
              overrides: {
                admin: {
                  hideGutter: true,
                  description: 'Optional',
                },
                name: 'mobile',
                label: 'Mobile (Optional)',
              },
            }),
          ],
        },
      ],
    },
    linkGroup({
      overrides: {
        maxRows: 2,
      },
      caption: true,
    }),

    {
      name: 'list',
      type: 'array',
      fields: [
        iconPickerField({
          name: 'icon',
          label: 'Icon',
          icons: remixIcons,
          admin: {
            description:
              'Select an icon from the Remix icon library. You can preview all available icons at https://remixicon.com/',
          },
        }),
        {
          name: 'title',
          label: 'Title',
          type: 'text',
        },
        {
          name: 'subtitle',
          label: 'Subtitle',
          type: 'textarea',
        },
      ],
      localized: true,
      admin: {
        condition: (_, { type }) => ['02'].includes(type),
      },
    },
    // {
    //   name: 'enableForm',
    //   type: 'checkbox',
    //   label: 'Include Form',
    //   defaultValue: false,
    // },
    {
      name: 'form',
      type: 'relationship',
      relationTo: 'forms',
      required: false,
      admin: {
        condition: (_, { type }) => ['06', '07'].includes(type),
      },
    },
  ],
}
