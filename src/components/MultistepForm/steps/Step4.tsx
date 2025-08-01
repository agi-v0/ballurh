import React from 'react'
import { Controller, useFormContext } from 'react-hook-form'
import { Input } from '@/components/ui/input'
import { Label } from '@/components/ui/label'

const Step4 = () => {
  const {
    control,
    formState: { errors },
  } = useFormContext()

  return (
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
            {errors.name.message as string}
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
            {errors.email.message as string}
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
              placeholder="أدخل رقم جوالك"
              {...field}
              autoComplete="tel"
            />
          )}
        />
        {errors.phone && (
          <p className="mt-1 animate-shake-enter text-xs text-orange-600/80">
            {errors.phone.message as string}
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
  )
}

export default Step4
