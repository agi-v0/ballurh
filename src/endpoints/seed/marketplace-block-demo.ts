import type { Page, MarketplaceBlock, Media } from '@/payload-types'
import { generateLexicalContent } from '@/utilities/generateLexicalContent'

export const seedMarketplaceBlockDemo = ({
  image169,
  filterCategory,
}: {
  image169: Media | null
  filterCategory: string | null
}) => {
  const marketplaceBlocks: MarketplaceBlock[] = [
    // Instance 1: Default view, sorted by newest
    {
      blockType: 'marketplaceBlock',
      initialFilters: {
        sort: 'newest',
      },
    },
    // Instance 2: Pre-filtered to a specific category
    {
      blockType: 'marketplaceBlock',
      initialFilters: {
        category: filterCategory,
        sort: 'name',
      },
    },
  ]

  const heroData: Page['hero'] = {
    type: 'mediumImpact',
    richText: generateLexicalContent([
      { type: 'h1', text: 'عرض توضيحي لبلوك المتجر', direction: 'rtl' },
      {
        type: 'p',
        text: 'استكشف الشبكة القابلة للبحث والتصفية لتكاملات مارن.',
        direction: 'rtl',
      },
    ]),
    media: {
      desktop: { light: image169?.id, dark: image169?.id },
      mobile: { light: null, dark: null },
    },
    links: [
      {
        link: {
          type: 'custom',
          url: '/blocks-demo',
          label: 'العودة لعرض البلوكات',
          newTab: false,
        } as any,
      },
    ],
  }

  const richTextBlock = {
    blockType: 'richTextBlock',
    type: '01',
    columns: 2,
    maxWidth: 'default',
    blockHeader: {
      type: 'center',
      headerText: generateLexicalContent([
        { type: 'h2', text: 'عرض مُصفى مسبقًا', direction: 'rtl' },
      ]),
    },
    content: generateLexicalContent([
      { type: 'h2', text: 'عرض مُصفى مسبقًا', direction: 'rtl' },
      {
        type: 'p',
        text: 'هذا مثال على بلوك المتجر مع تطبيق مرشح "بوابات الدفع" مسبقًا.',
        direction: 'rtl',
      },
    ]),
  }

  const pageData: Omit<Page, 'id' | 'updatedAt' | 'createdAt' | 'sizes'> = {
    title: 'Marketplace Block Demo',
    slug: 'blocks-demo/marketplace-block',
    hero: heroData,
    layout: [marketplaceBlocks[0], richTextBlock, marketplaceBlocks[1]] as any,
    meta: {
      title: 'Marketplace Block Demo | Marn',
      description: 'عرض توضيحي لخيارات بلوك المتجر.',
    },
    _status: 'published',
  }

  return pageData as Page
}
