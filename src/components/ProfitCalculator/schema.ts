import { z } from 'zod'

const step1Schema = z
  .object({
    activityType: z.string({ message: 'يرجى اختيار نوع النشاط' }),
    physicalBranchesCount: z.coerce.number().min(1, 'يجب أن تكون القيمة 1 على الأقل'),
    hasCloudBrands: z.enum(['Yes', 'No'], { message: 'يرجى الاختيار' }),
    cloudBrandsCount: z.coerce.number().optional(),
  })
  .superRefine((data, ctx) => {
    if (data.hasCloudBrands === 'Yes' && !data.cloudBrandsCount) {
      ctx.addIssue({
        path: ['cloudBrandsCount'],
        code: 'custom',
        message: 'أدخل عدد العلامات',
      })
    }
  })

const step2Schema = z.object({
  annualSales: z.string().min(1, { message: 'هذا الحقل مطلوب' }),
  monthlyOrders: z.string().min(1, { message: 'هذا الحقل مطلوب' }),
  deliverySalesPercentage: z.coerce
    .number()
    .min(1, { message: 'هذا الحقل مطلوب' })
    .transform((val) => val / 100),
  avgCommissionRate: z.coerce
    .number()
    .min(1, { message: 'هذا الحقل مطلوب' })
    .transform((val) => val / 100),
})

const step3Schema = z.object({
  foodCostPercentage: z.coerce
    .number()
    .min(1, { message: 'هذا الحقل مطلوب' })
    .transform((val) => val / 100),
  monthlyAdBudget: z.string().min(1, { message: 'هذا الحقل مطلوب' }),
  deliveryFeeBorne: z.coerce.number().min(0, { message: 'هذا الحقل مطلوب' }),
  monthlyDisputes: z.coerce.number().nonnegative().optional().default(0),
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

export const formSchema = step1Schema
  .extend(step2Schema.shape)
  .extend(step3Schema.shape)
  .extend(step4Schema.shape)

export type FormData = z.infer<typeof formSchema>
