<script setup lang="ts">
import { onMounted, watch } from "vue";
import { useI18n } from "vue-i18n";
import { useRouter } from "vue-router";
import { useNewsStore } from "../../stores/news";

const { t, locale } = useI18n();
const router = useRouter();
const newsStore = useNewsStore();

const formatDate = (dateString: string) => {
  const date = new Date(dateString);
  return new Intl.DateTimeFormat(locale.value === "ar" ? "ar-EG" : "en-US", {
    year: "numeric",
    month: "short",
    day: "numeric",
  }).format(date);
};

const viewAllNews = () => {
  router.push({ name: "news" });
};

// Fetch news when component mounts
onMounted(() => {
  newsStore.fetchNews(locale.value === "ar" ? "ar" : "en-US");
});

watch(
  () => locale.value,
  (newLocale) => {
    newsStore.fetchNews(newLocale === "ar" ? "ar" : "en-US");
  }
);
</script>

<template>
  <section class="section news-section">
    <div class="container">
      <h2 class="section-title" data-aos="fade-up">{{ t("news.title") }}</h2>
      <p
        class="section-subtitle text-center mb-5"
        data-aos="fade-up"
        data-aos-delay="100"
      >
        {{ t("news.subtitle") }}
      </p>

      <!-- Loading State -->
      <div v-if="newsStore.loading" class="loading-state">
        <i class="pi pi-spin pi-spinner" style="font-size: 2rem"></i>
        <p>Loading news...</p>
      </div>

      <!-- Error State -->
      <div v-else-if="newsStore.error" class="error-state">
        <i
          class="pi pi-exclamation-triangle"
          style="font-size: 2rem; color: var(--color-error)"
        ></i>
        <p>{{ newsStore.error }}</p>
        <button @click="() => newsStore.fetchNews()" class="btn btn-primary">
          Try Again
        </button>
      </div>

      <!-- News Grid -->
      <div v-else class="news-grid">
        <div
          v-for="article in newsStore.news.slice(0, 3)"
          :key="article.id"
          class="news-card"
          data-aos="fade-up"
        >
          <div class="news-image">
            <img :src="article.image.url" :alt="article.image.title" />
            <div class="news-category">{{ article.category }}</div>
          </div>
          <div class="news-content">
            <div class="news-date">{{ formatDate(article.date) }}</div>
            <h3 class="news-title">{{ article.title }}</h3>
            <p class="news-excerpt">{{ article.excerpt }}</p>
            <a href="#" class="news-link">{{ t("news.readMore") }}</a>
          </div>
        </div>
      </div>

      <!-- Empty State -->
      <div
        v-if="
          !newsStore.loading && !newsStore.error && newsStore.news.length === 0
        "
        class="empty-state"
      >
        <i class="pi pi-inbox" style="font-size: 2rem"></i>
        <p>No news articles available at the moment.</p>
      </div>

      <div class="text-center mt-5" data-aos="fade-up">
        <button @click="viewAllNews" class="btn btn-primary">
          {{ t("news.allNews") }}
          <i class="pi pi-arrow-right"></i>
        </button>
      </div>
    </div>
  </section>
</template>

<style scoped>
.news-section {
  padding: var(--space-7) 0;
  background-color: var(--color-gray-100);
}

.section-subtitle {
  max-width: 700px;
  margin-left: auto;
  margin-right: auto;
  color: var(--color-gray-600);
}

.news-grid {
  display: grid;
  grid-template-columns: 1fr;
  gap: var(--space-4);
  margin-bottom: var(--space-5);
}

.news-card {
  background-color: var(--color-white);
  border-radius: var(--radius-lg);
  overflow: hidden;
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.05);
  transition: transform var(--transition-normal) ease,
    box-shadow var(--transition-normal) ease;
}

.news-card:hover {
  transform: translateY(-5px);
  box-shadow: 0 12px 20px rgba(0, 0, 0, 0.1);
}

.news-image {
  height: 200px;
  overflow: hidden;
  position: relative;
}

.news-image img {
  width: 100%;
  height: 100%;
  object-fit: cover;
  transition: transform var(--transition-slow) ease;
}

.news-card:hover .news-image img {
  transform: scale(1.05);
}

.news-category {
  position: absolute;
  top: var(--space-3);
  left: var(--space-3);
  background-color: var(--color-primary);
  color: var(--color-white);
  padding: 0.25rem 0.75rem;
  border-radius: var(--radius-md);
  font-size: var(--font-size-sm);
  font-weight: 500;
  z-index: 1;
}

.news-content {
  padding: var(--space-4);
}

.news-date {
  font-size: var(--font-size-sm);
  color: var(--color-gray-500);
  margin-bottom: var(--space-2);
}

.news-title {
  font-size: var(--font-size-xl);
  margin-bottom: var(--space-2);
  color: var(--color-secondary);
  line-height: 1.3;
}

.news-excerpt {
  color: var(--color-gray-600);
  margin-bottom: var(--space-3);
  line-height: 1.5;
}

.news-link {
  font-weight: 500;
  display: inline-flex;
  align-items: center;
  gap: var(--space-1);
  transition: gap var(--transition-normal);
}

.news-link:hover {
  gap: var(--space-2);
}

.loading-state,
.error-state,
.empty-state {
  text-align: center;
  padding: var(--space-6);
  color: var(--color-gray-600);
}

.loading-state i,
.error-state i,
.empty-state i {
  margin-bottom: var(--space-3);
}

.error-state button {
  margin-top: var(--space-3);
}

@media (min-width: 768px) {
  .news-grid {
    grid-template-columns: repeat(2, 1fr);
  }
}

@media (min-width: 1024px) {
  .news-grid {
    grid-template-columns: repeat(3, 1fr);
  }
}

:deep(.rtl) .news-category {
  left: auto;
  right: var(--space-3);
}

:deep(.rtl) .news-link {
  flex-direction: row-reverse;
}
</style>