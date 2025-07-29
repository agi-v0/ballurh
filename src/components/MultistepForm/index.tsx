'use client'
import React, { useState } from 'react'
import { useForm, Controller, Control, FieldErrors } from 'react-hook-form'
import { Input } from '@/components/ui/input'
import { Label } from '@/components/ui/label'
import { Button } from '@/components/ui/button'
import { RadioCardsItem, RadioCardsRoot } from '@/components/ui/radio-cards'
import { Card, CardContent } from '@/components/ui/card'
import { cn } from '@/utilities/ui'
import StepperBar from '../stepper/title-bar'
import { motion, AnimatePresence } from 'motion/react'
import { Icon } from '@iconify-icon/react/dist/iconify.mjs'

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
    <div className={cn('mb-6 flex flex-col items-center pt-space-7', className)}>
      <h2 className="mb-4 text-h2 font-semibold">{title}</h2>
      {description && <p className="mb-4"> {description}</p>}
    </div>
  )
}

const AnimatedStepWrapper = ({
  children,
  ...props
}: { children: React.ReactNode } & React.ComponentProps<typeof motion.div>) => {
  return (
    <motion.div
      initial={{ opacity: 0, y: 20 }}
      animate={{ opacity: 1, y: 0 }}
      exit={{ opacity: 0, y: -20 }}
      transition={{ ease: [0.175, 0.885, 0.32, 1.1] }}
      className="mx-auto max-w-4xl"
      {...props}
    >
      {children}
    </motion.div>
  )
}

const ProfitabilityCalculator: React.FC = () => {
  const [formStep, setFormStep] = useState<number>(1)
  const [stepperStep, setStepperStep] = useState<number>(1)

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

  const stepperSteps = [
    { title: 'معلومات النشاط', steps: [1, 2, 3] },
    { title: 'البيانات المالية', steps: [4, 5, 6, 7] },
    { title: 'معلومات التواصل', steps: [8] },
  ]

  const totalFormSteps = 8 // Or calculate from stepperSteps

  const nextStep = () => {
    const newFormStep = Math.min(formStep + 1, totalFormSteps)
    setFormStep(newFormStep)
    const newStepperStep = stepperSteps.findIndex((s) => s.steps.includes(newFormStep)) + 1
    setStepperStep(newStepperStep)
  }

  const prevStep = () => {
    const newFormStep = Math.max(formStep - 1, 1)
    setFormStep(newFormStep)
    const newStepperStep = stepperSteps.findIndex((s) => s.steps.includes(newFormStep)) + 1
    setStepperStep(newStepperStep)
  }

  const onSubmit = (data: FormData) => {
    console.log('Form submitted:', data)
    alert('Form submitted successfully! Check console for data.')
  }

  return (
    <div className="flex w-full grow flex-col rounded-3xl border p-4">
      {/* <h1 className="mb-6 text-center text-2xl font-bold">نموذج حاسبة الربحية</h1>
      <p className="mb-8 text-center text-gray-600">
        البيانات الشخصية تُستخدم فقط لتقدير كيف يمكن لحل بلورة أن يعزز من ربحيتك
      </p> */}
      <div className="relative grow">
        {formStep > 1 && (
          <Button
            type="button"
            onClick={prevStep}
            variant="ghost"
            size="sm"
            className="absolute start-0 top-0"
          >
            <Icon icon="ri:arrow-right-line" height="none" className="size-4" />
            الرجوع
          </Button>
        )}
        <form onSubmit={handleSubmit(onSubmit)}>
          <AnimatePresence mode="wait">
            {formStep === 1 && (
              <AnimatedStepWrapper key={1}>
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
                          <RadioCardsItem
                            key={type}
                            value={type}
                            className="rounded-[20px] data-[state=checked]:bg-background-neutral data-[state=checked]:shadow-xs"
                            asChild
                          >
                            <Card className="bg-transparent shadow-none">
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
                    <p className="mt-1 animate-shake-enter text-xs text-orange-600/80">
                      {errors.activityType.message}
                    </p>
                  )}
                </div>
              </AnimatedStepWrapper>
            )}

            {formStep === 2 && (
              <AnimatedStepWrapper key={2}>
                <div>
                  <StepHeader title="2 – عدد نقاط البيع" />
                  <div className="mb-4 space-y-2.5">
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
                          variant="lg"
                          className="rounded-xl"
                          id="outletsCount"
                          type="number"
                          placeholder="أدخل عدد الفروع أو المواقع"
                          {...field}
                        />
                      )}
                    />
                    {errors.outletsCount && (
                      <p className="mt-1 animate-shake-enter text-xs text-orange-600/80">
                        {errors.outletsCount.message}
                      </p>
                    )}
                  </div>
                </div>
              </AnimatedStepWrapper>
            )}

            {formStep === 3 && (
              <AnimatedStepWrapper key={3}>
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
                    <p className="mt-1 animate-shake-enter text-xs text-orange-600/80">
                      {errors.hasVirtualBrands.message}
                    </p>
                  )}
                  {hasVirtualBrands === 'نعم' && (
                    <div className="mt-6 mb-4 space-y-2.5">
                      <Label className="inline-block" htmlFor="virtualBrandsCount">
                        عدد العلامات التجارية الافتراضية
                      </Label>
                      <Controller
                        name="virtualBrandsCount"
                        control={control}
                        rules={{
                          required: 'هذا الحقل مطلوب',
                          min: { value: 1, message: 'يجب أن تكون القيمة 1 على الأقل' },
                        }}
                        render={({ field }) => (
                          <Input
                            variant="lg"
                            className="rounded-xl"
                            id="virtualBrandsCount"
                            type="number"
                            placeholder="أدخل عدد العلامات التجارية الافتراضية"
                            {...field}
                          />
                        )}
                      />
                      {errors.virtualBrandsCount && (
                        <p className="mt-1 animate-shake-enter text-xs text-orange-600/80">
                          {errors.virtualBrandsCount.message}
                        </p>
                      )}
                    </div>
                  )}
                </div>
              </AnimatedStepWrapper>
            )}

            {formStep === 4 && (
              <AnimatedStepWrapper key={4}>
                <div>
                  <StepHeader title="4 – رقم المعاملات السنوية (Turnover)" />
                  <div className="mb-4 space-y-2.5">
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
                            variant="lg"
                            className="rounded-xl"
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
                      <p className="mt-1 animate-shake-enter text-xs text-orange-600/80">
                        {errors.annualTurnover.message}
                      </p>
                    )}
                  </div>
                </div>
              </AnimatedStepWrapper>
            )}

            {formStep === 5 && (
              <AnimatedStepWrapper key={5}>
                <div>
                  <StepHeader
                    title="5 – نسبة المبيعات عبر المنصات الإلكترونية"
                    description="ما النسبة المئوية من رقم معاملاتك السنوية التي تأتي من الطلبات عبر المنصات الإلكترونية؟"
                  />
                  <div className="mb-4 space-y-2.5">
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
                            variant="lg"
                            className="rounded-xl"
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
                      <p className="mt-1 animate-shake-enter text-xs text-orange-600/80">
                        {errors.onlineSalesPercentage.message}
                      </p>
                    )}
                  </div>
                </div>
              </AnimatedStepWrapper>
            )}

            {formStep === 6 && (
              <AnimatedStepWrapper key={6}>
                <div>
                  <StepHeader
                    title="6 – متوسط العمولة التي تدفعها"
                    description="أدخل متوسط النسبة المئوية التي تدفعها كعمولة للمنصات الإلكترونية"
                  />
                  <div className="mb-4 space-y-2.5">
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
                            variant="lg"
                            className="rounded-xl"
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
                      <p className="mt-1 animate-shake-enter text-xs text-orange-600/80">
                        {errors.averageCommission.message}
                      </p>
                    )}
                  </div>
                </div>
              </AnimatedStepWrapper>
            )}

            {formStep === 7 && (
              <AnimatedStepWrapper key={7}>
                <div>
                  <StepHeader
                    title="7 – متوسط تكلفة المواد"
                    description="ما هي النسبة المئوية لمصاريفك التي تذهب لتكلفة المواد الخام؟"
                  />
                  <div className="mb-4 space-y-2.5">
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
                            variant="lg"
                            className="rounded-xl"
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
                      <p className="mt-1 animate-shake-enter text-xs text-orange-600/80">
                        {errors.averageMaterialCost.message}
                      </p>
                    )}
                  </div>
                </div>
              </AnimatedStepWrapper>
            )}

            {formStep === 8 && (
              <AnimatedStepWrapper key={8}>
                <div>
                  <StepHeader title="8 – تفاصيل الاتصال لتلقي المحاكاة" />
                  <div className="mb-4 space-y-2.5">
                    <Label htmlFor="contactDetails.name">الاسم</Label>
                    <Controller
                      name="contactDetails.name"
                      control={control}
                      rules={{ required: 'هذا الحقل مطلوب' }}
                      render={({ field }) => (
                        <Input
                          variant="lg"
                          className="rounded-xl"
                          id="contactDetails.name"
                          placeholder="أدخل اسمك"
                          {...field}
                          autoComplete="name"
                        />
                      )}
                    />
                    {errors.contactDetails?.name && (
                      <p className="mt-1 animate-shake-enter text-xs text-orange-600/80">
                        {errors.contactDetails.name.message}
                      </p>
                    )}
                  </div>
                  <div className="mb-4 space-y-2.5">
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
                          variant="lg"
                          className="rounded-xl"
                          id="contactDetails.email"
                          type="email"
                          placeholder="أدخل بريدك الإلكتروني"
                          {...field}
                          autoComplete="email"
                        />
                      )}
                    />
                    {errors.contactDetails?.email && (
                      <p className="mt-1 animate-shake-enter text-xs text-orange-600/80">
                        {errors.contactDetails.email.message}
                      </p>
                    )}
                  </div>
                  <div className="mb-4 space-y-2.5">
                    <Label htmlFor="contactDetails.phone">رقم الهاتف</Label>
                    <Controller
                      name="contactDetails.phone"
                      control={control}
                      rules={{ required: 'هذا الحقل مطلوب' }}
                      render={({ field }) => (
                        <Input
                          variant="lg"
                          className="rounded-xl"
                          id="contactDetails.phone"
                          type="tel"
                          placeholder="أدخل رقم هاتفك"
                          {...field}
                          autoComplete="tel"
                        />
                      )}
                    />
                    {errors.contactDetails?.phone && (
                      <p className="mt-1 animate-shake-enter text-xs text-orange-600/80">
                        {errors.contactDetails.phone.message}
                      </p>
                    )}
                  </div>
                </div>
              </AnimatedStepWrapper>
            )}
          </AnimatePresence>

          {/* Navigation Buttons */}
          <div className="mx-auto mt-8 flex max-w-4xl justify-end">
            {/* {formStep > 1 && (
              <Button type="button" onClick={prevStep} variant="ghost">
                السابق
              </Button>
            )} */}

            {formStep < totalFormSteps ? (
              <Button
                type="button"
                onClick={nextStep}
                variant="primary"
                color="brand"
                size="lg"
                className="w-full"
              >
                التالي
              </Button>
            ) : (
              <Button type="submit" variant="primary" color="brand" size="lg" className="w-full">
                إرسال
              </Button>
            )}
          </div>
        </form>
      </div>
      <StepperBar steps={stepperSteps} currentStep={stepperStep} />
    </div>
  )
}

export default ProfitabilityCalculator
