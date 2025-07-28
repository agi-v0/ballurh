'use client'
import React, { useState } from 'react'
import { useForm, Controller, Control, FieldErrors } from 'react-hook-form'
import { Input } from '@/components/ui/input'
import { Label } from '@/components/ui/label'
import { Button } from '@/components/ui/button'

// Define TypeScript interfaces
interface ContactDetails {
  name: string
  email: string
  phone: string
}

interface FormData {
  activityType: string
  outletsCount: string
  hasVirtualBrands: string
  virtualBrandsCount: string
  annualTurnover: string
  onlineSalesPercentage: string
  averageCommission: string
  averageMaterialCost: string
  contactDetails: ContactDetails
}

const ProfitabilityCalculator: React.FC = () => {
  const [step, setStep] = useState<number>(1)
  const {
    control,
    handleSubmit,
    watch,
    formState: { errors },
  } = useForm<FormData>({
    defaultValues: {
      activityType: '',
      outletsCount: '',
      hasVirtualBrands: '',
      virtualBrandsCount: '',
      annualTurnover: '',
      onlineSalesPercentage: '',
      averageCommission: '',
      averageMaterialCost: '',
      contactDetails: {
        name: '',
        email: '',
        phone: '',
      },
    },
  })

  const hasVirtualBrands = watch('hasVirtualBrands')
  const totalSteps = 8

  const nextStep = () => setStep((prev) => Math.min(prev + 1, totalSteps))
  const prevStep = () => setStep((prev) => Math.max(prev - 1, 1))

  const onSubmit = (data: FormData) => {
    console.log('Form submitted:', data)
    alert('Form submitted successfully! Check console for data.')
  }

  const StepIndicator: React.FC = () => (
    <div className="mb-8">
      <div className="flex justify-between">
        {[...Array(totalSteps)].map((_, i) => (
          <div
            key={i}
            className={`flex-1 text-center ${i + 1 === step ? 'font-bold text-blue-600' : 'text-gray-500'}`}
          >
            <div
              className={`h-2 rounded-full ${i + 1 <= step ? 'bg-blue-500' : 'bg-gray-300'}`}
            ></div>
            <span className="mt-1 text-sm">Step {i + 1}</span>
          </div>
        ))}
      </div>
    </div>
  )

  return (
    <div className="mx-auto max-w-2xl rounded-lg p-6 shadow-lg">
      <h1 className="mb-6 text-center text-2xl font-bold">نموذج حاسبة الربحية</h1>
      <p className="mb-8 text-center text-gray-600">
        البيانات الشخصية تُستخدم فقط لتقدير كيف يمكن لحل بلورة أن يعزز من ربحيتك
      </p>

      <StepIndicator />

      <form onSubmit={handleSubmit(onSubmit)}>
        {/* Step 1: Activity Type */}
        {step === 1 && (
          <div>
            <h2 className="mb-4 text-xl font-semibold">1 – نوع النشاط</h2>
            <p className="mb-4">حدد نوع نقطة البيع:</p>
            <Controller
              name="activityType"
              control={control}
              rules={{ required: 'يرجى اختيار نوع النشاط' }}
              render={({ field }) => (
                <div className="space-y-3">
                  {['مطعم', 'مطبخ سحابي (Dark Kitchen)'].map((type) => (
                    <label
                      key={type}
                      className="flex cursor-pointer items-center rounded-lg border p-3 hover:bg-gray-50"
                    >
                      <input
                        type="radio"
                        value={type}
                        checked={field.value === type}
                        onChange={() => field.onChange(type)}
                        className="ml-2"
                      />
                      {type}
                    </label>
                  ))}
                </div>
              )}
            />
            {errors.activityType && (
              <p className="mt-2 text-red-500">{errors.activityType.message}</p>
            )}
          </div>
        )}

        {/* Step 2: Number of Outlets */}
        {step === 2 && (
          <div>
            <h2 className="mb-4 text-xl font-semibold">2 – عدد نقاط البيع</h2>
            <div className="mb-4">
              <Label htmlFor="outletsCount">عدد الفروع أو المواقع</Label>
              <Controller
                name="outletsCount"
                control={control}
                rules={{
                  required: 'هذا الحقل مطلوب',
                  min: { value: 1, message: 'يجب أن تكون القيمة 1 على الأقل' },
                }}
                render={({ field }) => (
                  <Input
                    id="outletsCount"
                    type="number"
                    placeholder="أدخل عدد الفروع أو المواقع"
                    {...field}
                  />
                )}
              />
              {errors.outletsCount && (
                <p className="mt-1 text-red-500">{errors.outletsCount.message}</p>
              )}
            </div>
          </div>
        )}

        {/* Step 3: Virtual Brands */}
        {step === 3 && (
          <div>
            <h2 className="mb-4 text-xl font-semibold">3 – هل لديك علامات تجارية افتراضية؟</h2>
            <Controller
              name="hasVirtualBrands"
              control={control}
              rules={{ required: 'يرجى الاختيار' }}
              render={({ field }) => (
                <div className="space-y-3">
                  {['نعم', 'لا'].map((option) => (
                    <label
                      key={option}
                      className="flex cursor-pointer items-center rounded-lg border p-3 hover:bg-gray-50"
                    >
                      <input
                        type="radio"
                        value={option}
                        checked={field.value === option}
                        onChange={() => field.onChange(option)}
                        className="ml-2"
                      />
                      {option}
                    </label>
                  ))}
                </div>
              )}
            />
            {errors.hasVirtualBrands && (
              <p className="mt-2 text-red-500">{errors.hasVirtualBrands.message}</p>
            )}
            {hasVirtualBrands === 'نعم' && (
              <div className="mt-6 mb-4">
                <Label htmlFor="virtualBrandsCount">عدد العلامات التجارية الافتراضية</Label>
                <Controller
                  name="virtualBrandsCount"
                  control={control}
                  rules={{
                    required: 'هذا الحقل مطلوب',
                    min: { value: 1, message: 'يجب أن تكون القيمة 1 على الأقل' },
                  }}
                  render={({ field }) => (
                    <Input
                      id="virtualBrandsCount"
                      type="number"
                      placeholder="أدخل عدد العلامات التجارية الافتراضية"
                      {...field}
                    />
                  )}
                />
                {errors.virtualBrandsCount && (
                  <p className="mt-1 text-red-500">{errors.virtualBrandsCount.message}</p>
                )}
              </div>
            )}
          </div>
        )}

        {/* Step 4: Annual Turnover */}
        {step === 4 && (
          <div>
            <h2 className="mb-4 text-xl font-semibold">4 – رقم المعاملات السنوية (Turnover)</h2>
            <div className="mb-4">
              <Label htmlFor="annualTurnover">رقم معاملاتك السنوية</Label>
              <Controller
                name="annualTurnover"
                control={control}
                rules={{
                  required: 'هذا الحقل مطلوب',
                  min: { value: 0, message: 'يجب أن تكون القيمة 0 على الأقل' },
                }}
                render={({ field }) => (
                  <div className="relative">
                    <Input
                      id="annualTurnover"
                      type="number"
                      placeholder="أدخل رقم معاملاتك السنوية"
                      {...field}
                    />
                    <span className="absolute top-2.5 left-3 text-gray-500">﷼</span>
                  </div>
                )}
              />
              {errors.annualTurnover && (
                <p className="mt-1 text-red-500">{errors.annualTurnover.message}</p>
              )}
            </div>
          </div>
        )}

        {/* Step 5: Online Sales Percentage */}
        {step === 5 && (
          <div>
            <h2 className="mb-4 text-xl font-semibold">
              5 – نسبة المبيعات عبر المنصات الإلكترونية
            </h2>
            <p className="mb-4">
              ما النسبة المئوية من رقم معاملاتك السنوية التي تأتي من الطلبات عبر المنصات
              الإلكترونية؟
            </p>
            <div className="mb-4">
              <Label htmlFor="onlineSalesPercentage">نسبة المبيعات عبر المنصات</Label>
              <Controller
                name="onlineSalesPercentage"
                control={control}
                rules={{
                  required: 'هذا الحقل مطلوب',
                  min: { value: 0, message: 'يجب أن تكون القيمة 0 على الأقل' },
                  max: { value: 100, message: 'يجب أن تكون القيمة 100 كحد أقصى' },
                }}
                render={({ field }) => (
                  <div className="relative">
                    <Input
                      id="onlineSalesPercentage"
                      type="number"
                      placeholder="أدخل النسبة المئوية"
                      {...field}
                    />
                    <span className="absolute top-2.5 left-3 text-gray-500">%</span>
                  </div>
                )}
              />
              {errors.onlineSalesPercentage && (
                <p className="mt-1 text-red-500">{errors.onlineSalesPercentage.message}</p>
              )}
            </div>
          </div>
        )}

        {/* Step 6: Average Commission */}
        {step === 6 && (
          <div>
            <h2 className="mb-4 text-xl font-semibold">6 – متوسط العمولة التي تدفعها</h2>
            <p className="mb-4">أدخل متوسط النسبة المئوية التي تدفعها كعمولة للمنصات الإلكترونية</p>
            <div className="mb-4">
              <Label htmlFor="averageCommission">متوسط العمولة</Label>
              <Controller
                name="averageCommission"
                control={control}
                rules={{
                  required: 'هذا الحقل مطلوب',
                  min: { value: 0, message: 'يجب أن تكون القيمة 0 على الأقل' },
                  max: { value: 100, message: 'يجب أن تكون القيمة 100 كحد أقصى' },
                }}
                render={({ field }) => (
                  <div className="relative">
                    <Input
                      id="averageCommission"
                      type="number"
                      placeholder="أدخل متوسط العمولة"
                      {...field}
                    />
                    <span className="absolute top-2.5 left-3 text-gray-500">%</span>
                  </div>
                )}
              />
              {errors.averageCommission && (
                <p className="mt-1 text-red-500">{errors.averageCommission.message}</p>
              )}
            </div>
          </div>
        )}

        {/* Step 7: Material Cost */}
        {step === 7 && (
          <div>
            <h2 className="mb-4 text-xl font-semibold">7 – متوسط تكلفة المواد</h2>
            <p className="mb-4">ما هي النسبة المئوية لمصاريفك التي تذهب لتكلفة المواد الخام؟</p>
            <div className="mb-4">
              <Label htmlFor="averageMaterialCost">نسبة تكلفة المواد</Label>
              <Controller
                name="averageMaterialCost"
                control={control}
                rules={{
                  required: 'هذا الحقل مطلوب',
                  min: { value: 0, message: 'يجب أن تكون القيمة 0 على الأقل' },
                  max: { value: 100, message: 'يجب أن تكون القيمة 100 كحد أقصى' },
                }}
                render={({ field }) => (
                  <div className="relative">
                    <Input
                      id="averageMaterialCost"
                      type="number"
                      placeholder="أدخل نسبة تكلفة المواد"
                      {...field}
                    />
                    <span className="absolute top-2.5 left-3 text-gray-500">%</span>
                  </div>
                )}
              />
              {errors.averageMaterialCost && (
                <p className="mt-1 text-red-500">{errors.averageMaterialCost.message}</p>
              )}
            </div>
          </div>
        )}

        {/* Step 8: Contact Details */}
        {step === 8 && (
          <div>
            <h2 className="mb-4 text-xl font-semibold">8 – تفاصيل الاتصال لتلقي المحاكاة</h2>
            <div className="mb-4">
              <Label htmlFor="contactDetails.name">الاسم</Label>
              <Controller
                name="contactDetails.name"
                control={control}
                rules={{ required: 'هذا الحقل مطلوب' }}
                render={({ field }) => (
                  <Input id="contactDetails.name" placeholder="أدخل اسمك" {...field} />
                )}
              />
              {errors.contactDetails?.name && (
                <p className="mt-1 text-red-500">{errors.contactDetails.name.message}</p>
              )}
            </div>
            <div className="mb-4">
              <Label htmlFor="contactDetails.email">البريد الإلكتروني</Label>
              <Controller
                name="contactDetails.email"
                control={control}
                rules={{
                  required: 'هذا الحقل مطلوب',
                  pattern: {
                    value: /^[^\s@]+@[^\s@]+\.[^\s@]+$/,
                    message: 'يرجى إدخال بريد إلكتروني صحيح',
                  },
                }}
                render={({ field }) => (
                  <Input
                    id="contactDetails.email"
                    type="email"
                    placeholder="أدخل بريدك الإلكتروني"
                    {...field}
                  />
                )}
              />
              {errors.contactDetails?.email && (
                <p className="mt-1 text-red-500">{errors.contactDetails.email.message}</p>
              )}
            </div>
            <div className="mb-4">
              <Label htmlFor="contactDetails.phone">رقم الهاتف</Label>
              <Controller
                name="contactDetails.phone"
                control={control}
                rules={{ required: 'هذا الحقل مطلوب' }}
                render={({ field }) => (
                  <Input
                    id="contactDetails.phone"
                    type="tel"
                    placeholder="أدخل رقم هاتفك"
                    {...field}
                  />
                )}
              />
              {errors.contactDetails?.phone && (
                <p className="mt-1 text-red-500">{errors.contactDetails.phone.message}</p>
              )}
            </div>
          </div>
        )}

        {/* Navigation Buttons */}
        <div className="mt-8 flex justify-between">
          {step > 1 && (
            <Button type="button" onClick={prevStep} variant="outline">
              السابق
            </Button>
          )}

          {step < totalSteps ? (
            <Button
              type="button"
              onClick={nextStep}
              className="ml-auto"
              variant="primary"
              color="brand"
            >
              التالي
            </Button>
          ) : (
            <Button type="submit" className="ml-auto" variant="primary" color="brand">
              إرسال
            </Button>
          )}
        </div>
      </form>
    </div>
  )
}

export default ProfitabilityCalculator
