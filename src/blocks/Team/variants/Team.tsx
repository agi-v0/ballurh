'use client'
import React from 'react'
import { TeamBlock } from '@/payload-types'
import { motion } from 'motion/react'
import { containerVariants, itemsFling } from '@/utilities/motion'

import { cn } from '@/utilities/ui'

import { Card, CardContent } from '@/components/ui/card'
import { Icon } from '@iconify-icon/react'
import { Media } from '@/components/MediaResponsive'
import LinkedIn from '@/icons/linkedin'
import { Button } from '@/components/ui/button'
import Link from 'next/link'
import X from '@/icons/x'

export const Team: React.FC<TeamBlock> = ({ team }) => {
  return (
    <motion.div
      className="container grid grid-cols-1 gap-4 py-space-7 md:grid-cols-2"
      variants={containerVariants}
      initial="hidden"
      whileInView="visible"
      viewport={{ once: true, amount: 0.3 }}
    >
      {team?.map((member, index) => {
        return (
          <motion.div key={index} variants={itemsFling}>
            <Card className="h-full w-full grow rounded-3xl bg-blr-dark-green p-space-4 pt-(--text-large)">
              <CardContent className={cn('gap-md flex flex-col justify-start p-0')}>
                {member.name && (
                  <div data-theme="dark" className="flex flex-col items-center gap-2 text-center">
                    {member.image && (
                      <Media
                        resource={member.image}
                        fill
                        className="relative my-4 size-32 overflow-hidden rounded-full"
                        imgClassName="object-cover"
                      />
                    )}
                    <h3 className="text-large font-medium text-base-primary">{member.name}</h3>
                    <p className="text-main text-base-tertiary">{member.position}</p>
                    <p className="text-main text-base-tertiary">{member.bio}</p>
                    <div className="flex flex-row justify-center">
                      {member.social?.linkedin && (
                        <Button
                          variant="tertiary"
                          color="neutral"
                          size="icon"
                          className="bg-transparent hover:bg-transparent"
                          asChild
                        >
                          <Link href={member.social?.linkedin}>
                            <LinkedIn className="size-5 text-base-tertiary hover:text-base-primary" />
                          </Link>
                        </Button>
                      )}
                      {member.social?.x && (
                        <Button
                          variant="ghost"
                          color="neutral"
                          size="icon"
                          className="bg-transparent hover:bg-transparent"
                          asChild
                        >
                          <Link href={member.social?.x}>
                            <X className="size-5 text-base-tertiary hover:text-base-primary" />
                          </Link>
                        </Button>
                      )}
                    </div>
                  </div>
                )}
              </CardContent>
            </Card>
          </motion.div>
        )
      })}
    </motion.div>
  )
}
