import { createApp } from 'vue'
import { createPinia } from 'pinia'
import { createI18n } from 'vue-i18n'
import PrimeVue from 'primevue/config'
import AOS from 'aos'
import 'aos/dist/aos.css'
import 'primevue/resources/themes/lara-light-green/theme.css'
import 'primevue/resources/primevue.min.css'
import 'primeicons/primeicons.css'
import './style.css'
import App from './App.vue'
import router from './router'
import en from './locales/en.json'
import ar from './locales/ar.json'

// Initialize AOS animation library
AOS.init({
  duration: 800,
  easing: 'ease-out-cubic',
  once: true
})

// Configure i18n
const i18n = createI18n({
  legacy: false,
  locale: localStorage.getItem('locale') || 'en',
  fallbackLocale: 'en',
  messages: { en, ar }
})

// Create and mount app
const app = createApp(App)

app.use(createPinia())
app.use(router)
app.use(i18n)
app.use(PrimeVue, {
  ripple: true,
  inputStyle: 'filled'
})

app.mount('#app')