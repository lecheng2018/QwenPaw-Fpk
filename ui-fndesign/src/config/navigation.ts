import type { NavigationMenuItem } from '@nuxt/ui'

export interface NavItem {
  label: string
  icon?: string
  to?: string
  children?: NavItem[]
  badge?: string | number
  target?: string
}

export interface NavigationConfig {
  desktop: NavigationMenuItem[][]
  mobile: NavigationMenuItem[]
}

export const navigationConfig: NavigationConfig = {
  desktop: [
    [
      {
        label: '控制台',
        icon: 'i-lucide-home',
        to: '/',
      },
      {
        label: '运行日志',
        icon: 'i-lucide-file-text',
        to: '/logs',
      },
      {
        label: '关于',
        icon: 'i-lucide-info',
        to: '/about',
      },
    ]
  ],
  mobile: [
    {
      label: '控制台',
      icon: 'i-lucide-home',
      to: '/',
    },
    {
      label: '日志',
      icon: 'i-lucide-file-text',
      to: '/logs',
    },
    {
      label: '关于',
      icon: 'i-lucide-info',
      to: '/about',
    },
  ]
}