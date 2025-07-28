import type { RequiredDataFromCollectionSlug } from 'payload'
import type { Media } from '@/payload-types'

type PricingArgs = {
  heroImage: Media | null
  metaImage: Media | null
  image169: Media | null
  image43: Media | null
  imageSquare: Media | null
}

export const pricing: (args: PricingArgs) => RequiredDataFromCollectionSlug<'pages'> = ({
  heroImage,
  metaImage,
  image169,
  image43,
  imageSquare,
}) => {
  return {
    title: 'Home',
    hero: {
      type: 'hero01',
      richText: {
        root: {
          type: 'root',
          format: '',
          indent: 0,
          version: 1,

          children: [
            {
              tag: 'h1',
              type: 'heading',
              format: '',
              indent: 0,
              version: 1,

              children: [
                {
                  mode: 'normal',
                  text: 'زهقت من فوضى الطلبات؟',
                  type: 'text',
                  style: '',
                  detail: 0,
                  format: 0,
                  version: 1,
                },
              ],
              direction: 'rtl',
            },

            {
              type: 'paragraph',
              format: '',
              indent: 0,
              version: 1,

              children: [
                {
                  mode: 'normal',
                  text: 'نظام كاشير حديث يرتب عملك بسهولة وبسعر يناسبك—مصمم للمطاعم ومحلات التجزئة في السعودية',
                  type: 'text',
                  style: '',
                  detail: 0,
                  format: 0,
                  version: 1,
                },
              ],
              direction: 'rtl',
              textStyle: '',
              textFormat: 0,
            },
          ],
          direction: 'rtl',
        },
      },
      links: [
        {
          link: {
            type: 'custom',
            newTab: null,
            url: 'google.com',
            label: 'تواصل معنا',
            color: 'brand',
            variant: 'primary',
          },
        },
      ],
      caption: null,
      headline: null,
      logos: {
        headline: null,
        logos: [],
      },
      media: {
        desktop: {
          light: image169?.id,
          dark: image169?.id,
        },
        mobile: {
          light: null,
          dark: null,
        },
      },
      badge: {
        label: null,
        color: 'blue',
        icon: null,
        icon_position: null,
      },
    },
    layout: [
      {
        type: '01',
        blockName: null,

        pricingCards: [
          {
            type: 'basic',
            icon: null,

            features: [
              {
                enabled: true,
                feature: 'سعر اشتراك لفرع واحد',
              },

              {
                enabled: true,
                feature: 'يتضمن جهاز واحد، 1000 رس/سنة او 90 رس/شهر لكل جهاز إضافي',
              },

              {
                enabled: true,
                feature: 'دعم فني في تجهيز وتهيئة النظام',
              },

              {
                enabled: false,
                feature: 'دعم فني في تجهيز وتهيئة النظام',
              },
            ],

            badge: {
              type: null,
              label: null,
              color: 'blue',
              icon: null,
              icon_position: 'flex-row',
            },
            title: 'كاشير مرن ',
            subtitle: 'نقطة بيع سريعة، تقارير واضحة، وإدارة سهلة.',

            price: {
              annually: '٢٠٠٠',
              monthly: '١٦٦.٦٧',
            },

            link: {
              type: 'reference',
              newTab: null,

              reference: {
                relationTo: 'pages',
                value: 'contact',
              },
              url: null,
              label: 'تواصل معنا',
              color: 'neutral',
              variant: 'primary',
            },

            featuredSolutions: [],

            featuredIntegrations: [],
          },

          {
            type: 'featured',
            icon: null,

            features: [
              {
                enabled: true,
                feature: 'سعر اشتراك لفرع واحد',
              },

              {
                enabled: true,
                feature: 'يتضمن جهاز واحد، 1000 رس/سنة او 90 رس/شهر لكل جهاز إضافي',
              },

              {
                enabled: true,
                feature: 'دعم فني في تجهيز وتهيئة النظام',
              },

              {
                enabled: true,
                feature: 'دعم فني في تجهيز وتهيئة النظام',
              },
            ],

            badge: {
              type: null,
              label: null,
              color: 'blue',
              icon: null,
              icon_position: 'flex-row',
            },
            title: 'مرن كونكت',
            subtitle: 'نظام كاشير + مجمّع طلبات توصيل . كل شيء في اشتراك واحد.',

            price: {
              annually: '٢٠٠٠',
              monthly: '٢٠٠',
            },

            link: {
              type: 'reference',
              newTab: null,

              reference: {
                relationTo: 'pages',
                value: 'contact',
              },
              url: null,
              label: 'تواصل معنا',
              color: 'neutral',
              variant: 'primary',
            },

            featuredSolutions: [],

            featuredIntegrations: [],
          },
        ],
        blockType: 'pricingBlock',

        blockHeader: {
          type: 'center',
        },
      },
    ],

    meta: {
      title: null,
      image: image169?.id,
      description: null,
    },
    slug: 'pricing',
    _status: 'published',
  }
}
