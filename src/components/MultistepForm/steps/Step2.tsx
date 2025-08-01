import React from 'react'
import { Controller, useFormContext } from 'react-hook-form'
import { Input } from '@/components/ui/input'
import { Label } from '@/components/ui/label'
import { Slider } from '@/components/ui/slider'
import { Link } from '@/i18n/navigation'

const Step2 = () => {
  const {
    control,
    formState: { errors },
  } = useFormContext()

  return (
    <div className="space-y-6">
      <div className="space-y-2.5">
        <Label htmlFor="deliverySalesPercentage">
          ما النسبة التقديرية لمبيعاتك اللي تجي من تطبيقات التوصيل؟
        </Label>
        <Controller
          name="deliverySalesPercentage"
          control={control}
          render={({ field }) => (
            <div className="relative">
              <Input
                variant="lg"
                className="rounded-xl"
                id="deliverySalesPercentage"
                type="number"
                placeholder="أدخل النسبة"
                {...field}
              />
              <span className="absolute end-3 top-2.5 text-slate-500">%</span>
            </div>
          )}
        />
        {errors.deliverySalesPercentage && (
          <p className="mt-1 animate-shake-enter text-xs text-orange-600/80">
            {errors.deliverySalesPercentage.message as string}
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
        <p className="text-sm text-slate-500">
          (تشمل عمولة التطبيق + الدفع الإلكتروني + التسويق)
        </p>
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
                  placeholder="20-35%"
                  value={field.value}
                  onChange={field.onChange}
                />
                <span className="absolute end-3 top-2.5 text-slate-500">%</span>
              </div>
              <Slider
                value={[parseInt(field.value, 10)]}
                onValueChange={(value) => field.onChange(String(value[0]))}
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
            className="text-slate-400 transition-colors hover:text-slate-600"
          >
            نساعدك نطلّع الرقم بدقة.
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
