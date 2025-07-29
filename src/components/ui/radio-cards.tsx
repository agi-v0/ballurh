'use client'

import * as React from 'react'
import * as RadioGroupPrimitive from '@radix-ui/react-radio-group'
import { cva, type VariantProps } from 'class-variance-authority'

import { cn } from '@/utilities/ui'

const radioCardsRootVariants = cva('grid w-full', {
  variants: {
    size: {
      '1': 'gap-2',
      '2': 'gap-4',
      '3': 'gap-6',
    },
    variant: {
      surface: '',
      classic: 'rounded-lg border bg-card p-4',
    },
    highContrast: {
      true: 'contrast-more',
      false: '',
    },
  },
  defaultVariants: {
    size: '2',
    variant: 'surface',
    highContrast: false,
  },
})

const radioCardsItemVariants = cva(
  'relative grid cursor-pointer grid-cols-[repeat(auto-fit,minmax(160px,1fr))] items-center justify-between rounded-lg border p-4 transition-colors select-none hover:bg-accent hover:text-accent-foreground focus:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50 data-[state=checked]:border-primary data-[state=checked]:bg-primary/5',
  {
    variants: {
      size: {
        '1': 'gap-2 p-2 text-sm',
        '2': 'gap-4 p-4',
        '3': 'gap-6 p-6 text-lg',
      },
      variant: {
        surface: 'border-border bg-card',
        classic: 'border-2 bg-background',
      },
    },
    defaultVariants: {
      size: '2',
      variant: 'surface',
    },
  },
)

interface RadioCardsRootProps
  extends Omit<
      React.ComponentPropsWithoutRef<typeof RadioGroupPrimitive.Root>,
      'asChild' | 'color' | 'defaultChecked'
    >,
    VariantProps<typeof radioCardsRootVariants> {
  asChild?: boolean
  color?: string
  // removed columns prop
  gap?: React.CSSProperties['gap']
}

interface RadioCardsItemProps
  extends Omit<React.ComponentPropsWithoutRef<typeof RadioGroupPrimitive.Item>, 'asChild'>,
    VariantProps<typeof radioCardsItemVariants> {
  asChild?: boolean
}

const RadioCardsRoot = React.forwardRef<
  React.ElementRef<typeof RadioGroupPrimitive.Root>,
  RadioCardsRootProps
>(({ className, size, variant, highContrast, gap, style, ...props }, ref) => {
  return (
    <RadioGroupPrimitive.Root
      data-slot="radio-group"
      className={cn(radioCardsRootVariants({ size, variant, highContrast }), className)}
      style={{
        ...style,
      }}
      {...props}
      ref={ref}
    />
  )
})
RadioCardsRoot.displayName = 'RadioCards.Root'

const RadioCardsItem = React.forwardRef<
  React.ElementRef<typeof RadioGroupPrimitive.Item>,
  RadioCardsItemProps
>(({ className, size, variant, children, ...props }, ref) => {
  return (
    <RadioGroupPrimitive.Item
      ref={ref}
      data-slot="radio-group-item"
      className={cn(radioCardsItemVariants({ size, variant }), className)}
      {...props}
    >
      {children}
    </RadioGroupPrimitive.Item>
  )
})
RadioCardsItem.displayName = 'RadioCards.Item'

export { RadioCardsRoot, RadioCardsItem }
export type { RadioCardsRootProps, RadioCardsItemProps }
