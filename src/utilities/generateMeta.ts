import type { Metadata } from 'next'

import type { Media, Page, BlogPost, Config } from '../payload-types'

import { mergeOpenGraph } from './mergeOpenGraph'
import { getServerSideURL } from './getURL'

const getImageURL = (image?: Media | Config['db']['defaultIDType'] | null) => {
  const serverUrl = getServerSideURL()

  // let url = serverUrl + '/website-template-OG.webp'
  let url = serverUrl

  if (image && typeof image === 'object' && 'url' in image) {
    const ogUrl = image.sizes?.og?.url

    url = ogUrl ? serverUrl + ogUrl : serverUrl + image.url
  }

  return url
}

export const generateMeta = async (args: {
  doc: Partial<Page> | Partial<BlogPost> | null
}): Promise<Metadata> => {
  const { doc } = args

  const ogImage = getImageURL(doc?.meta?.image)

  const title = doc?.meta?.title
    ? doc?.meta?.title + ' | بلورة'
    : 'بلّورة | منصة ذكاء أعمال لقطاع التجزئة والمطاعم والمقاهي'

  return {
    description:
      doc?.meta?.description ||
      '‏زد مبيعاتك، تنبأ بسلوكيات الطلب وقم بتحسين مؤشرات الأداء من خلال إتخاذ قرارات نمو تعتمد على البيانات باستخدام قوة تقنيات ذكاء الأعمال.',
    openGraph: mergeOpenGraph({
      description: doc?.meta?.description || '',
      images: ogImage
        ? [
            {
              url: ogImage,
            },
          ]
        : undefined,
      title,
      url: Array.isArray(doc?.slug) ? doc?.slug.join('/') : '/',
    }),
    title,
  }
}
