'use client'

import React, { useId } from 'react'
import { ChevronDownIcon, PhoneIcon } from 'lucide-react'
import * as RPNInput from 'react-phone-number-input'
import { CircleFlag } from 'react-circle-flags'
import { cva, type VariantProps } from 'class-variance-authority'

import { cn } from '@/utilities/ui'
import { Input } from '@/components/ui/input'

const phoneInputVariants = cva('flex flex-row-reverse rounded-xl', {
  variants: {
    variant: {
      lg: 'h-12 px-5 text-base file:me-5 file:pe-5',
      md: 'h-10 px-4 text-[0.8125rem] leading-(--text-sm--line-height) file:me-4 file:pe-4',
      sm: 'h-9 px-3 text-xs file:me-3 file:pe-3',
    },
  },
  defaultVariants: {
    variant: 'md',
  },
})

export interface PhoneInputProps
  extends Omit<React.ComponentProps<'input'>, 'onChange' | 'value' | 'size'>,
    VariantProps<typeof phoneInputVariants> {
  value?: RPNInput.Value
  onChange?: (value: RPNInput.Value | undefined) => void
  defaultCountry?: RPNInput.Country
  placeholder?: string
  international?: boolean
}

const PhoneInput = React.forwardRef<HTMLInputElement, PhoneInputProps>(
  (
    {
      className,
      variant,
      value,
      onChange,
      defaultCountry = 'SA',
      placeholder = 'Enter phone number',
      international = true,
      ...props
    },
    ref,
  ) => {
    const id = useId()

    const PhoneInputField = React.forwardRef<HTMLInputElement, React.ComponentProps<'input'>>(
      ({ className, ...props }, ref) => {
        return (
          <Input
            ref={ref}
            variant={variant}
            data-slot="phone-input"
            className={cn(
              'z-1 -ms-px rounded-s-xl rounded-e-none border-e-0 shadow-none focus-visible:z-1',
              className,
            )}
            {...props}
          />
        )
      },
    )
    PhoneInputField.displayName = 'PhoneInputField'
    return (
      <RPNInput.default
        className={cn('flex flex-row-reverse rounded-xl', className)}
        international={international}
        defaultCountry={defaultCountry}
        flagComponent={FlagComponent}
        countrySelectComponent={CountrySelect}
        inputComponent={PhoneInputField}
        id={id}
        placeholder={placeholder}
        value={value}
        onChange={onChange || (() => {})}
        {...props}
      />
    )
  },
)

PhoneInput.displayName = 'PhoneInput'

interface CountrySelectProps {
  disabled?: boolean
  value: RPNInput.Country
  onChange: (value: RPNInput.Country) => void
  options: { label: string; value: RPNInput.Country | undefined }[]
}

const CountrySelect = React.forwardRef<HTMLSelectElement, CountrySelectProps>(
  ({ disabled, value, onChange, options }, ref) => {
    const handleSelect = (event: React.ChangeEvent<HTMLSelectElement>) => {
      onChange(event.target.value as RPNInput.Country)
    }

    return (
      <div
        className={cn(
          'relative z-0 inline-flex h-12 items-center self-stretch rounded-s-none rounded-e-xl border px-3 py-2.5 ring-ring outline-hidden transition-[color,box-shadow]',
          'border-input bg-background text-base-secondary',
          'focus-visible:z-1 focus-visible:border-ring focus-visible:ring-1 focus-visible:ring-ring',
          'hover:bg-background-neutral',
          'has-aria-invalid:border-destructive/60 has-aria-invalid:ring-destructive/20 dark:has-aria-invalid:ring-destructive/40',
          'has-disabled:pointer-events-none has-disabled:opacity-50',
        )}
      >
        <div
          className="inline-flex items-center gap-2 focus-visible:outline-hidden"
          aria-hidden="true"
        >
          <FlagComponent country={value} countryName={value} aria-hidden="true" />
          <span className="flex items-center gap-1 text-base-secondary">
            <span className="font-medium">{value}</span>
            <ChevronDownIcon size={16} aria-hidden="true" />
          </span>
        </div>
        <select
          ref={ref}
          disabled={disabled}
          value={value}
          onChange={handleSelect}
          className="absolute inset-0 text-sm opacity-0"
          aria-label="Select country"
        >
          {options
            .filter((x) => {
              if (x.value && ['SA', 'AE', 'KW', 'BH', 'OM', 'QA'].includes(x.value)) return x.value
            })
            .map((option, i) => (
              <option key={option.value ?? `empty-${i}`} value={option.value}>
                {option.label} {option.value && `+${RPNInput.getCountryCallingCode(option.value)}`}
              </option>
            ))}
        </select>
      </div>
    )
  },
)

CountrySelect.displayName = 'CountrySelect'

const FlagComponent = React.forwardRef<HTMLSpanElement, RPNInput.FlagProps>(
  ({ country, countryName, ...props }, ref) => {
    return (
      <span ref={ref} className="w-5 overflow-hidden rounded-sm" {...props}>
        {country ? (
          <CircleFlag countryCode={country.toLowerCase()} height="20" title={countryName} />
        ) : (
          <PhoneIcon size={16} aria-hidden="true" />
        )}
      </span>
    )
  },
)

FlagComponent.displayName = 'FlagComponent'

export { PhoneInput, phoneInputVariants }
export default PhoneInput
