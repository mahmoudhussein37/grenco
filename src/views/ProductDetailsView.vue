<script setup lang="ts">
import { ref, computed, onMounted } from 'vue'
import { useI18n } from 'vue-i18n'
import { useRoute, useRouter } from 'vue-router'
import { useProductsStore } from '../stores/products'

const { t } = useI18n()
const route = useRoute()
const router = useRouter()
const productsStore = useProductsStore()

const product = computed(() => {
  const id = Number(route.params.id)
  return productsStore.getProductById(id)
})

const activeImage = ref('')

onMounted(() => {
  if (product.value && product.value.gallery) {
    activeImage.value = product.value.gallery[0]
  }
})

const setActiveImage = (image: string) => {
  activeImage.value = image
}

const requestQuote = () => {
  if (product.value) {
    router.push({ 
      name: 'contact',
      query: { 
        subject: `Quote request for ${product.value.name}` 
      } 
    })
  }
}

// If product not found, redirect to products page
if (!product.value) {
  router.push({ name: 'products' })
}
</script>

<template>
  <div v-if="product" class="product-details-page">
    <div class="page-header">
      <div class="container">
        <h1 class="page-title" data-aos="fade-up">{{ product.name }}</h1>
      </div>
    </div>
    
    <section class="section product-details-section">
      <div class="container">
        <div class="product-details-grid">
          <div class="product-gallery" data-aos="fade-right">
            <div class="main-image">
              <img :src="activeImage || product.image" :alt="product.name" />
            </div>
            
            <div v-if="product.gallery" class="gallery-thumbs">
              <div 
                v-for="(image, index) in product.gallery" 
                :key="index"
                class="thumb"
                :class="{ active: activeImage === image }"
                @click="setActiveImage(image)"
              >
                <img :src="image" :alt="`${product.name} - Image ${index + 1}`" />
              </div>
            </div>
          </div>
          
          <div class="product-info" data-aos="fade-left">
            <p class="product-description">{{ product.fullDescription || product.description }}</p>
            
            <div class="product-features-full">
              <h3>{{ t('products.featureTitle') }}</h3>
              <ul>
                <li v-for="(feature, index) in product.features" :key="index">
                  <i class="pi pi-check"></i> {{ feature }}
                </li>
              </ul>
            </div>
            
            <div class="product-specs">
              <h3>{{ t('products.specs') }}</h3>
              <div class="specs-grid">
                <div v-for="(value, key) in product.specs" :key="key" class="spec-item">
                  <div class="spec-label">{{ key }}</div>
                  <div class="spec-value">{{ value }}</div>
                </div>
              </div>
            </div>
            
            <div class="product-plastics-full">
              <h3>{{ t('products.plasticTypes') }}</h3>
              <div class="plastic-tags">
                <span 
                  v-for="(type, index) in product.plasticTypes" 
                  :key="index"
                  class="plastic-tag"
                >
                  {{ type }}
                </span>
              </div>
            </div>
            
            <div class="product-customization">
              <h3>{{ t('products.customization') }}</h3>
              <p>Our machines can be customized to fit your specific requirements. Contact us for details on customization options including size adjustments, specialized components, and integration with existing systems.</p>
            </div>
            
            <div class="product-actions">
              <button @click="requestQuote" class="btn btn-primary">
                {{ t('products.requestQuote') }}
              </button>
              <router-link :to="{ name: 'products' }" class="btn btn-outline">
                <i class="pi pi-arrow-left"></i>
                {{ t('products.title') }}
              </router-link>
            </div>
          </div>
        </div>
      </div>
    </section>
  </div>
</template>

<style scoped>
.page-header {
  background-color: var(--color-primary);
  color: var(--color-white);
  padding: var(--space-7) 0 var(--space-5);
  text-align: center;
  position: relative;
  margin-top: 80px;
}

.page-header::before {
  content: '';
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-image: url('https://images.pexels.com/photos/802221/pexels-photo-802221.jpeg');
  background-size: cover;
  background-position: center;
  opacity: 0.1;
}

.page-title {
  position: relative;
  font-size: var(--font-size-4xl);
  margin-bottom: var(--space-2);
}

.product-details-section {
  padding: var(--space-6) 0;
  background-color: var(--color-white);
}

.product-details-grid {
  display: grid;
  grid-template-columns: 1fr;
  gap: var(--space-5);
}

.product-gallery {
  display: flex;
  flex-direction: column;
  gap: var(--space-3);
}

.main-image {
  width: 100%;
  height: 400px;
  overflow: hidden;
  border-radius: var(--radius-lg);
  box-shadow: 0 10px 20px rgba(0,0,0,0.1);
}

.main-image img {
  width: 100%;
  height: 100%;
  object-fit: cover;
  transition: transform var(--transition-slow) ease;
}

.main-image:hover img {
  transform: scale(1.05);
}

.gallery-thumbs {
  display: flex;
  gap: var(--space-2);
  flex-wrap: wrap;
}

.thumb {
  width: 80px;
  height: 80px;
  border-radius: var(--radius-md);
  overflow: hidden;
  cursor: pointer;
  transition: transform var(--transition-normal) ease, box-shadow var(--transition-normal) ease;
}

.thumb img {
  width: 100%;
  height: 100%;
  object-fit: cover;
}

.thumb:hover {
  transform: translateY(-3px);
  box-shadow: 0 5px 10px rgba(0,0,0,0.1);
}

.thumb.active {
  box-shadow: 0 0 0 3px var(--color-primary);
}

.product-description {
  font-size: var(--font-size-lg);
  margin-bottom: var(--space-4);
  color: var(--color-gray-700);
  line-height: 1.7;
}

.product-features-full,
.product-specs,
.product-plastics-full,
.product-customization {
  margin-bottom: var(--space-5);
}

.product-features-full h3,
.product-specs h3,
.product-plastics-full h3,
.product-customization h3 {
  font-size: var(--font-size-xl);
  margin-bottom: var(--space-3);
  color: var(--color-secondary);
  position: relative;
  padding-bottom: var(--space-2);
}

.product-features-full h3::after,
.product-specs h3::after,
.product-plastics-full h3::after,
.product-customization h3::after {
  content: '';
  position: absolute;
  bottom: 0;
  left: 0;
  width: 50px;
  height: 3px;
  background-color: var(--color-primary);
}

.product-features-full ul {
  list-style: none;
  padding: 0;
}

.product-features-full li {
  display: flex;
  align-items: flex-start;
  margin-bottom: var(--space-2);
  color: var(--color-gray-700);
}

.product-features-full li i {
  color: var(--color-primary);
  margin-right: var(--space-2);
  margin-top: 0.25rem;
}

.specs-grid {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
  gap: var(--space-3);
}

.spec-item {
  background-color: var(--color-gray-100);
  padding: var(--space-3);
  border-radius: var(--radius-md);
  transition: transform var(--transition-normal) ease;
}

.spec-item:hover {
  transform: translateY(-3px);
  background-color: var(--color-primary-light);
}

.spec-label {
  font-size: var(--font-size-sm);
  color: var(--color-gray-600);
  margin-bottom: var(--space-1);
  text-transform: capitalize;
}

.spec-value {
  font-size: var(--font-size-lg);
  font-weight: 600;
  color: var(--color-secondary);
}

.plastic-tags {
  display: flex;
  flex-wrap: wrap;
  gap: var(--space-2);
}

.plastic-tag {
  background-color: var(--color-secondary);
  color: var(--color-white);
  padding: 0.5rem 1rem;
  border-radius: var(--radius-full);
  font-size: var(--font-size-base);
}

.product-customization p {
  color: var(--color-gray-700);
  line-height: 1.6;
}

.product-actions {
  display: flex;
  flex-direction: column;
  gap: var(--space-3);
  margin-top: var(--space-5);
}

@media (min-width: 640px) {
  .product-actions {
    flex-direction: row;
  }
}

@media (min-width: 1024px) {
  .product-details-grid {
    grid-template-columns: 1fr 1fr;
  }
}

:deep(.rtl) .product-features-full li i {
  margin-right: 0;
  margin-left: var(--space-2);
}

:deep(.rtl) .product-features-full h3::after,
:deep(.rtl) .product-specs h3::after,
:deep(.rtl) .product-plastics-full h3::after,
:deep(.rtl) .product-customization h3::after {
  left: auto;
  right: 0;
}
</style>