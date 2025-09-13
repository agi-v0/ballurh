'use client'
import React, { useEffect, useRef, useState } from 'react'
import { useForm, FormProvider } from 'react-hook-form'
import { formSchema, type FormData } from './schema'
import { zodResolver } from '@hookform/resolvers/zod'
import { Icon } from '@iconify-icon/react'
import { motion, AnimatePresence } from 'motion/react'
import { useStateMachine } from 'little-state-machine'

import { Button } from '@/components/ui/button'

import StepperBar from '../stepper/title-bar'
import { cn } from '@/utilities/ui'

import Step1 from './steps/Step1'
import Step2 from './steps/Step2'
import Step3 from './steps/Step3'
import Step4 from './steps/Step4'
import './store'
import { updateContactInfo, type ContactStore } from './store'
import posthog from 'posthog-js'
import { ProfitCalculatorEvents } from './events'
import { calculateProfit } from './actions'
import { useLocale } from 'next-intl'

const stepSchemas = [
  formSchema.pick({
    activityType: true,
    physicalBranchesCount: true,
    hasCloudBrands: true,
    cloudBrandsCount: true,
  }),
  formSchema.pick({
    monthlySales: true,
    monthlyOrders: true,
    // deliverySalesPercentage: true,
    avgCommissionRate: true,
  }),
  formSchema.pick({
    foodCostPercentage: true,
    monthlyAdBudget: true,
    deliveryFeeBorne: true,
  }),
  formSchema.pick({ name: true, email: true, phone: true, businessName: true }),
]

const stepFields = stepSchemas.map((schema) => Object.keys(schema.shape)) as (keyof FormData)[][]

interface StepHeaderProps {
  title: string
  subtitle?: string
  className?: string
}

const StepHeader: React.FC<StepHeaderProps> = ({ title, subtitle, className }) => {
  return (
    <div className={cn('mb-6 flex flex-col items-center pt-space-7', className)}>
      <h2 className="mb-4 text-h2 font-semibold">{title}</h2>
      {subtitle && <p className="mb-4 text-center"> {subtitle}</p>}
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
  { category: 'البنية التشغيلية', title: 'ما نوع نشاطك الرئيسي؟', Component: Step1 },
  { category: 'بيانات التوصيل الأساسية', title: 'مبيعات التوصيل والعمولة', Component: Step2 },
  {
    category: 'التكاليف التشغيلية والترويجية',
    title: 'تكلفة المواد الغذائية والإعلانات',
    Component: Step3,
  },
  {
    category: 'بيانات التواصل وإرسال التقرير',
    title: 'باقي خطوة وحدة!',
    subtitle: 'شاركنا بياناتك، وراح نرسلك تقرير الربحية المخصّص لك',
    Component: Step4,
  },
]

const ProfitabilityCalculator: React.FC = () => {
  const [formStep, setFormStep] = useState<number>(0)
  const [isSubmitted, setIsSubmitted] = useState(false)
  const [isSubmitting, setIsSubmitting] = useState(false)
  const latestStateRef = useRef({ isSubmitted: false, formStep: 0 })
  const abandonSentRef = useRef(false)
  const startedSentRef = useRef(false)
  const { getState, actions } = useStateMachine({ actions: { updateContactInfo } })
  const contactDefaults = getState().contactInfo
  const locale = useLocale()

  const defaultValues: FormData = {
    activityType: 'hybridRestaurant',
    physicalBranchesCount: 1,
    hasCloudBrands: 'Yes',
    cloudBrandsCount: 1,
    monthlySales: '',
    monthlyOrders: '',
    // deliverySalesPercentage: 25,
    avgCommissionRate: 25,
    foodCostPercentage: 30,
    monthlyAdBudget: '',
    deliveryFeeBorne: 10,
    // monthlyDisputes: 0,
    ...contactDefaults,
  }

  const methods = useForm({
    defaultValues,
    resolver: zodResolver(formSchema),
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

  const hasCloudBrands = watch('hasCloudBrands')

  const totalFormSteps = 4

  // Keep latest state in refs for event handlers
  useEffect(() => {
    latestStateRef.current = { isSubmitted, formStep }
  }, [isSubmitted, formStep])

  const nextStep = async () => {
    // If user proceeds without changing any field, still count as started
    if (!startedSentRef.current) {
      startedSentRef.current = true
      const { formStep: step } = latestStateRef.current
      posthog.capture(ProfitCalculatorEvents.STARTED, {
        step_number: step + 1,
        Locale: locale,
      })
    }
    const isValid = await trigger(stepFields[formStep])
    if (isValid) {
      setFormStep((s) => Math.min(s + 1, totalFormSteps - 1))
      posthog.capture(ProfitCalculatorEvents.STEP_COMPLETED, { step_number: formStep + 1 })
    }
  }

  useEffect(() => {
    posthog.capture(ProfitCalculatorEvents.VIEWED, {
      locale,
    })
  }, [])

  // Capture started event on first user interaction (field change)
  useEffect(() => {
    const subscription = watch((_value, { name, type }) => {
      if (startedSentRef.current) return
      if (type === 'change') {
        startedSentRef.current = true
        const { formStep: step } = latestStateRef.current
        posthog.capture(ProfitCalculatorEvents.STARTED, {
          step_number: step + 1,
          first_field: name,
          locale,
        })
      }
    })
    return () => subscription.unsubscribe()
  }, [watch])

  // Capture abandoned event on unload/unmount if not submitted
  useEffect(() => {
    const sendAbandoned = () => {
      if (abandonSentRef.current) return
      const { isSubmitted: submitted, formStep: step } = latestStateRef.current
      if (!submitted) {
        abandonSentRef.current = true
        posthog.capture(ProfitCalculatorEvents.ABANDONED, {
          step_number: step + 1,
          locale,
        })
      }
    }
    window.addEventListener('beforeunload', sendAbandoned)
    return () => {
      // Fire on component unmount (e.g., route change) as well
      sendAbandoned()
      window.removeEventListener('beforeunload', sendAbandoned)
    }
  }, [])

  const prevStep = () => {
    setFormStep((prev) => Math.max(prev - 1, 0))
  }

  const onSubmit = async (data: FormData) => {
    setIsSubmitting(true)
    posthog.identify(data.email)
    actions.updateContactInfo({
      name: data.name,
      email: data.email,
      phone: data.phone,
      businessName: data.businessName || '',
    })
    try {
      const response = await calculateProfit(data)
      if (response.success) {
        setIsSubmitted(true)
      } else {
        // Handle server errors or invalid responses
        console.error('Submission failed:', response.message)
        // Optionally, set an error state to show a message to the user
      }
    } catch (error) {
      console.error('An error occurred during submission:', error)
      // Optionally, set an error state to show a message to the user
    } finally {
      setIsSubmitting(false)
    }
  }

  const onError = async (errors: any, e: any) => {
    console.error('An error occurred during submission:', errors)
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

  const Step = formSteps[formStep].Component

  return (
    <div className="relative flex w-full grow flex-col rounded-3xl border p-4">
      <div className="relative flex w-full">
        {formStep > 0 && (
          <Button
            type="button"
            onClick={prevStep}
            variant="ghost"
            size="sm"
            className="absolute top-1/2 -ms-3 w-9 -translate-y-1/2 gap-1 md:ms-0 md:w-fit"
          >
            <Icon icon="ri:arrow-right-line" height="none" className="size-4" />
            <span className="hidden font-normal md:block">الرجوع</span>
          </Button>
        )}
        <span className="mx-auto rounded-full border px-3 py-1 text-sm font-medium text-base-secondary">
          {formStep + 1}/{formSteps.length} -{' '}
          <span className="animate-in fade-in slide-in-from-right-4">
            {formSteps[formStep].category}
          </span>
        </span>
      </div>
      <FormProvider {...methods} key="form">
        <form
          onSubmit={(e) => {
            e.preventDefault()
          }}
        >
          <AnimatePresence mode="wait">
            <AnimatedStepWrapper key={formStep}>
              <StepHeader
                // title={formSteps[formStep].title}
                // subtitle={formSteps[formStep].subtitle}
                {...formSteps[formStep]}
              />
              <Step />
            </AnimatedStepWrapper>
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
              // if submit is handled by the form, the submit function is automatically called when button with type submit is mounted
              <Button
                type="button"
                onClick={handleSubmit(onSubmit, onError)}
                variant="primary"
                color="brand"
                size="lg"
                className="w-full"
                disabled={isSubmitting}
              >
                {isSubmitting ? (
                  <svg
                    data-loading={isSubmitting}
                    className="ms-2 size-4 animate-spin text-white duration-300 data-[loading=false]:hidden"
                    xmlns="http://www.w3.org/2000/svg"
                    fill="none"
                    viewBox="0 0 24 24"
                  >
                    <circle
                      className="opacity-25"
                      cx="12"
                      cy="12"
                      r="10"
                      stroke="currentColor"
                      strokeWidth="2"
                    ></circle>
                    <path
                      className="opacity-75"
                      fill="currentColor"
                      d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"
                    ></path>
                  </svg>
                ) : (
                  'احصل على تقريرك الآن'
                )}
              </Button>
            )}
          </div>
        </form>
      </FormProvider>
      <StepperBar
        steps={formSteps.map((s) => ({ title: s.category }))}
        currentStep={formStep + 1}
        key="stepperBar"
      />
      {/* <DevTool control={control} />  */}
    </div>
  )
}

export default ProfitabilityCalculator
