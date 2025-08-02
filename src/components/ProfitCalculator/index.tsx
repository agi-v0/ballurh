'use client'
import React, { useState } from 'react'
import {
  useForm,
  Controller,
  SubmitHandler,
  SubmitErrorHandler,
  FormProvider,
} from 'react-hook-form'
import { z } from 'zod'
import { zodResolver } from '@hookform/resolvers/zod'
import { Icon } from '@iconify-icon/react'
import { motion, AnimatePresence } from 'motion/react'

import { Button } from '@/components/ui/button'

import StepperBar from '../stepper/title-bar'
import { cn } from '@/utilities/ui'

import Step1 from './steps/Step1'
import Step2 from './steps/Step2'
import Step3 from './steps/Step3'
import Step4 from './steps/Step4'

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

const formSteps = [
  { category: 'البنية التشغيلية', title: 'ما نوع نشاطك الرئيسي؟', steps: [<Step1 />] },
  { category: 'بيانات التوصيل الأساسية', title: 'مبيعات التوصيل والعمولة', steps: [<Step2 />] },
  {
    category: 'التكاليف التشغيلية والترويجية',
    title: 'تكلفة المواد الغذائية والإعلانات',
    steps: [<Step3 />],
  },
  { category: 'بيانات التواصل وإرسال التقرير', title: 'خلينا نرسلك تقريرك', steps: [<Step4 />] },
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

  const methods = useForm<FormData>({
    defaultValues,
    // currentSchema resolver resets values of fields when step advances
    resolver: zodResolver(formSchema, undefined, {}),
    mode: 'onSubmit',
    // shouldUnregister: true, // when true, values are not preserved when step advances but this also avoids premature validation in the last step
  })

  const {
    control,
    handleSubmit,
    watch,
    trigger,
    setError,
    clearErrors,
    getValues,
    formState: { errors },
  } = methods

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
    try {
      const response = await fetch('/next/calculate-profit', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify(data),
      })

      if (response.ok) {
        setIsSubmitted(true)
      } else {
        // Handle server errors or invalid responses
        console.error('Submission failed:', await response.text())
        // Optionally, set an error state to show a message to the user
      }
    } catch (error) {
      console.error('An error occurred during submission:', error)
      // Optionally, set an error state to show a message to the user
    }
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
      <AnimatePresence mode="wait">
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

        <span className="mx-auto rounded-full border px-3 py-1 text-sm">
          {formStep + 1}/{formSteps.length} - {formSteps[formStep].category}
        </span>
        <FormProvider {...methods}>
          <form
            onSubmit={(e) => {
              e.preventDefault()
            }}
          >
            <AnimatedStepWrapper key={formStep}>
              <StepHeader title={formSteps[formStep].title} />
              {formSteps[formStep].steps}
            </AnimatedStepWrapper>

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
                // if submit is handled by the form, the submit function is automatically called when button with type submit is mounted
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
        </FormProvider>
        <StepperBar
          steps={formSteps.map((s) => ({ title: s.category }))}
          currentStep={formStep + 1}
        />
        {/* <DevTool control={control} />  */}
      </AnimatePresence>
    </div>
  )
}

export default ProfitabilityCalculator
