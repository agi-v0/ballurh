'use client'
import React, { useState } from 'react'
import { useForm, Controller, Control, FieldErrors } from 'react-hook-form'
import { Input } from '@/components/ui/input'
import { Label } from '@/components/ui/label'
import { Button } from '@/components/ui/button'
import { RadioCardsItem, RadioCardsRoot } from '@/components/ui/radio-cards'
import {
  Stepper,
  StepperIndicator,
  StepperItem,
  StepperNav,
  StepperTitle,
  StepperTrigger,
} from '@/components/ui/stepper'
import { Card, CardContent } from '@/components/ui/card'
import { cn } from '@/utilities/ui'
import StepperBar from '../stepper/title-bar'

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

interface StepHeader {
  title: string
  description?: string
  className?: string
}

const StepHeader: React.FC<StepHeader> = ({ title, description, className }) => {
  return (
    <div className={cn('flex flex-col', className)}>
      <h2 className="mb-4 text-xl font-semibold">{title}</h2>
      {description && <p className="mb-4"> {description}</p>}
    </div>
  )
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

  const steps = [
    { title: 'نوع النشاط' },
    { title: 'عدد نقاط البيع' },
    { title: 'العلامات التجارية الافتراضية' },
    { title: 'رقم المعاملات السنوية' },
    { title: 'نسبة المبيعات عبر المنصات' },
    { title: 'متوسط العمولة' },
    { title: 'متوسط تكلفة المواد' },
    { title: 'تفاصيل الاتصال' },
  ]
  const totalSteps = steps.length

  const nextStep = () => setStep((prev) => Math.min(prev + 1, totalSteps))
  const prevStep = () => setStep((prev) => Math.max(prev - 1, 1))

  const onSubmit = (data: FormData) => {
    console.log('Form submitted:', data)
    alert('Form submitted successfully! Check console for data.')
  }

  return (
    <div className="w-full grow rounded-3xl border p-4">
      <h1 className="mb-6 text-center text-2xl font-bold">نموذج حاسبة الربحية</h1>
      <p className="mb-8 text-center text-gray-600">
        البيانات الشخصية تُستخدم فقط لتقدير كيف يمكن لحل بلورة أن يعزز من ربحيتك
      </p>
      <StepperBar steps={steps} currentStep={step} />
      <div className="relative">
        <form onSubmit={handleSubmit(onSubmit)}>
          {/* Step 1: Activity Type */}
          {step === 1 && (
            <div>
              <StepHeader title="1 – نوع النشاط" description="حدد نوع نقطة البيع:" />
              <Controller
                name="activityType"
                control={control}
                rules={{ required: 'يرجى اختيار نوع النشاط' }}
                render={({ field }) => (
                  <RadioCardsRoot
                    onValueChange={field.onChange}
                    value={field.value}
                    className="h-48 grid-cols-2 gap-2"
                    defaultValue="مطعم"
                  >
                    {['مطعم', 'مطبخ سحابي (Dark Kitchen)'].map((type) => (
                      <RadioCardsItem key={type} value={type} className="rounded-[20px]" asChild>
                        <Card>
                          <CardContent>
                            <div className="">{type}</div>
                          </CardContent>
                        </Card>
                      </RadioCardsItem>
                    ))}
                  </RadioCardsRoot>
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
              <StepHeader title="2 – عدد نقاط البيع" />
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
              <StepHeader title="3 – هل لديك علامات تجارية افتراضية؟" />
              <Controller
                name="hasVirtualBrands"
                control={control}
                rules={{ required: 'يرجى الاختيار' }}
                render={({ field }) => (
                  <RadioCardsRoot
                    onValueChange={field.onChange}
                    value={field.value}
                    className="grid-cols-2"
                  >
                    {['نعم', 'لا'].map((option) => (
                      <RadioCardsItem key={option} value={option}>
                        {option}
                      </RadioCardsItem>
                    ))}
                  </RadioCardsRoot>
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
              <StepHeader title="4 – رقم المعاملات السنوية (Turnover)" />
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
                      <span className="absolute end-3 top-2.5 text-gray-500">﷼</span>
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
              <StepHeader
                title="5 – نسبة المبيعات عبر المنصات الإلكترونية"
                description="ما النسبة المئوية من رقم معاملاتك السنوية التي تأتي من الطلبات عبر المنصات الإلكترونية؟"
              />
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
                      <span className="absolute end-3 top-2.5 text-gray-500">%</span>
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
              <StepHeader
                title="6 – متوسط العمولة التي تدفعها"
                description="أدخل متوسط النسبة المئوية التي تدفعها كعمولة للمنصات الإلكترونية"
              />
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
                      <span className="absolute end-3 top-2.5 text-gray-500">%</span>
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
              <StepHeader
                title="7 – متوسط تكلفة المواد"
                description="ما هي النسبة المئوية لمصاريفك التي تذهب لتكلفة المواد الخام؟"
              />
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
                      <span className="absolute end-3 top-2.5 text-gray-500">%</span>
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
              <StepHeader title="8 – تفاصيل الاتصال لتلقي المحاكاة" />
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
          <div className="mt-8 flex justify-end">
            {step > 1 && (
              <Button type="button" onClick={prevStep} variant="outline">
                السابق
              </Button>
            )}

            {step < totalSteps ? (
              <Button type="button" onClick={nextStep} variant="primary" color="brand">
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
    </div>
  )
}

export default ProfitabilityCalculator
