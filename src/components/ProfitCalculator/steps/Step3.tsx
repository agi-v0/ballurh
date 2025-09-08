import React from 'react'
import { Controller, useFormContext } from 'react-hook-form'
import { Input } from '@/components/ui/input'
import { Label } from '@/components/ui/label'
import { Slider } from '@/components/ui/slider'

const Step3 = () => {
  const {
    control,
    formState: { errors },
  } = useFormContext()

  return (
    <div className="space-y-6">
      <div className="space-y-2.5">
        <Label htmlFor="foodCostPercentage">كم تُمثل تكلفة المواد (Food Cost)؟</Label>
        <Controller
          name="foodCostPercentage"
          control={control}
          render={({ field }) => (
            <>
              <div className="relative">
                <Input
                  variant="lg"
                  className="rounded-xl"
                  id="foodCostPercentage"
                  type="number"
                  inputMode="numeric"
                  placeholder="20-50%"
                  value={field.value}
                  onChange={field.onChange}
                />
                <span className="absolute end-3 top-2.5 text-slate-500">%</span>
              </div>
              <Slider
                value={[field.value]}
                onValueChange={(value) => field.onChange(value[0])}
                min={20}
                max={60}
                step={1}
              />
            </>
          )}
        />
        <p className="text-sm text-slate-500">المتوسط في السوق من 25% إلى 30%</p>
        {errors.foodCostPercentage && (
          <p className="mt-1 animate-shake-enter text-xs text-orange-600/80">
            {errors.foodCostPercentage.message as string}
          </p>
        )}
      </div>

      <div className="space-y-2.5">
        <Label htmlFor="monthlyAdBudget">
          كم ميزانيتك الإعلانية الشهرية على تطبيقات التوصيل؟ (Top List-CPC)
        </Label>
        <Controller
          name="monthlyAdBudget"
          control={control}
          render={({ field }) => (
            <div className="relative">
              <Input
                variant="lg"
                className="rounded-xl"
                id="monthlyAdBudget"
                type="number"
                inputMode="numeric"
                placeholder="مثال: 1,000"
                {...field}
              />
              <span className="absolute end-3 top-2.5 text-slate-500">ريال</span>
            </div>
          )}
        />
        {errors.monthlyAdBudget && (
          <p className="mt-1 animate-shake-enter text-xs text-orange-600/80">
            {errors.monthlyAdBudget.message as string}
          </p>
        )}
      </div>

      <div className="space-y-2.5">
        <Label htmlFor="deliveryFeeBorne">كم تتحمّل عادة من رسوم التوصيل في عروضك؟</Label>
        <Controller
          name="deliveryFeeBorne"
          control={control}
          render={({ field }) => (
            <>
              <div className="relative">
                <Input
                  variant="lg"
                  className="rounded-xl"
                  id="deliveryFeeBorne"
                  type="number"
                  inputMode="numeric"
                  placeholder="0-30 ريال"
                  value={field.value}
                  onChange={field.onChange}
                />
                <span className="absolute end-3 top-2.5 text-slate-500">ريال</span>
              </div>
              <Slider
                value={[field.value]}
                onValueChange={(value) => field.onChange(value[0])}
                min={0}
                max={30}
                step={1}
              />
            </>
          )}
        />
        <p className="text-sm text-slate-500">
          مثال: 10 ريال لكل طلب (مثل التوصيل المجاني أو خصم على رسوم التوصيل)
        </p>
        {errors.deliveryFeeBorne && (
          <p className="mt-1 animate-shake-enter text-xs text-orange-600/80">
            {errors.deliveryFeeBorne.message as string}
          </p>
        )}
      </div>

      {/* <div className="space-y-2.5">
        <Label htmlFor="monthlyDisputes">كم متوسط مبلغ التعويضات الشهري؟</Label>
        <Controller
          name="monthlyDisputes"
          control={control}
          render={({ field }) => (
            <div className="relative">
              <Input
                variant="lg"
                className="rounded-xl"
                id="monthlyDisputes"
                type="number"
                inputMode="numeric"
                placeholder="مثال: 500"
                {...field}
                value={field.value ?? ''}
              />
              <span className="absolute end-3 top-2.5 text-slate-500">ريال</span>
            </div>
          )}
        />
        <p className="text-sm text-slate-500">
          مثل: الخصومات على الطلبات المرفوضة أو اعتراضات العملاء
        </p>
        {errors.monthlyDisputes && (
          <p className="mt-1 animate-shake-enter text-xs text-orange-600/80">
            {errors.monthlyDisputes.message as string}
          </p>
        )}
      </div> */}
    </div>
  )
}

export default Step3
