import type { Metadata } from 'next'
import { getServerSideURL } from './getURL'

const defaultOpenGraph: Metadata['openGraph'] = {
  type: 'website',
  description:
    '‏زد مبيعاتك، تنبأ بسلوكيات الطلب وقم بتحسين مؤشرات الأداء من خلال إتخاذ قرارات نمو تعتمد على البيانات باستخدام قوة تقنيات ذكاء الأعمال.',
  // images: [
  //   {
  //     url: `${getServerSideURL()}/website-template-OG.webp`,
  //   },
  // ],
  siteName: 'بلّورة',
  title: 'بلّورة | منصة ذكاء أعمال لقطاع التجزئة والمطاعم والمقاهي',
}

export const mergeOpenGraph = (og?: Metadata['openGraph']): Metadata['openGraph'] => {
  return {
    ...defaultOpenGraph,
    ...og,
    images: og?.images ? og.images : defaultOpenGraph.images,
  }
}
