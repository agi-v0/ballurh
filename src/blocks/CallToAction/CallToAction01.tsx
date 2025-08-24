import React from 'react'

import type { CallToActionBlock } from '@/payload-types'
import type { CMSLinkType } from '@/components/Link'

import RichText from '@/components/RichText'
import { CMSLink } from '@/components/Link'
import { Media } from '@/components/MediaResponsive'

import * as motion from 'motion/react-client'
import { containerVariants } from '@/utilities/motion'
import { cn } from '@/utilities/ui'

type CallToActionProps = CallToActionBlock & {
  className?: string
}

export const CallToAction01: React.FC<CallToActionProps> = ({
  badge,
  richText,
  links,
  caption,
  list,
  media,
  className,
}) => {
  const { desktop, mobile } = media || {}

  return (
    <div className={cn('container py-section-large', className)}>
      <motion.div
        variants={containerVariants}
        initial="hidden"
        whileInView="visible"
        viewport={{ once: true, amount: 0.3 }}
        className="flex flex-col items-center gap-4 overflow-hidden rounded-3xl bg-background-neutral lg:flex-row"
      >
        <div className="flex w-full flex-col gap-6 p-space-7">
          {richText && <RichText className="px-0" data={richText} enableGutter={false} />}
          <div className="flex flex-col gap-1 md:flex-row">
            {(links || []).map(({ link }, i) => {
              return <CMSLink key={i} size="lg" className="w-fit" {...link} />
            })}
          </div>
        </div>
        {media && <Media media={media} className="w-full overflow-hidden" />}
      </motion.div>
    </div>
  )
}
