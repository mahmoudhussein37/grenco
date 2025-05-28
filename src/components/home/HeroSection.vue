<script setup lang="ts">
import { useI18n } from 'vue-i18n'
import { useRouter } from 'vue-router'

const { t } = useI18n()
const router = useRouter()

const navigateToProducts = () => {
  router.push({ name: 'products' })
}

const navigateToContact = () => {
  router.push({ name: 'contact' })
}
</script>

<template>
  <section class="hero-section">
    <div class="hero-overlay"></div>
    <div class="container hero-container">
      <div class="hero-content" data-aos="fade-up">
        <h1 class="hero-title">{{ t('hero.title') }}</h1>
        <p class="hero-subtitle">{{ t('hero.subtitle') }}</p>
        <div class="hero-buttons">
          <button @click="navigateToProducts" class="btn btn-primary">
            {{ t('hero.cta') }}
            <i class="pi pi-arrow-right"></i>
          </button>
          <button @click="navigateToContact" class="btn btn-outline">
            {{ t('hero.contactUs') }}
          </button>
        </div>
      </div>
    </div>
  </section>
</template>

<style scoped>
.hero-section {
  position: relative;
  height: 90vh;
  min-height: 600px;
  background-image: url('https://images.pexels.com/photos/802221/pexels-photo-802221.jpeg');
  background-size: cover;
  background-position: center;
  display: flex;
  align-items: center;
  color: var(--color-white);
  overflow: hidden;
}

.hero-overlay {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.7));
  z-index: 1;
}

.hero-container {
  position: relative;
  z-index: 2;
  padding-top: var(--space-7);
}

.hero-content {
  max-width: 700px;
}

.hero-title {
  font-size: clamp(var(--font-size-3xl), 5vw, var(--font-size-5xl));
  margin-bottom: var(--space-3);
  line-height: 1.2;
  font-weight: 700;
}

.hero-subtitle {
  font-size: clamp(var(--font-size-lg), 2vw, var(--font-size-xl));
  margin-bottom: var(--space-5);
  max-width: 600px;
  opacity: 0.9;
}

.hero-buttons {
  display: flex;
  gap: var(--space-3);
  flex-wrap: wrap;
}

.btn {
  display: inline-flex;
  align-items: center;
  gap: var(--space-2);
}

@media (max-width: 768px) {
  .hero-section {
    height: 80vh;
  }
  
  .hero-content {
    text-align: center;
    margin: 0 auto;
  }
  
  .hero-buttons {
    justify-content: center;
  }
}
</style>