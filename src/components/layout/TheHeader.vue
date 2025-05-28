<script setup lang="ts">
import { ref, computed } from 'vue'
import { useI18n } from 'vue-i18n'
import { useRoute } from 'vue-router'

const { t, locale } = useI18n()
const route = useRoute()

const mobileMenuOpen = ref(false)

const toggleLanguage = () => {
  locale.value = locale.value === 'en' ? 'ar' : 'en'
}

const toggleMobileMenu = () => {
  mobileMenuOpen.value = !mobileMenuOpen.value
}

const isActiveRoute = computed(() => {
  return (routeName: string) => route.name === routeName
})

const navLinks = computed(() => [
  { name: t('nav.home'), route: 'home' },
  { name: t('nav.about'), route: 'about' },
  { name: t('nav.products'), route: 'products' },
  { name: t('nav.solutions'), route: 'solutions' },
  { name: t('nav.news'), route: 'news' },
  { name: t('nav.contact'), route: 'contact' }
])
</script>

<template>
  <header class="header" :class="{ 'header-scrolled': true }">
    <div class="container header-container">
      <router-link to="/" class="logo">
        <img src="/src/assets/images/grencoLogo.png" alt="Grenco" width="150" />
      </router-link>
      
      <nav class="main-nav" :class="{ 'mobile-nav-open': mobileMenuOpen }">
        <ul class="nav-list">
          <li v-for="link in navLinks" :key="link.route" class="nav-item">
            <router-link
              :to="{ name: link.route }"
              class="nav-link"
              :class="{ 'active': isActiveRoute(link.route) }"
              @click="mobileMenuOpen = false"
            >
              {{ link.name }}
            </router-link>
          </li>
        </ul>
      </nav>
      
      <div class="header-actions">
        <button @click="toggleLanguage" class="lang-switcher" :aria-label="t('nav.switchLanguage')">
          {{ locale === 'en' ? 'العربية' : 'English' }}
        </button>
        
        <button class="mobile-menu-toggle" @click="toggleMobileMenu" :aria-expanded="mobileMenuOpen">
          <span class="sr-only">{{ t('nav.menu') }}</span>
          <span class="hamburger" :class="{ 'is-active': mobileMenuOpen }"></span>
        </button>
      </div>
    </div>
  </header>
</template>

<style scoped>
.header {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  z-index: var(--z-fixed);
  background-color: transparent;
  transition: background-color var(--transition-normal), box-shadow var(--transition-normal);
  padding: var(--space-3) 0;
}

.header-scrolled {
  background-color: rgba(255, 255, 255, 0.9);
  backdrop-filter: blur(10px);
  box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
}

.header-container {
  display: flex;
  align-items: center;
  justify-content: space-between;
}

.logo {
  z-index: var(--z-fixed);
}

.logo img {
  height: 40px;
  width: auto;
}

.main-nav {
  display: none;
}

.nav-list {
  display: flex;
  list-style: none;
  gap: var(--space-3);
}

.nav-link {
  display: block;
  padding: var(--space-2);
  color: var(--color-secondary);
  font-weight: 500;
  transition: color var(--transition-normal);
}

.nav-link:hover,
.nav-link.active {
  color: var(--color-primary);
}

.header-actions {
  display: flex;
  align-items: center;
  gap: var(--space-3);
}

.lang-switcher {
  background: none;
  border: 1px solid var(--color-primary);
  color: var(--color-primary);
  padding: 0.5rem 1rem;
  border-radius: var(--radius-md);
  font-size: var(--font-size-sm);
  cursor: pointer;
  transition: background-color var(--transition-normal), color var(--transition-normal);
}

.lang-switcher:hover {
  background-color: var(--color-primary);
  color: var(--color-white);
}

.mobile-menu-toggle {
  display: flex;
  align-items: center;
  justify-content: center;
  width: 44px;
  height: 44px;
  background: none;
  border: none;
  cursor: pointer;
  z-index: var(--z-fixed);
}

.hamburger {
  position: relative;
  width: 24px;
  height: 2px;
  background-color: var(--color-secondary);
  transition: transform var(--transition-normal), background-color var(--transition-normal);
}

.hamburger::before,
.hamburger::after {
  content: '';
  position: absolute;
  width: 24px;
  height: 2px;
  background-color: var(--color-secondary);
  transition: transform var(--transition-normal);
}

.hamburger::before {
  transform: translateY(-8px);
}

.hamburger::after {
  transform: translateY(8px);
}

.hamburger.is-active {
  background-color: transparent;
}

.hamburger.is-active::before {
  transform: rotate(45deg);
}

.hamburger.is-active::after {
  transform: rotate(-45deg);
}

.sr-only {
  position: absolute;
  width: 1px;
  height: 1px;
  padding: 0;
  margin: -1px;
  overflow: hidden;
  clip: rect(0, 0, 0, 0);
  white-space: nowrap;
  border-width: 0;
}

/* Mobile nav styles */
@media (max-width: 1023px) {
  .mobile-nav-open {
    display: block;
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100vh;
    background-color: var(--color-white);
    padding-top: 80px;
    padding-bottom: var(--space-5);
    overflow-y: auto;
  }
  
  .mobile-nav-open .nav-list {
    flex-direction: column;
    gap: var(--space-1);
    padding: 0 var(--space-3);
  }
  
  .mobile-nav-open .nav-link {
    font-size: var(--font-size-xl);
    padding: var(--space-3);
    border-bottom: 1px solid var(--color-gray-200);
  }
}

/* Desktop nav styles */
@media (min-width: 1024px) {
  .main-nav {
    display: block;
  }
  
  .mobile-menu-toggle {
    display: none;
  }
}

/* RTL adjustments */
:deep(.rtl) .header-actions {
  flex-direction: row-reverse;
}

:deep(.rtl) .nav-list {
  padding-right: 0;
}
</style>