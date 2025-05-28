<script setup lang="ts">
import { useI18n } from 'vue-i18n'
import { useRouter } from 'vue-router'

const { t } = useI18n()
const router = useRouter()

const goHome = () => {
  router.push({ name: 'home' })
}
</script>

<template>
  <div class="not-found">
    <div class="container">
      <div class="not-found-content">
        <h1 class="not-found-title">404</h1>
        <h2 class="not-found-subtitle">Page Not Found</h2>
        <p class="not-found-text">The page you are looking for might have been removed, had its name changed, or is temporarily unavailable.</p>
        <button @click="goHome" class="btn btn-primary not-found-button">
          Go Home
          <i class="pi pi-home"></i>
        </button>
      </div>
    </div>
  </div>
</template>

<style scoped>
.not-found {
  display: flex;
  align-items: center;
  justify-content: center;
  min-height: 100vh;
  padding: var(--space-5);
  background-color: var(--color-gray-100);
  margin-top: -80px; /* To offset the header height */
}

.not-found-content {
  text-align: center;
  max-width: 600px;
  padding: var(--space-5);
  background-color: var(--color-white);
  border-radius: var(--radius-lg);
  box-shadow: 0 10px 30px rgba(0,0,0,0.05);
}

.not-found-title {
  font-size: 8rem;
  font-weight: 700;
  color: var(--color-primary);
  line-height: 1;
  margin-bottom: var(--space-2);
}

.not-found-subtitle {
  font-size: var(--font-size-3xl);
  margin-bottom: var(--space-3);
  color: var(--color-secondary);
}

.not-found-text {
  font-size: var(--font-size-lg);
  margin-bottom: var(--space-4);
  color: var(--color-gray-600);
}

.not-found-button {
  font-size: var(--font-size-lg);
  padding: 0.75rem 2rem;
  display: inline-flex;
  align-items: center;
  gap: var(--space-2);
}
</style>