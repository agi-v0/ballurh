import React from 'react'
import { Controller, useFormContext } from 'react-hook-form'
import { Input } from '@/components/ui/input'
import { Label } from '@/components/ui/label'
import { Slider } from '@/components/ui/slider'
import { Link } from '@/i18n/navigation'
import { RadioCardsRoot, RadioCardsItem, RadioCardsIndicator } from '@/components/ui/radio-cards'
import { Icon } from '@iconify-icon/react/dist/iconify.mjs'

const annualSalesOptions = [
  { ar: 'أقل من 500,000', en: 'Less than 500,000' },
  { ar: '500,000 - 750,000', en: '500,000 - 750,000' },
  { ar: '750,000 - 1,250,000', en: '750,000 - 1,250,000' },
  { ar: '1,250,000 - 2,000,000', en: '1,250,000 - 2,000,000' },
  { ar: 'أكثر من 2,000,000', en: 'More than 2,000,000' },
]

const Step2 = () => {
  const {
    control,
    formState: { errors },
  } = useFormContext()

  return (
    <div className="space-y-6">
      <div className="space-y-2.5">
        <Label>كم إجمالي مبيعاتك الشهرية؟ (بالريال السعودي)</Label>
        <Controller
          name="monthlySales"
          control={control}
          render={({ field }) => (
            <Input
              variant="lg"
              className="rounded-xl"
              id="monthlySales"
              type="number"
              inputMode="numeric"
              placeholder="مثال: 100000 شهرياً"
              {...field}
            />
          )}
        />
        {errors.monthlySales && (
          <p className="mt-1 animate-shake-enter text-xs text-orange-600/80">
            {errors.monthlySales.message as string}
          </p>
        )}
      </div>
      <div className="space-y-2.5">
        <Label htmlFor="monthlyOrders">كم متوسط عدد الطلبات الشهري؟</Label>
        <Controller
          name="monthlyOrders"
          control={control}
          render={({ field }) => (
            <div className="relative">
              <Input
                variant="lg"
                className="rounded-xl"
                id="monthlyOrders"
                type="number"
                inputMode="numeric"
                placeholder="مثال: 850 طلب شهرياً"
                {...field}
              />
            </div>
          )}
        />
        {errors.monthlyOrders && (
          <p className="mt-1 animate-shake-enter text-xs text-orange-600/80">
            {errors.monthlyOrders.message as string}
          </p>
        )}
      </div>

      <div className="space-y-2.5">
        <Label htmlFor="avgCommissionRate">كم متوسط النسبة اللي تدفعها كتطبيقات توصيل؟</Label>
        <p className="text-sm text-slate-500">(تشمل عمولة التطبيق + الدفع الإلكتروني)</p>
        <Controller
          name="avgCommissionRate"
          control={control}
          render={({ field }) => (
            <>
              <div className="relative">
                <Input
                  variant="lg"
                  className="rounded-xl"
                  id="avgCommissionRate"
                  type="number"
                  inputMode="numeric"
                  placeholder="20-35%"
                  value={field.value}
                  onChange={field.onChange}
                />
                <span className="absolute end-3 top-2.5 text-slate-500">%</span>
              </div>
              <Slider
                value={[field.value]}
                onValueChange={(value) => field.onChange(value[0])}
                min={0}
                max={99}
                step={1}
              />
            </>
          )}
        />
        <p className="text-sm text-slate-500">
          المتوسط في السوق بين 20% و30%. مو متأكد؟{' '}
          <Link
            href="/"
            target="_blank"
            rel="noreferrer"
            className="inline-flex items-center gap-1 text-base-primary transition-colors hover:text-base-tertiary"
          >
            نساعدك نطلّع الرقم بدقة
            <Icon icon="ri:arrow-left-up-line" />
          </Link>
        </p>
        {errors.avgCommissionRate && (
          <p className="mt-1 animate-shake-enter text-xs text-orange-600/80">
            {errors.avgCommissionRate.message as string}
          </p>
        )}
      </div>
    </div>
  )
}

export default Step2
