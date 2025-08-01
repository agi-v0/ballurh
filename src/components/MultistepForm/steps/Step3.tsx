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
                  placeholder="20-50%"
                  value={field.value}
                  onChange={field.onChange}
                />
                <span className="absolute end-3 top-2.5 text-slate-500">%</span>
              </div>
              <Slider
                value={[parseInt(field.value, 10)]}
                onValueChange={(value) => field.onChange(String(value[0]))}
                min={1}
                max={50}
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
          كم ميزانيتك الإعلانية الشهرية على تطبيقات التوصيل؟
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
        <Label htmlFor="promoDiscountPercentage">كم عادة تقدم خصومات ترويجية؟</Label>
        <Controller
          name="promoDiscountPercentage"
          control={control}
          render={({ field }) => (
            <>
              <div className="relative">
                <Input
                  variant="lg"
                  className="rounded-xl"
                  id="promoDiscountPercentage"
                  type="number"
                  placeholder="0-50%"
                  value={field.value}
                  onChange={field.onChange}
                />
                <span className="absolute end-3 top-2.5 text-slate-500">%</span>
              </div>
              <Slider
                value={[parseInt(field.value, 10)]}
                onValueChange={(value) => field.onChange(String(value[0]))}
                min={0}
                max={100}
                step={1}
              />
            </>
          )}
        />
        <p className="text-sm text-slate-500">
          مثال - خصومات مثل: &quot;توصيل مجاني، اطلب 1 واحصل على 1، 25% خصم، إلخ&quot;
        </p>
        {errors.promoDiscountPercentage && (
          <p className="mt-1 animate-shake-enter text-xs text-orange-600/80">
            {errors.promoDiscountPercentage.message as string}
          </p>
        )}
      </div>
    </div>
  )
}

export default Step3
