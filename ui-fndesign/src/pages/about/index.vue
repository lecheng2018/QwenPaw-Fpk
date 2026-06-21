<script setup lang="ts">
import { computed, watch, ref } from 'vue'
import { useTheme } from '@/composables/useTheme'

const { themeMode, getSystemTheme } = useTheme()

const systemTheme = ref(getSystemTheme())

const isDark = computed(() => {
  return themeMode.value === 'system' ? systemTheme.value === 'dark' : themeMode.value === 'dark'
})

watch(isDark, (newValue) => {
  console.log('主题变化:', newValue ? '深色' : '浅色')
})

if (typeof window !== 'undefined' && window.matchMedia) {
  const mediaQuery = window.matchMedia('(prefers-color-scheme: dark)')
  mediaQuery.addEventListener('change', () => {
    systemTheme.value = getSystemTheme()
    console.log('系统主题变化:', systemTheme.value)
  })
}
</script>

<template>
  <div class="mx-auto space-y-8">
    <div class="text-center space-y-4">
      <div class="w-28 h-28 mx-auto">
        <img
          src="/favicon.png"
          alt="Logo"
          class="w-full h-full object-contain"
        >
      </div>
      <h1 class="text-3xl font-bold text-[var(--ui-text)]">
        关于 QwenPaw
      </h1>
      <p class="text-[var(--ui-text-muted)] mx-auto max-w-2xl">
        QwenPaw 是一款个人助理型 AI 应用，部署在你自己的环境中，保护你的数据隐私。
      </p>
    </div>

    <div class="grid gap-6 md:grid-cols-2 items-stretch">
      <UCard class="h-full rounded-2xl">
        <template #header>
          <div class="flex items-center gap-2">
            <UIcon
              name="i-lucide-user"
              class="w-5 h-5 text-primary"
            />
            <h2 class="font-semibold text-lg">
              关于作者
            </h2>
          </div>
        </template>

        <div class="h-full flex flex-col gap-4">
          <div class="space-y-2">
            <p class="text-[var(--ui-text)]">
              本项目由 <span class="font-bold text-primary">尘墨成</span> 开发与维护。
              <span class="text-sm text-[var(--ui-text-muted)]">
                致力于为 fnOS 用户提供更多优质的原生应用体验。
              </span>
            </p>
          </div>

          <div class="mt-auto">
            <UButton
              to="https://www.dustinky.com"
              target="_blank"
              color="primary"
              variant="soft"
              icon="i-lucide-globe"
              block
            >
              访问官网 www.dustinky.com
            </UButton>
          </div>
        </div>
      </UCard>

      <UCard class="h-full rounded-2xl">
        <template #header>
          <div class="flex items-center gap-2">
            <UIcon
              name="i-lucide-book-open"
              class="w-5 h-5 text-primary"
            />
            <h2 class="font-semibold text-lg">
              fnOS 原生应用适配文档库
            </h2>
          </div>
        </template>

        <div class="h-full flex flex-col gap-4">
          <p class="text-sm text-[var(--ui-text-muted)]">
            这里是开发者尘墨成维护的 fnOS 原生应用适配文档库。我们致力于为 fnOS 用户提供体验更佳、集成度更高的原生应用解决方案。
          </p>

          <div class="mt-auto">
            <UButton
              to="https://fnosp.dustinky.com/"
              target="_blank"
              color="primary"
              variant="outline"
              icon="i-lucide-external-link"
              block
            >
              打开文档库 fnosp.dustinky.com
            </UButton>
          </div>
        </div>
      </UCard>
    </div>
  </div>
</template>
