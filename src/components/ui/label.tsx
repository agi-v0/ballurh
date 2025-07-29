'use client'

import { cn } from '@/utilities/ui'
import { Label as LabelPrimitive } from 'radix-ui'
import { type VariantProps, cva } from 'class-variance-authority'
import * as React from 'react'

const labelVariants = cva(
  'inline-block text-sm leading-none font-medium peer-disabled:cursor-not-allowed peer-disabled:opacity-70',
)

const Label: React.FC<
  { ref?: React.Ref<HTMLLabelElement> } & React.ComponentProps<typeof LabelPrimitive.Root> &
    VariantProps<typeof labelVariants>
> = ({ className, ref, ...props }) => (
  <LabelPrimitive.Root className={cn(labelVariants(), className)} ref={ref} {...props} />
)

export { Label }
