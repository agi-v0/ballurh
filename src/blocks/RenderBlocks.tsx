import { Fragment } from 'react'

import { Page } from '@/payload-types'
import { ArchiveBlock } from '@/blocks/ArchiveBlock/Component'
import { FormBlock } from '@/blocks/Form/Component'
import { MediaBlock } from '@/blocks/MediaBlock/Component'
import { RenderFeaturesBlock } from '@/blocks/Features/RenderFeaturesBlock'
import { BlockHeader } from '@/components/BlockHeader'
import { BlockHeaderType } from '@/components/BlockHeader/types'
// import { RenderFeaturedAppsBlock } from './FeaturedApps/RenderFeaturedAppsBlock'
import { RenderBlogBlock } from './Blog/RenderBlogBlock'
import { RenderFAQBlock } from './FAQ/RenderFAQBlock'
import { RenderGalleryBlock } from './Gallery/RenderGalleryBlock'
import { RenderCallToActionBlock } from './CallToAction/RenderCallToActionBlock'
import { RenderCustomHtmlBlock } from './CustomHTML/RenderCustomHtmlBlock'
import { RenderDividerBlock } from './Divider/RenderDividerBlock'
import { RenderLogoBlock } from './Logos/RenderLogoBlock'
import { RenderRichTextBlock } from './RichText/RenderRichTextBlock'
import { RenderMetricsBlock } from './Metrics/RenderMetricsBlock'
// import { RenderPricingBlock } from './Pricing/RenderPricingBlock'
import { RenderTeamBlock } from './Team/RenderTeamBlock'
import { RenderTestimonialsBlock } from './Testimonials/RenderTestimonialsBlock'
// import { SearchableIntegrationsGrid } from '@/blocks/Marketplace/SearchableGrid'
import { cn } from '@/utilities/ui'

const blockComponents = {
  archiveBlock: ArchiveBlock,
  blogBlock: RenderBlogBlock,
  callToActionBlock: RenderCallToActionBlock,
  customHtmlBlock: RenderCustomHtmlBlock,
  dividerBlock: RenderDividerBlock,
  faqBlock: RenderFAQBlock,
  featuresBlock: RenderFeaturesBlock,
  formBlock: FormBlock,
  galleryBlock: RenderGalleryBlock,
  logosBlock: RenderLogoBlock,
  mediaBlock: MediaBlock,
  metricsBlock: RenderMetricsBlock,
  richTextBlock: RenderRichTextBlock,
  teamBlock: RenderTeamBlock,
  testimonialsBlock: RenderTestimonialsBlock,
  // featuredAppsBlock: RenderFeaturedAppsBlock,
  // marketplaceBlock: SearchableIntegrationsGrid,
  // pricingBlock: RenderPricingBlock,
}

type BlockWithHeader = {
  blockHeader?: BlockHeaderType
} & Page['layout'][0]

export const RenderBlocks: React.FC<{
  locale: string
  blocks: BlockWithHeader[]
}> = (props) => {
  const { blocks, locale } = props

  if (!blocks || !Array.isArray(blocks) || blocks.length === 0) {
    return null
  }
  return (
    <Fragment>
      {blocks.map((block, index) => {
        const { blockType, blockHeader } = block
        const Block = blockComponents[blockType as keyof typeof blockComponents]

        if (!Block) {
          return null
        }
        // console.log(blockType, block.type)

        return (
          <div
            id={block.blockName || undefined}
            className={
              cn()
              // 'pt-[clamp(4rem,2.4rem+4vw,6rem)]',
              // block.blockType === 'pricingBlock' && block.type === '01' && 'pt-0',
              // block.blockType === 'marketplaceBlock' && 'pt-0',
            }
            key={index}
          >
            {blockHeader &&
              !(block?.blockType === 'featuresBlock' && ['06', '07', '17'].includes(block.type)) &&
              !(block.blockType === 'logosBlock' && block.type === '03') &&
              !(block.blockType === 'metricsBlock' && block.type === '02') &&
              !(block.blockType === 'faqBlock' && block.type === '02') && (
                <BlockHeader {...blockHeader} />
              )}
            <Block {...(block as any)} locale={locale} />
          </div>
        )
      })}
    </Fragment>
  )
}
