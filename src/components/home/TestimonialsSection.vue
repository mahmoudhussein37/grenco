<script setup lang="ts">
import { ref } from 'vue'
import { useI18n } from 'vue-i18n'

const { t } = useI18n()

const testimonials = ref([
  {
    id: 1,
    name: 'Ahmed Hassan',
    company: 'EcoPlast Manufacturing',
    position: 'Operations Manager',
    quote: 'The Grenco recycling machines have transformed our production process. We\'re now recycling 95% of our plastic waste, which has reduced our raw material costs by 30%.',
    image: 'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg'
  },
  {
    id: 2,
    name: 'Sarah Johnson',
    company: 'Green Future Industries',
    position: 'CEO',
    quote: 'As a small business, we needed an affordable recycling solution that wouldn\'t take up too much space. Grenco\'s compact machines were perfect, and the smart features help us maximize efficiency.',
    image: 'https://images.pexels.com/photos/774909/pexels-photo-774909.jpeg'
  },
  {
    id: 3,
    name: 'Mohammad Al-Farsi',
    company: 'Sustainable Solutions Co.',
    position: 'Production Director',
    quote: 'The customization options Grenco offered allowed us to create a recycling system that perfectly integrates with our existing production line. The ROI was achieved in just 8 months.',
    image: 'https://images.pexels.com/photos/1222271/pexels-photo-1222271.jpeg'
  }
])

const activeTestimonial = ref(0)

const nextTestimonial = () => {
  activeTestimonial.value = (activeTestimonial.value + 1) % testimonials.value.length
}

const prevTestimonial = () => {
  activeTestimonial.value = (activeTestimonial.value - 1 + testimonials.value.length) % testimonials.value.length
}
</script>

<template>
  <section class="section testimonials-section">
    <div class="container">
      <h2 class="section-title" data-aos="fade-up">{{ t('testimonials.title') }}</h2>
      <p class="section-subtitle text-center mb-5" data-aos="fade-up" data-aos-delay="100">
        {{ t('testimonials.subtitle') }}
      </p>
      
      <div class="testimonials-slider" data-aos="fade-up" data-aos-delay="200">
        <div class="testimonial-navigation">
          <button @click="prevTestimonial" class="nav-button prev">
            <i class="pi pi-chevron-left"></i>
          </button>
          <button @click="nextTestimonial" class="nav-button next">
            <i class="pi pi-chevron-right"></i>
          </button>
        </div>
        
        <div class="testimonials-track" :style="{ transform: `translateX(-${activeTestimonial * 100}%)` }">
          <div 
            v-for="testimonial in testimonials" 
            :key="testimonial.id"
            class="testimonial-item"
          >
            <div class="testimonial-content">
              <div class="quote-icon">
                <i class="pi pi-quote-right"></i>
              </div>
              <p class="testimonial-quote">{{ testimonial.quote }}</p>
              <div class="testimonial-author">
                <img :src="testimonial.image" :alt="testimonial.name" class="author-image" />
                <div class="author-info">
                  <h4 class="author-name">{{ testimonial.name }}</h4>
                  <p class="author-position">{{ testimonial.position }}, {{ testimonial.company }}</p>
                </div>
              </div>
            </div>
          </div>
        </div>
        
        <div class="testimonial-dots">
          <button 
            v-for="(_, index) in testimonials" 
            :key="index"
            class="dot"
            :class="{ active: index === activeTestimonial }"
            @click="activeTestimonial = index"
          ></button>
        </div>
      </div>
    </div>
  </section>
</template>

<style scoped>
.testimonials-section {
  padding: var(--space-7) 0;
  background-color: var(--color-white);
}

.section-subtitle {
  max-width: 700px;
  margin-left: auto;
  margin-right: auto;
  color: var(--color-gray-600);
}

.testimonials-slider {
  max-width: 900px;
  margin: 0 auto;
  position: relative;
  overflow: hidden;
  padding: var(--space-4) 0;
}

.testimonial-navigation {
  position: absolute;
  top: 50%;
  left: 0;
  right: 0;
  transform: translateY(-50%);
  display: flex;
  justify-content: space-between;
  z-index: 10;
  pointer-events: none;
}

.nav-button {
  width: 50px;
  height: 50px;
  border-radius: 50%;
  background-color: var(--color-white);
  border: none;
  box-shadow: 0 2px 10px rgba(0,0,0,0.1);
  display: flex;
  align-items: center;
  justify-content: center;
  cursor: pointer;
  transition: background-color var(--transition-normal), transform var(--transition-normal);
  pointer-events: auto;
}

.nav-button:hover {
  background-color: var(--color-primary);
  color: var(--color-white);
  transform: scale(1.1);
}

.testimonials-track {
  display: flex;
  transition: transform 0.5s ease;
}

.testimonial-item {
  min-width: 100%;
  padding: 0 var(--space-3);
}

.testimonial-content {
  background-color: var(--color-white);
  border-radius: var(--radius-lg);
  padding: var(--space-5);
  box-shadow: 0 8px 30px rgba(0,0,0,0.1);
  position: relative;
}

.quote-icon {
  position: absolute;
  top: -20px;
  left: var(--space-5);
  width: 50px;
  height: 50px;
  background-color: var(--color-primary);
  border-radius: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
  color: var(--color-white);
  font-size: 1.5rem;
}

.testimonial-quote {
  font-size: var(--font-size-lg);
  line-height: 1.6;
  margin-bottom: var(--space-4);
  font-style: italic;
  color: var(--color-secondary);
}

.testimonial-author {
  display: flex;
  align-items: center;
  gap: var(--space-3);
}

.author-image {
  width: 60px;
  height: 60px;
  border-radius: 50%;
  object-fit: cover;
  border: 3px solid var(--color-primary);
}

.author-name {
  font-size: var(--font-size-lg);
  margin-bottom: var(--space-1);
  color: var(--color-secondary);
}

.author-position {
  font-size: var(--font-size-sm);
  color: var(--color-gray-600);
}

.testimonial-dots {
  display: flex;
  justify-content: center;
  gap: var(--space-2);
  margin-top: var(--space-4);
}

.dot {
  width: 12px;
  height: 12px;
  border-radius: 50%;
  background-color: var(--color-gray-300);
  border: none;
  cursor: pointer;
  transition: background-color var(--transition-normal), transform var(--transition-normal);
}

.dot.active {
  background-color: var(--color-primary);
  transform: scale(1.3);
}

:deep(.rtl) .quote-icon {
  left: auto;
  right: var(--space-5);
}
</style>