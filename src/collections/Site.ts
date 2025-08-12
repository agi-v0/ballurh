import { GlobalConfig } from 'payload'
import {
  MetaDescriptionField,
  MetaImageField,
  MetaTitleField,
  OverviewField,
  PreviewField,
} from '@payloadcms/plugin-seo/fields'
import { link } from '@/fields/link'

const SiteConfig: GlobalConfig = {
  slug: 'settings',
  label: 'Settings',
  fields: [
    {
      type: 'tabs',
      tabs: [
        {
          label: 'SEO & Metadata',
          fields: [
            {
              name: 'meta',
              label: 'SEO',
              type: 'group',
              fields: [
                OverviewField({
                  titlePath: 'meta.title',
                  descriptionPath: 'meta.description',
                  imagePath: 'meta.image',
                }),
                MetaTitleField({
                  hasGenerateFn: true,
                }),
                MetaImageField({
                  relationTo: 'media',
                }),

                MetaDescriptionField({}),
                PreviewField({
                  // if the `generateUrl` function is configured
                  hasGenerateFn: true,

                  // field paths to match the target field for data
                  titlePath: 'meta.title',
                  descriptionPath: 'meta.description',
                }),
              ],
            },
          ],
        },
        {
          label: 'Sitewide UI',
          fields: [
            {
              name: 'announcement',
              label: 'Announcement',
              type: 'group',
              fields: [
                {
                  name: 'enableAnnouncement',
                  type: 'checkbox',
                  label: 'Show Announcement',
                  defaultValue: false,
                },
                {
                  type: 'row',
                  fields: [
                    {
                      name: 'text',
                      label: 'Text',
                      type: 'text',
                      localized: true,
                      admin: {
                        condition: (_, siblingData) => siblingData.enableAnnouncement,
                      },
                    },
                    {
                      name: 'badge',
                      label: 'Badge',
                      type: 'text',
                      localized: true,
                      admin: {
                        condition: (_, siblingData) => siblingData.enableAnnouncement,
                      },
                    },
                  ],
                },

                link({
                  colors: false,
                  variants: false,
                  icon: false,
                  description: false,
                  overrides: {
                    admin: {
                      condition: (_: Partial<any>, siblingData: { enableAnnouncement: boolean }) =>
                        siblingData.enableAnnouncement,
                    },
                  },
                }),
              ],
            },

            {
              name: 'customHeadHtml',
              label: 'Custom HTML (Head)',
              type: 'code',
              admin: {
                language: 'html',
              },
            },
            {
              name: 'customBodyHtml',
              label: 'Custom HTML (Body)',
              type: 'code',
              admin: {
                language: 'html',
              },
            },
          ],
        },
        {
          label: 'Analytics & Scripts',
          fields: [
            {
              name: 'tagManagerId',
              label: 'Google Tag Manager ID',
              type: 'text',
              admin: {
                placeholder: 'GTM-XXXXXXX',
                rtl: false,
              },
            },
            {
              name: 'analyticsScripts',
              label: 'Analytics Scripts',
              type: 'code',
              admin: {
                language: 'html',
              },
            },
          ],
        },
      ],
    },
  ],
}

export default SiteConfig
