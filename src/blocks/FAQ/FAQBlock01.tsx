import { cn } from '@/utilities/ui'
import {
  Accordion,
  AccordionContent,
  AccordionItem,
  AccordionTrigger,
} from '@/components/ui/accordion'
import { Icon } from '@iconify-icon/react/dist/iconify.mjs'
import RichText from '@/components/RichText'
import { Faq, FaqBlock } from '@/payload-types'
import { TypedLocale } from 'payload'

type FaqBlockProps = FaqBlock & {
  locale: TypedLocale
  className?: string
}

export const FAQBlock01: React.FC<FaqBlockProps> = async (props) => {
  const { faqs, className } = props

  return (
    <div className="bg-background">
      <div className={cn('container', className)}>
        {faqs && (
          <div className="mx-auto grid w-full grid-cols-1">
            <Accordion type="single" collapsible className="space-y-2">
              {faqs
                .filter((faq) => typeof faq === 'object')
                .map((faq: Faq, idx) => (
                  <AccordionItem
                    value={'item-' + idx}
                    key={idx}
                    className="group relative rounded-3xl bg-background-neutral py-4 ps-4 pe-4"
                  >
                    <AccordionTrigger className="relative flex flex-row justify-between pe-6 text-start text-(length:--text-main) font-medium text-base-secondary data-[state=open]:text-base-primary ltr:[&[data-state=open]_iconify-icon]:-rotate-90 rtl:[&[data-state=open]_iconify-icon]:rotate-90">
                      {faq.question}
                      <Icon
                        icon="ri:arrow-down-s-line"
                        className="absolute end-0 size-6 text-base-tertiary transition-transform duration-150 ease-in-out"
                        height="none"
                      />
                    </AccordionTrigger>
                    <AccordionContent className="pe-6 pt-2 pb-0">
                      {faq.answer && (
                        <RichText
                          className="text-start font-normal [&_p]:text-(length:--text-main) [&_p]:text-base-tertiary"
                          data={faq.answer}
                          enableGutter={false}
                        />
                      )}
                    </AccordionContent>
                  </AccordionItem>
                ))}
            </Accordion>
          </div>
        )}
      </div>
    </div>
  )
}
