<script setup lang="ts">
import { ref, computed } from 'vue'
import { useI18n } from 'vue-i18n'
import { useProductsStore } from '../stores/products'
import { useRouter } from 'vue-router'

const { t } = useI18n()
const productsStore = useProductsStore()
const router = useRouter()

const filteredProducts = computed(() => {
  return productsStore.products
})

const viewProduct = (id: number) => {
  router.push({ name: 'product-details', params: { id } })
}

const requestQuote = (id: number) => {
  router.push({ 
    name: 'contact',
    query: { 
      subject: `Quote request for product #${id}` 
    } 
  })
}
</script>

<template>
  <div class="products-page">
    <div class="page-header">
      <div class="container">
        <h1 class="page-title" data-aos="fade-up">{{ t('products.title') }}</h1>
        <p class="page-subtitle" data-aos="fade-up" data-aos-delay="100">{{ t('products.subtitle') }}</p>
      </div>
    </div>
    
    <section class="section products-section">
      <div class="container">
        <div class="products-grid">
          <div 
            v-for="product in filteredProducts" 
            :key="product.id"
            class="product-card"
            data-aos="fade-up"
            :data-aos-delay="product.id * 100"
          >
            <div class="product-image">
              <img :src="product.image" :alt="product.name" />
            </div>
            <div class="product-content">
              <h3 class="product-title">{{ product.name }}</h3>
              <p class="product-description">{{ product.description }}</p>
              
              <div class="product-plastics">
                <h4>{{ t('products.plasticTypes') }}</h4>
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
              
              <div class="product-features">
                <h4>{{ t('products.featureTitle') }}</h4>
                <ul>
                  <li v-for="(feature, index) in product.features.slice(0, 3)" :key="index">
                    <i class="pi pi-check"></i> {{ feature }}
                  </li>
                </ul>
                <span v-if="product.features.length > 3" class="more-features">
                  +{{ product.features.length - 3 }} more features
                </span>
              </div>
              
              <div class="product-actions">
                <button @click="viewProduct(product.id)" class="btn btn-primary">
                  {{ t('products.learnMore') }}
                </button>
                <button @click="requestQuote(product.id)" class="btn btn-outline">
                  {{ t('products.requestQuote') }}
                </button>
              </div>
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

.page-subtitle {
  position: relative;
  font-size: var(--font-size-lg);
  max-width: 600px;
  margin: 0 auto;
  opacity: 0.9;
}

.products-section {
  padding: var(--space-6) 0;
  background-color: var(--color-white);
}

.products-grid {
  display: grid;
  grid-template-columns: 1fr;
  gap: var(--space-5);
}

.product-card {
  background-color: var(--color-white);
  border-radius: var(--radius-lg);
  overflow: hidden;
  box-shadow: 0 4px 6px rgba(0,0,0,0.05);
  transition: transform var(--transition-normal) ease, box-shadow var(--transition-normal) ease;
  display: flex;
  flex-direction: column;
}

.product-card:hover {
  transform: translateY(-5px);
  box-shadow: 0 12px 20px rgba(0,0,0,0.1);
}

.product-image {
  height: 250px;
  overflow: hidden;
}

.product-image img {
  width: 100%;
  height: 100%;
  object-fit: cover;
  transition: transform var(--transition-slow) ease;
}

.product-card:hover .product-image img {
  transform: scale(1.05);
}

.product-content {
  padding: var(--space-4);
  flex: 1;
  display: flex;
  flex-direction: column;
}

.product-title {
  font-size: var(--font-size-xl);
  margin-bottom: var(--space-2);
  color: var(--color-secondary);
}

.product-description {
  color: var(--color-gray-600);
  margin-bottom: var(--space-3);
}

.product-plastics,
.product-features {
  margin-bottom: var(--space-3);
}

.product-plastics h4,
.product-features h4 {
  font-size: var(--font-size-base);
  margin-bottom: var(--space-2);
  color: var(--color-secondary);
}

.plastic-tags {
  display: flex;
  flex-wrap: wrap;
  gap: var(--space-1);
}

.plastic-tag {
  background-color: var(--color-gray-100);
  color: var(--color-secondary);
  padding: 0.25rem 0.75rem;
  border-radius: var(--radius-full);
  font-size: var(--font-size-sm);
}

.product-features ul {
  list-style: none;
  padding: 0;
}

.product-features li {
  display: flex;
  align-items: flex-start;
  margin-bottom: var(--space-1);
  color: var(--color-gray-700);
}

.product-features li i {
  color: var(--color-primary);
  margin-right: var(--space-2);
  margin-top: 0.25rem;
}

.more-features {
  font-size: var(--font-size-sm);
  color: var(--color-gray-500);
  font-style: italic;
}

.product-actions {
  display: flex;
  flex-direction: column;
  gap: var(--space-2);
  margin-top: auto;
  padding-top: var(--space-3);
}

@media (min-width: 640px) {
  .product-actions {
    flex-direction: row;
  }
}

@media (min-width: 768px) {
  .products-grid {
    grid-template-columns: repeat(2, 1fr);
  }
}

@media (min-width: 1024px) {
  .products-grid {
    grid-template-columns: repeat(3, 1fr);
  }
}

:deep(.rtl) .product-features li i {
  margin-right: 0;
  margin-left: var(--space-2);
}
</style>