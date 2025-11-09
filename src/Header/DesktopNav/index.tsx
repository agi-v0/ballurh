'use client'

import * as React from 'react'

import { cn } from '@/utilities/ui'
import {
  NavigationMenu,
  NavigationMenuContent,
  NavigationMenuItem,
  NavigationMenuLink,
  NavigationMenuList,
  NavigationMenuTrigger,
  navigationMenuTriggerStyle,
} from '@/components/ui/navigation-menu'
import Image from 'next/image'
import { CMSLink } from '@/components/Link'
import type { BlogPost, Header as HeaderType, Page } from '@/payload-types'
import RichText from '@/components/RichText'
import { Icon } from '@iconify-icon/react'
import BallurhIcon from '@/components/ui/ballurh-icon'
import { LanguageToggleButton } from '../LanguageToggleButton'

interface DesktopNavProps extends Omit<HeaderType, 'id' | 'updatedAt' | 'createdAt'> {
  className?: string
  locale?: string
}

// Define the type for a single nav item directly based on HeaderType structure
type NavItem = NonNullable<NonNullable<HeaderType['tabs']>[number]['navItems']>[number]

type LinkType = {
  type?: ('reference' | 'custom') | null
  newTab?: boolean | null
  reference?:
    | ({
        relationTo: 'pages'
        value: string | Page
      } | null)
    | ({
        relationTo: 'blog-posts'
        value: string | BlogPost
      } | null)
  url?: string | null
  label: string
  description?: string | null
  /**
   * Select an icon from the Remix icon library. You can preview all available icons at https://remixicon.com/
   */
  icon?: string | null
}

// Explicitly define props for ListItem based on the NavItem structure
interface ListItemProps {
  className?: string
  style?: 'default' | 'featured' | 'list' | null
  defaultLink?: NavItem['defaultLink']
  featuredLink?: NavItem['featuredLink']
  listLinks?: NavItem['listLinks']
  id?: string | null
  [key: string]: any // Allow other props temporarily
}

export function DesktopNav({ tabs, cta, className, locale }: DesktopNavProps) {
  const validTabs = tabs || []
  return (
    <div id="parent" className={cn('', className)}>
      {/* Preload all navigation images */}
      {/* <NavigationImagePreloader tabs={tabs} /> */}

      <div className="w-full">
        <NavigationMenu>
          <NavigationMenuList className="space-x-0">
            {validTabs.map((tab, i) => {
              if (tab.enableDropdown) {
                return (
                  <NavigationMenuItem key={i + 'dropdown'}>
                    {tab.enableDirectLink && tab.link ? (
                      <NavigationMenuTrigger className="rounded-full">
                        <CMSLink
                          {...tab.link}
                          variant="inline"
                          className="group hover:text-base-primary hover:no-underline"
                        >
                          {tab.label}
                        </CMSLink>
                      </NavigationMenuTrigger>
                    ) : (
                      <NavigationMenuTrigger className="rounded-full">
                        {tab.label}
                      </NavigationMenuTrigger>
                    )}
                    <NavigationMenuContent>
                      <ul
                        className="olg:grid-cols-[repeat(var(--lgColumns),minmax(332px,1fr))] grid w-[400px] gap-4 p-4 md:w-full md:grid-cols-2 lg:w-(--content-width) lg:grid-cols-(--lgColumns)"
                        style={
                          {
                            '--lgColumns': `repeat(${tab.navItems?.length || 1}, minmax(0, 1fr))`,
                            '--content-width': `${(tab.navItems?.length || 1) * 332 + ((tab.navItems?.length || 1) - 1) * 16 + 32}px`,
                          } as React.CSSProperties
                        }
                      >
                        {
                          (tab.description || tab.descriptionLinks) && null
                          // <li className="row-span-3 md:col-span-1">
                          //   {' '}
                          //   {/* Adjust span based on grid */}
                          //   <NavigationMenuLink asChild>
                          //     <a
                          //       className="from-muted/50 to-muted flex h-full w-full flex-col justify-end rounded-md bg-linear-to-b p-6 no-underline outline-hidden select-none focus:shadow-md"
                          //       href={tab.descriptionLinks?.[0]?.link?.url || '#'}
                          //     >
                          //       <div className="mt-4 mb-2 text-lg font-medium">{tab.label}</div>
                          //       <p className="text-base-tertiary text-sm leading-tight">
                          //         {tab.description}
                          //       </p>
                          //     </a>
                          //   </NavigationMenuLink>
                          // </li>
                        }
                        {tab.navItems?.map((navItem) => (
                          <li key={navItem.id}>
                            {/* Use navItem.id as key */}
                            <ListItem {...navItem} />
                          </li>
                        ))}
                      </ul>
                    </NavigationMenuContent>
                  </NavigationMenuItem>
                )
              }
              if (tab.enableDirectLink && tab.link) {
                return (
                  <NavigationMenuItem key={i + 'directLink'}>
                    <NavigationMenuLink asChild>
                      <CMSLink
                        className={cn(navigationMenuTriggerStyle(), 'rounded-full')}
                        label={tab.label}
                        {...tab.link}
                        variant="inline"
                      />
                    </NavigationMenuLink>
                  </NavigationMenuItem>
                )
              }
              return null
            })}
          </NavigationMenuList>
        </NavigationMenu>
      </div>
      <div className="flex w-full max-w-54 flex-row items-center justify-end gap-1">
        <LanguageToggleButton locale={locale} className="px-3" />
        {cta &&
          cta.map((ctaItem, id) => (
            <CMSLink
              key={id}
              {...ctaItem.link}
              size="default"
              color={ctaItem.link.color ?? undefined}
              className="pointer-events-auto z-10 px-3 text-sm"
            />
          ))}
      </div>
    </div>
  )
}

const ListItem = React.forwardRef<HTMLAnchorElement | HTMLDivElement, ListItemProps>(
  ({ className, style, defaultLink, featuredLink, listLinks, ...props }, ref) => {
    let ListItem

    switch (style) {
      case 'featured':
        ListItem = (
          <div ref={ref as React.Ref<HTMLDivElement>} className={cn('p-3', className)} {...props}>
            {featuredLink?.tag && (
              <div className="mb-1 text-xs font-semibold text-base-tertiary">
                {featuredLink.tag}
              </div>
            )}

            <RichText data={featuredLink?.label} />
            <div className="mt-2 flex flex-col space-y-1">
              {featuredLink?.links?.map((subLink: LinkType, i: any) => (
                <CMSLink
                  key={i}
                  {...subLink}
                  className="text-sm text-base-tertiary hover:text-base-secondary"
                />
              ))}
            </div>
          </div>
        )
        break
      case 'list':
        ListItem = (
          <div ref={ref as React.Ref<HTMLDivElement>} className={cn('', className)} {...props}>
            {listLinks?.tag && (
              <div className="mb-1 px-4 text-xs font-normal text-base-tertiary">
                {listLinks.tag}
              </div>
            )}
            <div className="mt-1 flex flex-col gap-0">
              {listLinks?.links?.map((subLink: LinkType, i: any) => {
                return (
                  <CMSLink
                    key={i}
                    // {...subLink}
                    {...subLink}
                    icon={null}
                    label={null}
                    variant="inline"
                    className={cn(
                      navigationMenuTriggerStyle(),
                      'ease-in-out-quad relative h-fit w-full gap-4 rounded-2xl px-3 text-base transition-all duration-300 hover:px-4 [&_svg]:size-5',
                    )}
                  >
                    {subLink.icon && (
                      <div className="flex size-10 flex-none items-center justify-center rounded-md bg-background text-base-tertiary group-hover:bg-background-neutral group-hover:text-base-secondary">
                        {subLink.icon === 'marn-icon' ? (
                          <BallurhIcon className="" />
                        ) : (
                          <Icon icon={`ri:${subLink.icon}`} className="size-6" height="none" />
                        )}
                      </div>
                    )}

                    <div className="flex flex-1 flex-col justify-start gap-1">
                      {subLink.label}
                      {subLink.description && (
                        <p className="line-clamp-2 text-sm leading-snug font-normal whitespace-normal text-base-tertiary">
                          {subLink.description}
                        </p>
                      )}
                    </div>
                    <Icon
                      icon="tabler:caret-left-filled"
                      height="none"
                      className="size-4 shrink-0 translate-x-[4px] text-base-tertiary opacity-0 transition-all group-hover:translate-x-0 group-hover:text-base-tertiary group-hover:opacity-100"
                    />
                  </CMSLink>
                )
              })}
            </div>
          </div>
        )
        break
      case 'default':
      default:
        if (!defaultLink?.link) return null
        return (
          <NavigationMenuLink asChild>
            <CMSLink
              ref={ref as React.Ref<HTMLAnchorElement>}
              className={cn(
                'block space-y-1 rounded-md p-3 leading-none no-underline outline-hidden transition-colors select-none hover:bg-accent hover:text-accent-foreground focus:bg-accent focus:text-accent-foreground',
                className,
              )}
              {...defaultLink.link}
              {...props}
            >
              <div className="text-sm leading-none font-medium">{defaultLink.link.label}</div>
              {defaultLink.description && (
                <p className="line-clamp-2 text-sm leading-snug text-base-tertiary">
                  {defaultLink.description}
                </p>
              )}
            </CMSLink>
          </NavigationMenuLink>
        )
    }

    return ListItem
  },
)
ListItem.displayName = 'ListItem'
