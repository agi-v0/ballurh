import * as React from 'react'
import { cn } from '@/utilities/ui'
import { cva, type VariantProps } from 'class-variance-authority'

// Define input size variants
const inputVariants = cva(
  `xshadow-xs xshadow-black/5 flex w-full border border-input bg-background text-foreground transition-[color,box-shadow] file:h-full file:border-0 file:border-e file:border-solid file:border-input file:bg-transparent file:p-0 file:font-medium file:text-foreground file:not-italic placeholder:text-muted-foreground/80 focus-visible:border-ring focus-visible:ring-[3px] focus-visible:ring-ring/30 focus-visible:outline-none disabled:cursor-not-allowed disabled:opacity-60 aria-invalid:border-destructive/60 aria-invalid:ring-destructive/10 dark:aria-invalid:border-destructive dark:aria-invalid:ring-destructive/20 [&[readonly]]:cursor-not-allowed [&[readonly]]:bg-muted/80 [&[type=file]]:py-0`,
  {
    variants: {
      variant: {
        lg: 'h-12 rounded-xl px-5 text-sm file:me-5 file:pe-5',
        md: 'h-10 rounded-xl px-4 text-[0.8125rem] leading-(--text-sm--line-height) file:me-4 file:pe-4',
        sm: 'h-9 rounded-xl px-3 text-xs file:me-3 file:pe-3',
      },
    },
    defaultVariants: {
      variant: 'md',
    },
  },
)

const inputAddonVariants = cva(
  'xshadow-xs flex shrink-0 items-center justify-center border border-input bg-muted text-secondary-foreground [&_svg]:text-secondary-foreground/60',
  {
    variants: {
      variant: {
        sm: 'h-7 min-w-7 rounded-md px-2.5 text-xs [&_svg:not([class*=size-])]:size-3.5',
        md: 'h-8.5 min-w-8.5 rounded-md px-3 text-[0.8125rem] leading-(--text-sm--line-height) [&_svg:not([class*=size-])]:size-4.5',
        lg: 'h-10 min-w-10 rounded-md px-4 text-sm [&_svg:not([class*=size-])]:size-4.5',
      },
      mode: {
        default: '',
        icon: 'justify-center px-0',
      },
    },
    defaultVariants: {
      variant: 'md',
      mode: 'default',
    },
  },
)

const inputGroupVariants = cva(
  `flex items-stretch [&_[data-slot=button]+[data-slot=input]]:rounded-s-none [&_[data-slot=datefield]]:grow [&_[data-slot=datefield]+[data-slot=input-addon]]:rounded-s-none [&_[data-slot=datefield]+[data-slot=input-addon]]:border-s-0 [&_[data-slot=input-addon]+[data-slot=input]]:rounded-s-none [&_[data-slot=input-addon]:has(+[data-slot=button])]:rounded-e-none [&_[data-slot=input-addon]:has(+[data-slot=datefield])]:rounded-e-none [&_[data-slot=input-addon]:has(+[data-slot=datefield])]:border-e-0 [&_[data-slot=input-addon]:has(+[data-slot=input])]:rounded-e-none [&_[data-slot=input-addon]:has(+[data-slot=input])]:border-e-0 [&_[data-slot=input]]:grow [&_[data-slot=datefield]:has(+[data-slot=input-addon])]:[&_[data-slot=input]]:rounded-e-none [&_[data-slot=input-addon]+[data-slot=datefield]]:[&_[data-slot=input]]:rounded-s-none [&_[data-slot=input]+[data-slot=button]]:rounded-s-none [&_[data-slot=input]+[data-slot=input-addon]]:rounded-s-none [&_[data-slot=input]+[data-slot=input-addon]]:border-s-0 [&_[data-slot=input]:has(+[data-slot=button])]:rounded-e-none [&_[data-slot=input]:has(+[data-slot=input-addon])]:rounded-e-none`,
  {
    variants: {},
    defaultVariants: {},
  },
)

const inputWrapperVariants = cva(
  `flex items-center gap-1.5 has-[:focus-visible]:border-ring has-[:focus-visible]:ring-[3px] has-[:focus-visible]:ring-ring/30 has-[:focus-visible]:outline-none [&_[data-slot=datefield]]:grow [&_[data-slot=input]]:flex [&_[data-slot=input]]:h-auto [&_[data-slot=input]]:w-full [&_[data-slot=input]]:border-0 [&_[data-slot=input]]:bg-transparent [&_[data-slot=input]]:p-0 [&_[data-slot=input]]:text-foreground [&_[data-slot=input]]:shadow-none [&_[data-slot=input]]:transition-colors [&_[data-slot=input]]:outline-none [&_[data-slot=input]]:placeholder:text-muted-foreground [&_[data-slot=input]]:focus-visible:ring-0 [&_[data-slot=input]]:disabled:cursor-not-allowed [&_[data-slot=input]]:disabled:opacity-50 [&_[data-slot=input]]:data-focus-within:border-0 [&_[data-slot=input]]:data-focus-within:ring-0 [&_[data-slot=input]]:data-focus-within:ring-transparent [&_svg]:text-muted-foreground`,
  {
    variants: {
      variant: {
        sm: 'gap-1.25 [&_svg:not([class*=size-])]:size-3.5',
        md: 'gap-1.5 [&_svg:not([class*=size-])]:size-4',
        lg: 'gap-1.5 [&_svg:not([class*=size-])]:size-4',
      },
    },
    defaultVariants: {
      variant: 'md',
    },
  },
)

function Input({
  className,
  type,
  variant,
  ...props
}: React.ComponentProps<'input'> & VariantProps<typeof inputVariants>) {
  return (
    <input
      data-slot="input"
      type={type}
      className={cn(inputVariants({ variant }), className)}
      {...props}
    />
  )
}

function InputAddon({
  className,
  variant,
  mode,
  ...props
}: React.ComponentProps<'div'> & VariantProps<typeof inputAddonVariants>) {
  return (
    <div
      data-slot="input-addon"
      className={cn(inputAddonVariants({ variant, mode }), className)}
      {...props}
    />
  )
}

function InputGroup({
  className,
  ...props
}: React.ComponentProps<'div'> & VariantProps<typeof inputGroupVariants>) {
  return <div data-slot="input-group" className={cn(inputGroupVariants(), className)} {...props} />
}

function InputWrapper({
  className,
  variant,
  ...props
}: React.ComponentProps<'div'> & VariantProps<typeof inputWrapperVariants>) {
  return (
    <div
      data-slot="input-wrapper"
      className={cn(inputVariants({ variant }), inputWrapperVariants({ variant }), className)}
      {...props}
    />
  )
}

export { Input, InputAddon, InputGroup, InputWrapper, inputVariants, inputAddonVariants }
