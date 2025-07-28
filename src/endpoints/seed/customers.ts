import type { Payload, PayloadRequest } from 'payload'
import type { Media } from '@/payload-types'

export interface CustomersResult {
  customers: any[]
  slugToIdMap: Record<string, string>
}

export async function seedCustomers({
  payload,
  req,
  image1,
  logo,
  imageSquare,
  image169,
  solutionsSlugToIdMap,
  integrationsSlugToIdMap,
}: {
  payload: Payload
  req?: PayloadRequest
  image1: Media
  logo: Media
  imageSquare: Media
  image169: Media
  solutionsSlugToIdMap?: Record<string, string>
  integrationsSlugToIdMap?: Record<string, string>
}): Promise<CustomersResult> {
  payload.logger.info('— Seeding customers (testimonials & case studies)...')

  const customerCount = 10
  const industries = ['restaurants', 'retail', 'services'] as const

  const customersDataArray = Array.from({ length: customerCount }).map((_, i) => {
    const industry = industries[i % industries.length]
    const companyNameAr = `شركة ${i + 1}`

    return {
      title: `Customer ${i + 1} - Success Story`,
      slug: `customer-${i + 1}`,

      // Testimonial tab data
      testimonial: {
        quote: {
          root: {
            type: 'root',
            children: [
              {
                type: 'paragraph',
                version: 1,
                children: [
                  {
                    type: 'text',
                    text: `مرن غيّر طريقة عملنا بالكامل. النظام سهل الاستخدام وساعدنا نزيد مبيعاتنا بشكل ملحوظ. أنصح كل صاحب مشروع يجرب مرن.`,
                    format: '',
                    style: '',
                  },
                ],
                direction: 'rtl',
                format: '',
                indent: 0,
              },
            ],
            direction: 'rtl',
            format: '',
            indent: 0,
            version: 1,
          },
        },
        featuredImage: image1.id,
        featuredSolutions: [],
        featuredIntegrations: [],
        stats: [
          {
            label: 'زيادة في المبيعات',
            value: `${25 + i * 5}%`,
            indicator: 'increase' as const,
          },
          {
            label: 'توفير في الوقت',
            value: `${30 + i * 3} دقيقة`,
            indicator: 'increase' as const,
          },
          {
            label: 'رضا العملاء',
            value: `${85 + i}%`,
            indicator: 'increase' as const,
          },
        ],
        company: {
          companyName: companyNameAr,
          companyLogo: logo.id,
          link: {
            type: 'custom' as const,
            url: `https://example-${i + 1}.com`,
            newTab: true,
            label: `موقع ${companyNameAr}`,
          },
          industry,
          foundingYear: 2015 + (i % 8),
          location: i % 2 === 0 ? 'الرياض' : 'جدة',
          branches: `${Math.floor(Math.random() * 10) + 1}+`,
        },
        authorInfo: {
          name: `أحمد محمد ${i + 1}`,
          title: i % 3 === 0 ? 'المدير العام' : i % 3 === 1 ? 'مدير المبيعات' : 'صاحب المشروع',
          avatar: imageSquare.id,
        },
      },

      caseStudy: {
        // Case study tab data
        caseStudytitle: `كيف حققت ${companyNameAr} نموًا بنسبة ${25 + i * 5}% مع مرن`,
        summary: `قصة نجاح ${companyNameAr} في تحسين عملياتها وزيادة أرباحها باستخدام حلول مرن المتكاملة.`,
        content: {
          root: {
            type: 'root',
            children: [
              {
                type: 'heading',
                version: 1,
                children: [
                  {
                    type: 'text',
                    text: 'التحدي',
                    format: 'bold',
                  },
                ],
                tag: 'h2',
              },
              {
                type: 'paragraph',
                version: 1,
                children: [
                  {
                    type: 'text',
                    text: `كانت ${companyNameAr} تواجه تحديات في إدارة المبيعات والمخزون.`,
                  },
                ],
                direction: 'rtl',
              },
            ],
            direction: 'rtl',
            format: '',
            indent: 0,
            version: 1,
          },
        },
        layout: [],
      },

      // Common fields
      categories: [],
      publishedAt: new Date().toISOString(),
      enableCaseStudy: true,
      _status: 'published',
    }
  })

  // Create customers in parallel
  const customerPromises = customersDataArray.map(async (customerData) => {
    try {
      return await payload.create({
        collection: 'customers',
        depth: 0,
        data: customerData as any, // Use any to bypass strict typing for seeding
        // req,
      })
    } catch (error) {
      payload.logger.error(
        `Failed to create customer ${customerData.title}: ${error instanceof Error ? error.message : String(error)}`,
      )
      return null
    }
  })

  const customerResults = await Promise.all(customerPromises)
  const customers = customerResults.filter(Boolean)

  // Create slug to ID map
  const slugToIdMap: Record<string, string> = {}
  customers.forEach((customer) => {
    if (customer?.slug) {
      slugToIdMap[customer.slug] = customer.id
    }
  })

  payload.logger.info(`✓ Seeded ${customers.length} customers`)

  return { customers, slugToIdMap }
}
