<script setup lang="ts">
import { useI18n } from 'vue-i18n'
import { useRouter } from 'vue-router'

const { t } = useI18n()
const router = useRouter()

const navigateToAbout = () => {
  router.push({ name: 'about' })
}
</script>

<template>
  <section class="section about-preview">
    <div class="container">
      <div class="about-grid">
        <div class="about-content" data-aos="fade-right">
          <h2 class="section-title">{{ t('about.title') }}</h2>
          <p class="about-intro">{{ t('about.intro') }}</p>
          
          <div class="about-values">
            <div class="value-item">
              <i class="pi pi-globe"></i>
              <h3>{{ t('about.mission.title') }}</h3>
              <p>{{ t('about.mission.content') }}</p>
            </div>
            
            <div class="value-item">
              <i class="pi pi-eye"></i>
              <h3>{{ t('about.vision.title') }}</h3>
              <p>{{ t('about.vision.content') }}</p>
            </div>
          </div>
          
          <button @click="navigateToAbout" class="btn btn-primary">
            {{ t('products.learnMore') }}
            <i class="pi pi-arrow-right"></i>
          </button>
        </div>
        
        <div class="about-image" data-aos="fade-left">
          <img src="/src/assets/images/grenco.jpg" alt="Grenco recycling machines" class="image-rounded" />
        </div>
      </div>
    </div>
  </section>
</template>

<style scoped>
.about-preview {
  padding: var(--space-7) 0;
  background-color: var(--color-gray-100);
}

.about-grid {
  display: grid;
  grid-template-columns: 1fr;
  gap: var(--space-5);
}

.about-content {
  display: flex;
  flex-direction: column;
  justify-content: center;
}

.about-intro {
  font-size: var(--font-size-lg);
  margin-bottom: var(--space-4);
  color: var(--color-gray-700);
}

.about-values {
  display: grid;
  grid-template-columns: 1fr;
  gap: var(--space-4);
  margin-bottom: var(--space-4);
}

.value-item {
  background-color: var(--color-white);
  padding: var(--space-4);
  border-radius: var(--radius-lg);
  box-shadow: 0 4px 6px rgba(0,0,0,0.05);
  transition: transform var(--transition-normal) ease;
}

.value-item:hover {
  transform: translateY(-5px);
}

.value-item i {
  font-size: 2rem;
  color: var(--color-primary);
  margin-bottom: var(--space-2);
}

.value-item h3 {
  font-size: var(--font-size-xl);
  margin-bottom: var(--space-2);
}

.value-item p {
  color: var(--color-gray-600);
}

.about-image {
  overflow: hidden;
  border-radius: var(--radius-lg);
  box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.1), 0 10px 10px -5px rgba(0, 0, 0, 0.04);
}

.image-rounded {
  width: 100%;
  height: 100%;
  object-fit: cover;
  transition: transform var(--transition-slow) ease;
}

.about-image:hover .image-rounded {
  transform: scale(1.05);
}

@media (min-width: 1024px) {
  .about-grid {
    grid-template-columns: 1fr 1fr;
  }
  
  .about-values {
    grid-template-columns: repeat(2, 1fr);
  }
}
</style>