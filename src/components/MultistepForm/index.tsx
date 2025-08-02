'use client'
import React, { useEffect, useState } from 'react'
import { useForm, Controller, SubmitHandler, SubmitErrorHandler } from 'react-hook-form'
import { z } from 'zod'
import { zodResolver } from '@hookform/resolvers/zod'
import { Icon } from '@iconify-icon/react'
import { Link } from '@/i18n/navigation'
import { motion, AnimatePresence } from 'motion/react'

import { Input } from '@/components/ui/input'
import { Label } from '@/components/ui/label'
import { Button } from '@/components/ui/button'
import { RadioCardsIndicator, RadioCardsItem, RadioCardsRoot } from '@/components/ui/radio-cards'
import { Slider } from '@/components/ui/slider'
import StepperBar from '../stepper/title-bar'
import { cn } from '@/utilities/ui'
import HybridRestaurant from '../Graphics/hybrid-restaurant'
import CloudKitchen from '../Graphics/cloud-kitchen'
import Restaurant from '../Graphics/restaurant'

const step1Schema = z
  .object({
    activityType: z.string({ message: 'يرجى اختيار نوع النشاط' }),
    physicalBranchesCount: z.coerce.number().min(1, 'يجب أن تكون القيمة 1 على الأقل'),
    hasCloudBrands: z.enum(['نعم', 'لا'], { message: 'يرجى الاختيار' }),
    cloudBrandsCount: z.coerce.number().optional(),
  })
  .superRefine((data, ctx) => {
    if (data.hasCloudBrands === 'نعم' && !data.cloudBrandsCount) {
      ctx.addIssue({
        path: ['cloudBrandsCount'],
        code: 'custom',
        message: 'أدخل عدد العلامات',
      })
    }
  })

const step2Schema = z.object({
  deliverySalesPercentage: z.coerce.number().min(1, { message: 'هذا الحقل مطلوب' }),
  monthlyOrders: z.string().min(1, { message: 'هذا الحقل مطلوب' }),
  avgCommissionRate: z.coerce.number().min(1, { message: 'هذا الحقل مطلوب' }),
})

const step3Schema = z.object({
  foodCostPercentage: z.coerce.number().min(1, { message: 'هذا الحقل مطلوب' }),
  monthlyAdBudget: z.string().min(1, { message: 'هذا الحقل مطلوب' }),
  promoDiscountPercentage: z.coerce.number().min(10, { message: 'هذا الحقل مطلوب' }),
})

const step4Schema = z.object({
  name: z.string().min(1, { message: 'هذا الحقل مطلوب' }),
  email: z
    .string()
    .min(1, { message: 'هذا الحقل مطلوب' }) // empty string
    .pipe(z.email({ message: 'يرجى إدخال بريد إلكتروني صحيح' })), // bad format
  phone: z.string().min(1, { message: 'هذا الحقل مطلوب' }),
  businessName: z.string().optional(),
})

const stepSchemas = [step1Schema, step2Schema, step3Schema, step4Schema] as const

const formSchema = step1Schema
  .extend(step2Schema.shape)
  .extend(step3Schema.shape)
  .extend(step4Schema.shape)

type FormData = z.infer<typeof formSchema>

const defaultValues = {
  activityType: 'hybridRestaurant',
  physicalBranchesCount: 1,
  hasCloudBrands: '' as 'نعم' | 'لا',
  cloudBrandsCount: 1,
  deliverySalesPercentage: 25,
  monthlyOrders: '',
  avgCommissionRate: 25,
  foodCostPercentage: 30,
  monthlyAdBudget: '',
  promoDiscountPercentage: 10,
  name: '',
  email: '',
  phone: '',
  businessName: '',
}

interface StepHeaderProps {
  title: string
  description?: string
  className?: string
}

const StepHeader: React.FC<StepHeaderProps> = ({ title, description, className }) => {
  return (
    <div className={cn('mb-6 flex flex-col items-center pt-space-7', className)}>
      <h2 className="mb-4 text-h2 font-semibold">{title}</h2>
      {description && <p className="mb-4 text-center"> {description}</p>}
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

const stepperSteps = [
  { title: 'البنية التشغيلية', steps: [0] },
  { title: 'بيانات التوصيل الأساسية', steps: [1] },
  { title: 'التكاليف التشغيلية والترويجية', steps: [2] },
  { title: 'بيانات التواصل وإرسال التقرير', steps: [3] },
]

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
    label: 'نشاط سحابي (دارك ستور)',
    icon: (props) => <CloudKitchen {...props} />,
  },
  {
    value: 'hybridRestaurant',
    label: 'فرع فعلي يقدّم أيضاً علامات سحابية',
    icon: (props) => <HybridRestaurant {...props} />,
  },
]

const stepFields: (keyof FormData)[][] = [
  ['activityType', 'physicalBranchesCount', 'hasCloudBrands', 'cloudBrandsCount'],
  ['deliverySalesPercentage', 'monthlyOrders', 'avgCommissionRate'],
  ['foodCostPercentage', 'monthlyAdBudget', 'promoDiscountPercentage'],
  ['name', 'email', 'phone', 'businessName'],
]

const ProfitabilityCalculator: React.FC = () => {
  const [formStep, setFormStep] = useState<number>(0)
  const [isSubmitted, setIsSubmitted] = useState(false)

  const {
    control,
    handleSubmit,
    watch,
    trigger,
    setError,
    clearErrors,
    getValues,
    formState: { errors },
  } = useForm<FormData>({
    defaultValues,
    // currentSchema resolver resets values of fields when step advances
    resolver: zodResolver(formSchema, undefined, {}),
    mode: 'onSubmit',
    // shouldUnregister: true, // when true, values are not preserved when step advances but this also avoids premature validation in the last step
  })

  // monitor errors per form step
  // useEffect(() => {
  //   console.log('formStep: ', formStep, 'errors: ', errors)
  // }, [formStep, errors])

  const hasCloudBrands = watch('hasCloudBrands')

  const totalFormSteps = 4

  const pick = <T extends object, K extends keyof T>(obj: T, keys: K[]) =>
    keys.reduce((a, k) => ((a[k] = obj[k]), a), {} as Pick<T, K>)

  const nextStep = async () => {
    const isValid = await trigger(stepFields[formStep])
    if (isValid) {
      setFormStep((s) => Math.min(s + 1, totalFormSteps - 1))
    }
    // alternative validation logic
    // const names = stepFields[formStep]
    // const values = pick(getValues(), names)
    // const parsed = stepSchemas[formStep].safeParse(values)

    // // clear any stale errors for this step
    // clearErrors(names)

    // if (!parsed.success) {
    //   parsed.error.issues.forEach((i) => {
    //     const name = i.path[0] as keyof FormData
    //     setError(name, { type: 'zod', message: i.message }, { shouldFocus: true })
    //   })
    //   const el = document.getElementById(parsed.error.issues[0].path[0] as string)
    //   if (el) {
    //     el.scrollIntoView({ behavior: 'smooth' })
    //     el.focus()
    //   }
    //   return
    // }
  }

  const prevStep = () => {
    setFormStep((prev) => Math.max(prev - 1, 0))
  }

  const onSubmit: SubmitHandler<FormData> = async (data) => {
    console.log('data submitted:', data)
    // send to backend …
    setIsSubmitted(true)
  }

  const onError: SubmitErrorHandler<FormData> = async (errors, e) => {
    // Object.keys(errors).forEach((key) => {
    //   setError(key as keyof FormData, {
    //     message: errors[key as keyof FormData]?.message,
    //   })
    // })
  }

  if (isSubmitted) {
    return (
      <div className="flex w-full grow flex-col items-center justify-center rounded-3xl border bg-background-neutral p-4">
        <AnimatedStepWrapper>
          <div className="text-center">
            <h2 className="text-2xl font-semibold">
              ✅ تم استلام بياناتك، التقرير في الطريق لبريدك الإلكتروني أو واتساب.
            </h2>
          </div>
        </AnimatedStepWrapper>
      </div>
    )
  }

  return (
    <div className="relative flex w-full grow flex-col rounded-3xl border p-4">
      {formStep > 0 && (
        <Button
          type="button"
          onClick={prevStep}
          variant="ghost"
          size="sm"
          className="absolute inset-1 w-fit md:inset-2 lg:inset-4"
        >
          <Icon icon="ri:arrow-right-line" height="none" className="size-4" />
          الرجوع
        </Button>
      )}
      <form
        onSubmit={(e) => {
          e.preventDefault()
        }}
      >
        <AnimatePresence mode="wait">
          {formStep === 0 && (
            <AnimatedStepWrapper key={1}>
              <StepHeader title="ما نوع نشاطك الرئيسي؟" />
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
                          <RadioCardsIndicator
                            placement="top-right"
                            className="[&>iconify-icon]:size-6"
                          />
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
                    {errors.activityType.message}
                  </p>
                )}

                <div className="space-y-2.5">
                  <Label htmlFor="physicalBranchesCount">كم عدد الفروع الفعلية (نقاط البيع)؟</Label>
                  <Controller
                    name="physicalBranchesCount"
                    control={control}
                    render={({ field }) => (
                      <Input
                        variant="lg"
                        className="rounded-xl"
                        id="physicalBranchesCount"
                        type="number"
                        inputMode="numeric"
                        placeholder="مثال: 3"
                        {...field}
                      />
                    )}
                  />
                  {errors.physicalBranchesCount && (
                    <p className="mt-1 animate-shake-enter text-xs text-orange-600/80">
                      {errors.physicalBranchesCount.message}
                    </p>
                  )}
                </div>

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
                        {['نعم', 'لا'].map((option) => (
                          <RadioCardsItem
                            key={option}
                            value={option}
                            variant="classic"
                            className="flex h-12 flex-row rounded-xl py-2 text-sm font-medium data-[state=checked]:bg-background-neutral data-[state=checked]:text-base-primary data-[state=checked]:shadow-xs"
                          >
                            {option}
                            <RadioCardsIndicator className="end-2 top-0 bottom-0 [&>iconify-icon]:size-6" />
                          </RadioCardsItem>
                        ))}
                      </RadioCardsRoot>
                    )}
                  />
                  {errors.hasCloudBrands && (
                    <p className="mt-1 animate-shake-enter text-xs text-orange-600/80">
                      {errors.hasCloudBrands.message}
                    </p>
                  )}
                </div>

                {hasCloudBrands === 'نعم' && (
                  <div className="space-y-2.5">
                    <Label htmlFor="cloudBrandsCount">كم عدد العلامات التجارية السحابية؟</Label>
                    <Controller
                      name="cloudBrandsCount"
                      control={control}
                      render={({ field }) => (
                        <Input
                          variant="lg"
                          className="rounded-xl"
                          id="cloudBrandsCount"
                          type="number"
                          inputMode="numeric"
                          placeholder="أدخل عدد العلامات"
                          {...field}
                        />
                      )}
                    />
                    {errors.cloudBrandsCount && (
                      <p className="mt-1 animate-shake-enter text-xs text-orange-600/80">
                        {errors.cloudBrandsCount.message}
                      </p>
                    )}
                  </div>
                )}
              </div>
            </AnimatedStepWrapper>
          )}

          {formStep === 1 && (
            <AnimatedStepWrapper key={2}>
              <StepHeader title="مبيعات التوصيل والعمولة" />
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
                          inputMode="numeric"
                          placeholder="أدخل النسبة"
                          {...field}
                        />
                        <span className="absolute end-3 top-2.5 text-slate-500">%</span>
                      </div>
                    )}
                  />
                  {errors.deliverySalesPercentage && (
                    <p className="mt-1 animate-shake-enter text-xs text-orange-600/80">
                      {errors.deliverySalesPercentage.message}
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
                      {errors.monthlyOrders.message}
                    </p>
                  )}
                </div>

                <div className="space-y-2.5">
                  <Label htmlFor="avgCommissionRate">
                    كم متوسط النسبة اللي تدفعها كتطبيقات توصيل؟
                  </Label>
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
                      className="text-teal-600 transition-colors hover:text-slate-600"
                    >
                      نساعدك نطلّع الرقم بدقة.
                    </Link>
                  </p>
                  {errors.avgCommissionRate && (
                    <p className="mt-1 animate-shake-enter text-xs text-orange-600/80">
                      {errors.avgCommissionRate.message}
                    </p>
                  )}
                </div>
              </div>
            </AnimatedStepWrapper>
          )}

          {formStep === 2 && (
            <AnimatedStepWrapper key={3}>
              <StepHeader title="تكلفة المواد الغذائية والإعلانات" />
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
                      {errors.foodCostPercentage.message}
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
                      {errors.monthlyAdBudget.message}
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
                            inputMode="numeric"
                            placeholder="0-50%"
                            value={field.value}
                            onChange={field.onChange}
                          />
                          <span className="absolute end-3 top-2.5 text-slate-500">%</span>
                        </div>
                        <Slider
                          value={[field.value]}
                          onValueChange={(value) => field.onChange(value[0])}
                          min={0}
                          max={100}
                          step={1}
                        />
                      </>
                    )}
                  />
                  <p className="text-sm text-slate-500">
                    مثال: خصومات مثل: &quot;توصيل مجاني، اطلب 1 واحصل على 1، 25% خصم، إلخ&quot;
                  </p>
                  {errors.promoDiscountPercentage && (
                    <p className="mt-1 animate-shake-enter text-xs text-orange-600/80">
                      {errors.promoDiscountPercentage.message}
                    </p>
                  )}
                </div>
              </div>
            </AnimatedStepWrapper>
          )}

          {formStep === 3 && (
            <AnimatedStepWrapper key={4}>
              <StepHeader title="خلينا نرسلك تقريرك" />
              <div className="space-y-4">
                <div className="space-y-2.5">
                  <Label htmlFor="name">الاسم</Label>
                  <Controller
                    name="name"
                    control={control}
                    render={({ field }) => (
                      <Input
                        variant="lg"
                        className="rounded-xl"
                        id="name"
                        placeholder="أدخل اسمك"
                        {...field}
                        autoComplete="name"
                      />
                    )}
                  />
                  {errors.name && (
                    <p className="mt-1 animate-shake-enter text-xs text-orange-600/80">
                      {errors.name.message}
                    </p>
                  )}
                </div>
                <div className="space-y-2.5">
                  <Label htmlFor="email">البريد الإلكتروني</Label>
                  <Controller
                    name="email"
                    control={control}
                    render={({ field }) => (
                      <Input
                        variant="lg"
                        className="rounded-xl"
                        id="email"
                        type="email"
                        placeholder="أدخل بريدك الإلكتروني"
                        {...field}
                        autoComplete="email"
                      />
                    )}
                  />
                  {errors.email && (
                    <p className="mt-1 animate-shake-enter text-xs text-orange-600/80">
                      {errors.email.message}
                    </p>
                  )}
                </div>
                <div className="space-y-2.5">
                  <Label htmlFor="phone">رقم الجوال</Label>
                  <Controller
                    name="phone"
                    control={control}
                    render={({ field }) => (
                      <Input
                        variant="lg"
                        className="rounded-xl"
                        id="phone"
                        type="tel"
                        inputMode="numeric"
                        placeholder="أدخل رقم جوالك"
                        {...field}
                        autoComplete="tel"
                      />
                    )}
                  />
                  {errors.phone && (
                    <p className="mt-1 animate-shake-enter text-xs text-orange-600/80">
                      {errors.phone.message}
                    </p>
                  )}
                </div>
                <div className="space-y-2.5">
                  <Label htmlFor="businessName">اسم النشاط التجاري (اختياري)</Label>
                  <Controller
                    name="businessName"
                    control={control}
                    render={({ field }) => (
                      <Input
                        variant="lg"
                        className="rounded-xl"
                        id="businessName"
                        placeholder="أدخل اسم نشاطك التجاري"
                        {...field}
                        autoComplete="organization"
                      />
                    )}
                  />
                </div>
              </div>
            </AnimatedStepWrapper>
          )}
        </AnimatePresence>

        <div className="mx-auto mt-8 flex max-w-4xl justify-end lg:mb-2.5">
          {formStep < totalFormSteps - 1 ? (
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
            <Button
              type="button"
              onClick={handleSubmit(onSubmit, onError)}
              variant="primary"
              color="brand"
              size="lg"
              className="w-full"
            >
              احصل على تقريرك الآن
            </Button>
          )}
        </div>
      </form>

      <StepperBar
        steps={stepperSteps.map((s) => ({ title: s.title }))}
        currentStep={formStep + 1}
      />
      {/* <DevTool control={control} />  */}
    </div>
  )
}

export default ProfitabilityCalculator
