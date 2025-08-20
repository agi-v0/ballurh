'use client'
import React from 'react'
import { Controller, useFormContext } from 'react-hook-form'
import { Input } from '@/components/ui/input'
import { Label } from '@/components/ui/label'
import { RadioCardsIndicator, RadioCardsItem, RadioCardsRoot } from '@/components/ui/radio-cards'
import Restaurant from '@/components/Graphics/restaurant'
import CloudKitchen from '@/components/Graphics/cloud-kitchen'
import HybridRestaurant from '@/components/Graphics/hybrid-restaurant'
import z from 'zod'
import { Button } from '@/components/ui/button'
import { Icon } from '@iconify-icon/react/dist/iconify.mjs'

const activityTypeOptions: {
  value: string
  label: string
  icon: (props: React.SVGProps<SVGSVGElement>) => React.ReactElement
}[] = [
  {
    value: 'restaurant',
    label: 'فرع فعلي (مطعم، مقهى، مخبز، محل حلويات… إلخ)',
    icon: (props) => <Restaurant {...props} />,
  },
  {
    value: 'cloudKitchen',
    label: 'نشاط سحابي (دارك كتشن / دارك ستور)',
    icon: (props) => <CloudKitchen {...props} />,
  },
  {
    value: 'hybridRestaurant',
    label: 'فرع فعلي يقدّم أيضاً علامات سحابية',
    icon: (props) => <HybridRestaurant {...props} />,
  },
]

const step1Schema = z.object({
  activityType: z.string({ error: 'يرجى اختيار نوع النشاط' }),
  physicalBranchesCount: z.string().min(1, 'يجب أن تكون القيمة 1 على الأقل'),
  hasCloudBrands: z.enum(['Yes', 'No'], { error: 'يرجى الاختيار' }),
  cloudBrandsCount: z.string().optional(),
})

const Step1 = () => {
  const {
    control,
    watch,
    formState: { errors },
  } = useFormContext()

  const activityType = watch('activityType')
  const hasCloudBrands = watch('hasCloudBrands')

  return (
    <div className="space-y-6">
      <Controller
        name="activityType"
        control={control}
        render={({ field }) => (
          <RadioCardsRoot
            onValueChange={field.onChange}
            value={field.value}
            className="grid-cols-1 gap-2 md:grid-cols-3"
          >
            {activityTypeOptions.map(({ value, label, icon }) => (
              <RadioCardsItem
                key={value}
                value={value}
                aria-label={label}
                className="rounded-[20px] data-[state=checked]:bg-background-neutral data-[state=checked]:shadow-xs max-md:flex max-md:flex-row"
              >
                <RadioCardsIndicator placement="top-right" className="[&>iconify-icon]:size-6" />
                <div className="p-2 max-md:max-w-[30%] md:p-6">
                  {icon({
                    className: `h-auto w-full transition-[opacity,color] ${field.value === value ? 'text-teal-500 opacity-100' : 'text-slate-950 opacity-20'}`,
                  })}
                </div>
                <p className="text-start text-base font-medium md:text-center">{label}</p>
              </RadioCardsItem>
            ))}
          </RadioCardsRoot>
        )}
      />
      {errors.activityType && (
        <p className="mt-1 animate-shake-enter text-xs text-orange-600/80">
          {errors.activityType.message as string}
        </p>
      )}

      {(activityType === 'restaurant' || activityType === 'hybridRestaurant') && (
        <div className="space-y-2.5">
          <Label htmlFor="physicalBranchesCount">كم عدد الفروع الفعلية (نقاط البيع)؟</Label>
          <Controller
            name="physicalBranchesCount"
            control={control}
            render={({ field }) => (
              <div className="relative flex items-center">
                <Button
                  type="button"
                  size="icon"
                  variant="secondary"
                  onClick={() => field.onChange(Math.max(1, (Number(field.value) || 1) - 1))}
                  className="size-12 shrink-0 rounded-s-xl rounded-e-none border border-e-0"
                >
                  <Icon icon="ri:subtract-line" height="none" className="size-5" />
                </Button>
                <Input
                  variant="lg"
                  className="rounded-none text-center"
                  id="physicalBranchesCount"
                  type="number"
                  inputMode="numeric"
                  placeholder="مثال: 3"
                  {...field}
                />
                <Button
                  type="button"
                  size="icon"
                  variant="secondary"
                  onClick={() => field.onChange((Number(field.value) || 0) + 1)}
                  className="size-12 shrink-0 rounded-s-none rounded-e-xl border border-s-0"
                >
                  <Icon icon="ri:add-line" height="none" className="size-5" />
                </Button>
              </div>
            )}
          />
          {errors.physicalBranchesCount && (
            <p className="mt-1 animate-shake-enter text-xs text-orange-600/80">
              {errors.physicalBranchesCount.message as string}
            </p>
          )}
        </div>
      )}

      {(activityType === 'hybridRestaurant' || activityType === 'cloudKitchen') && (
        <>
          <div className="space-y-2.5">
            <Label>هل لديك علامات تجارية سحابية؟</Label>
            <Controller
              name="hasCloudBrands"
              control={control}
              render={({ field }) => (
                <RadioCardsRoot
                  onValueChange={field.onChange}
                  value={field.value}
                  className="grid-cols-2 gap-2"
                >
                  {['Yes', 'No'].map((option) => (
                    <RadioCardsItem
                      key={option}
                      value={option}
                      variant="classic"
                      className="flex h-12 flex-row rounded-xl py-2 text-sm font-medium data-[state=checked]:bg-background-neutral data-[state=checked]:text-base-primary data-[state=checked]:shadow-xs"
                    >
                      {option === 'Yes' ? 'نعم' : 'لا'}
                      <RadioCardsIndicator className="end-2 top-0 bottom-0 [&>iconify-icon]:size-6" />
                    </RadioCardsItem>
                  ))}
                </RadioCardsRoot>
              )}
            />
            {errors.hasCloudBrands && (
              <p className="mt-1 animate-shake-enter text-xs text-orange-600/80">
                {errors.hasCloudBrands.message as string}
              </p>
            )}
          </div>

          {hasCloudBrands === 'Yes' && (
            <div className="space-y-2.5">
              <Label htmlFor="cloudBrandsCount">كم عدد العلامات التجارية السحابية؟</Label>
              <Controller
                name="cloudBrandsCount"
                control={control}
                render={({ field }) => (
                  <div className="relative flex items-center">
                    <Button
                      type="button"
                      size="icon"
                      variant="secondary"
                      onClick={() => field.onChange(Math.max(1, (Number(field.value) || 1) - 1))}
                      className="size-12 shrink-0 rounded-s-xl rounded-e-none border border-e-0"
                    >
                      <Icon icon="ri:subtract-line" height="none" className="size-5" />
                    </Button>
                    <Input
                      variant="lg"
                      className="grow rounded-none text-center"
                      id="cloudBrandsCount"
                      type="number"
                      inputMode="numeric"
                      placeholder="أدخل عدد العلامات"
                      {...field}
                    />
                    <Button
                      type="button"
                      size="icon"
                      variant="secondary"
                      onClick={() => field.onChange((Number(field.value) || 0) + 1)}
                      className="size-12 shrink-0 rounded-s-none rounded-e-xl border border-s-0"
                    >
                      <Icon icon="ri:add-line" height="none" className="size-5" />
                    </Button>
                  </div>
                )}
              />
              {errors.cloudBrandsCount && (
                <p className="mt-1 animate-shake-enter text-xs text-orange-600/80">
                  {errors.cloudBrandsCount.message as string}
                </p>
              )}
            </div>
          )}
        </>
      )}
    </div>
  )
}

export default Step1
