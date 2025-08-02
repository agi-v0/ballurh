import type { RequiredDataFromCollectionSlug } from 'payload'
import type { Media } from '@/payload-types'

type HomeArgs = {
  heroImage: Media | null
  metaImage: Media | null
  image169: Media | null
  image43: Media | null
  imageSquare: Media | null
}

export const home: (args: HomeArgs) => RequiredDataFromCollectionSlug<'pages'> = ({
  heroImage,
  metaImage,
  image169,
  image43,
  imageSquare,
}) => {
  return {
    title: 'Home',
    hero: {
      type: 'highImpact',
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
          id: '6800e854462e705cdaf2a9ce',
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
      list: { items: [] },
    },

    layout: [
      {
        blockType: 'dividerBlock',
        size: 'small',
        enableDivider: true,
      },
    ],

    meta: {
      title: null,
      image: image169?.id,
      description: null,
    },
    slug: 'home',
    _status: 'published',
  }
}
