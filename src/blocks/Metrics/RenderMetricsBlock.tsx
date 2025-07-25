import React from 'react'
import { MetricsBlock } from '@/payload-types'

import { Metrics01 } from './Metrics01'
import { Metrics02 } from './Metrics02'
import { Metrics03 } from './Metrics03'

type MetricsBlockWithLocale = MetricsBlock & {
  locale?: string
}

const variants: Record<string, React.FC<MetricsBlockWithLocale>> = {
  '01': Metrics01 as React.FC<MetricsBlockWithLocale>,
  '02': Metrics02 as React.FC<MetricsBlockWithLocale>,
  '03': Metrics03 as React.FC<MetricsBlockWithLocale>,
}

export const RenderMetricsBlock: React.FC<MetricsBlockWithLocale> = (props) => {
  const { type = '01' } = props

  const MetricsBlockComponent = variants[type]

  if (!MetricsBlockComponent) {
    console.warn(`Variant "${type}" not found for MetricsBlock. Rendering default (01).`)
    const DefaultVariant = variants['01']
    return <DefaultVariant {...props} />
  }

  return <MetricsBlockComponent {...props} />
}
