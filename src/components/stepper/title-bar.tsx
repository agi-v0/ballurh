import {
  Stepper,
  StepperIndicator,
  StepperItem,
  StepperNav,
  StepperTitle,
  StepperTrigger,
} from '@/components/ui/stepper'

interface StepperBarProps {
  steps: { title: string }[]
  currentStep: number
}

export default function StepperBar({ steps, currentStep }: StepperBarProps) {
  return (
    <Stepper value={currentStep} className="mx-auto w-32 space-y-8">
      <StepperNav className="gap-2">
        {steps.map((step, index) => {
          return (
            <StepperItem key={index} step={index + 1} className="relative flex-1 items-start">
              <StepperTrigger className="flex grow flex-col items-start justify-center gap-3.5">
                <StepperIndicator className="h-1.5 w-full rounded-full bg-border data-[state=active]:bg-primary"></StepperIndicator>
                {/* <div className="flex flex-col items-start gap-1">
                  <StepperTitle className="text-start font-semibold group-data-[state=inactive]/step:text-muted-foreground">
                    {step.title}
                  </StepperTitle>
                </div> */}
              </StepperTrigger>
            </StepperItem>
          )
        })}
      </StepperNav>
    </Stepper>
  )
}
