import type { Field } from 'payload'

import {
  FixedToolbarFeature,
  HeadingFeature,
  InlineToolbarFeature,
  lexicalEditor,
} from '@payloadcms/richtext-lexical'

import { linkGroup } from '@/fields/linkGroup'
import { badge } from '@/fields/badge'
import { mediaGroup } from '@/fields/media'
import { logos } from '@/fields/logos'

export const hero: Field = {
  name: 'hero',
  type: 'group',
  label: false,
  fields: [
    {
      name: 'type',
      type: 'select',
      defaultValue: 'lowImpact',
      label: 'Type',
      options: [
        {
          label: 'None',
          value: 'none',
        },
        {
          label: 'High Impact',
          value: 'highImpact',
        },
        {
          label: 'Medium Impact',
          value: 'mediumImpact',
        },
        {
          label: 'Low Impact',
          value: 'lowImpact',
        },
      ],
      required: true,
    },
    badge({}),
    {
      name: 'richText',
      type: 'richText',
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
      localized: true,
    },
    linkGroup({
      overrides: {
        maxRows: 2,
      },
      caption: true,
    }),
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
                // name: 'm',
              },
              overrides: {
                admin: {
                  hideGutter: true,
                },
                name: 'desktop',
                // label: 'Default (Desktop)',
                // dbName: 'd',
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
    {
      type: 'collapsible',
      label: 'Logos',
      admin: {
        initCollapsed: true,
      },
      fields: [
        {
          name: 'logos',
          label: false,
          type: 'group',
          admin: {
            hideGutter: true,
          },
          fields: [
            {
              name: 'headline',
              type: 'text',
              label: 'Headline',
              required: false,
              localized: true,
              admin: {
                placeholder: 'e.g., As Featured In, Our Partners',
              },
            },
            logos({}),
          ],
        },
      ],
    },
  ],
}
