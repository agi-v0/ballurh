'use client'

import * as React from 'react'
import * as RadioGroupPrimitive from '@radix-ui/react-radio-group'
import { cva, type VariantProps } from 'class-variance-authority'

import { cn } from '@/utilities/ui'
import { Icon } from '@iconify-icon/react/dist/iconify.mjs'

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
  'relative grid cursor-pointer grid-cols-[repeat(auto-fit,minmax(160px,1fr))] items-center justify-between rounded-lg border p-4 transition-colors select-none hover:bg-accent hover:text-accent-foreground focus:outline-none focus-visible:border-ring focus-visible:ring-[3px] focus-visible:ring-ring/30 focus-visible:outline-none disabled:cursor-not-allowed disabled:opacity-50 data-[state=checked]:border-primary data-[state=checked]:bg-primary/5',
  {
    variants: {
      size: {
        '1': 'gap-2 p-2 text-sm',
        '2': 'gap-4 p-4',
        '3': 'gap-6 p-6 text-lg',
      },
      variant: {
        surface: 'border-border bg-card',
        classic: 'bg-background',
      },
    },
    defaultVariants: {
      size: '2',
      variant: 'surface',
    },
  },
)

type RGRootBaseProps = React.ComponentProps<typeof RadioGroupPrimitive.Root>
interface RadioCardsRootProps
  extends Omit<RGRootBaseProps, 'asChild' | 'color' | 'defaultChecked'>,
    VariantProps<typeof radioCardsRootVariants> {
  asChild?: boolean
  color?: string
}

type RGItemBaseProps = React.ComponentProps<typeof RadioGroupPrimitive.Item>
interface RadioCardsItemProps
  extends Omit<RGItemBaseProps, 'asChild'>,
    VariantProps<typeof radioCardsItemVariants> {
  asChild?: boolean
}

interface RadioCardsIndicatorProps
  extends Omit<React.ComponentProps<typeof RadioGroupPrimitive.Indicator>, 'asChild'> {
  /**
   * Where to place the indicator inside the card.
   */
  placement?: 'top-right' | 'top-left'
  /**
   * If you want the indicator to stay mounted for transitions.
   * Defaults to false (mounts only when checked).
   */
  forceMount?: true
}

function RadioCardsRoot({
  className,
  size,
  variant,
  highContrast,
  style,
  ...props
}: RadioCardsRootProps) {
  return (
    <RadioGroupPrimitive.Root
      data-slot="radio-group"
      className={cn(radioCardsRootVariants({ size, variant, highContrast }), className)}
      style={{
        ...style,
      }}
      {...props}
    />
  )
}
RadioCardsRoot.displayName = 'RadioCards.Root'

function RadioCardsItem({ className, size, variant, children, ...props }: RadioCardsItemProps) {
  return (
    <RadioGroupPrimitive.Item
      data-slot="radio-group-item"
      className={cn(radioCardsItemVariants({ size, variant }), className)}
      {...props}
    >
      {children}
    </RadioGroupPrimitive.Item>
  )
}
RadioCardsItem.displayName = 'RadioCards.Item'

function RadioCardsIndicator({
  placement = 'top-right',
  className,
  forceMount,
  children,
  ...props
}: RadioCardsIndicatorProps) {
  const pos = placement === 'top-right' ? 'top-2 end-2' : 'top-2 start-2'

  return (
    <RadioGroupPrimitive.Indicator asChild {...props}>
      {/* This <span> only exists when the parent Item is checked */}
      <span
        aria-hidden
        className={cn(
          'pointer-events-none absolute inline-grid place-items-center rounded-full text-primary animate-in fade-in [&>iconify-icon]:size-5',
          pos,
          className,
        )}
      >
        {/* Inner dot (customize as you like, or pass your own children) */}
        {children ?? <Icon icon="ri:checkbox-circle-fill" height="none" />}
      </span>
    </RadioGroupPrimitive.Indicator>
  )
}

export { RadioCardsRoot, RadioCardsItem, RadioCardsIndicator }
export type { RadioCardsRootProps, RadioCardsItemProps, RadioCardsIndicatorProps }
