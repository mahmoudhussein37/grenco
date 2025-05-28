<script setup lang="ts">
import { computed, watch } from 'vue'
import { useI18n } from 'vue-i18n'
import { useRoute } from 'vue-router'
import TheHeader from './components/layout/TheHeader.vue'
import TheFooter from './components/layout/TheFooter.vue'

// Get i18n composable
const { locale } = useI18n()
const route = useRoute()

// Compute document direction based on current locale
const direction = computed(() => {
  return locale.value === 'ar' ? 'rtl' : 'ltr'
})

// Update document direction and language when locale changes
watch(
  () => locale.value,
  (newLocale) => {
    document.documentElement.setAttribute('dir', direction.value)
    document.documentElement.setAttribute('lang', newLocale)
    localStorage.setItem('locale', newLocale)
  },
  { immediate: true }
)

// Set page title based on route
watch(
  () => route.meta.title,
  (title) => {
    document.title = title ? `${title} | Grenco` : 'Grenco - Smart Plastic Recycling Solutions'
  },
  { immediate: true }
)
</script>

<template>
  <div class="app-container" :class="{ 'rtl': locale === 'ar' }">
    <TheHeader />
    <main>
      <router-view v-slot="{ Component }">
        <transition name="fade" mode="out-in">
          <component :is="Component" />
        </transition>
      </router-view>
    </main>
    <TheFooter />
  </div>
</template>

<style>
.app-container {
  display: flex;
  flex-direction: column;
  min-height: 100vh;
}

.app-container.rtl {
  font-family: 'Tajawal', sans-serif;
  text-align: right;
}

main {
  flex: 1;
}

.fade-enter-active,
.fade-leave-active {
  transition: opacity 0.3s ease;
}

.fade-enter-from,
.fade-leave-to {
  opacity: 0;
}
</style>