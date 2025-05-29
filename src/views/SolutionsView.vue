<script setup lang="ts">
import { ref } from "vue";
import { useI18n } from "vue-i18n";

const { t } = useI18n();

const solutions = ref([
  {
    id: 1,
    title: t("solutions.costSaving.title"),
    content: t("solutions.costSaving.content"),
    icon: "pi-dollar",
    benefits: [
      "Reduce raw material costs by up to 40%",
      "Lower waste disposal expenses",
      "Quick return on investment",
      "Minimize production downtime",
    ],
    image: "assets/images/products/machine3.jpeg",
  },
  {
    id: 2,
    title: t("solutions.environmental.title"),
    content: t("solutions.environmental.content"),
    icon: "pi-globe",
    benefits: [
      "Reduce carbon footprint",
      "Meet sustainability goals",
      "Minimize landfill waste",
      "Support circular economy",
    ],
    image: "https://images.pexels.com/photos/802221/pexels-photo-802221.jpeg",
  },
  {
    id: 3,
    title: t("solutions.comparison.title"),
    content: t("solutions.comparison.content"),
    icon: "pi-chart-bar",
    benefits: [
      "Smart monitoring systems",
      "Higher processing efficiency",
      "Reduced energy consumption",
      "Advanced sorting capabilities",
    ],
    image: "assets/images/products/machine2.jpeg",
  },
]);

const features = ref([
  {
    icon: "pi-cog",
    title: "Customizable Solutions",
    description: "Tailor our machines to your specific needs and requirements",
  },
  {
    icon: "pi-mobile",
    title: "Smart Controls",
    description: "Monitor and control your recycling operations from anywhere",
  },
  {
    icon: "pi-chart-line",
    title: "Data Analytics",
    description: "Make informed decisions with real-time performance data",
  },
  {
    icon: "pi-users",
    title: "Expert Support",
    description: "24/7 technical support and maintenance services",
  },
]);
</script>

<template>
  <div class="solutions-page">
    <div class="page-header">
      <div class="container">
        <h1 class="page-title" data-aos="fade-up">
          {{ t("solutions.title") }}
        </h1>
        <p class="page-subtitle" data-aos="fade-up" data-aos-delay="100">
          {{ t("solutions.subtitle") }}
        </p>
      </div>
    </div>

    <section class="section solutions-section">
      <div class="container">
        <div class="solutions-grid">
          <div
            v-for="solution in solutions"
            :key="solution.id"
            class="solution-card"
            data-aos="fade-up"
            :data-aos-delay="solution.id * 100"
          >
            <div class="solution-image">
              <img :src="solution.image" :alt="solution.title" />
              <div class="solution-icon">
                <i :class="`pi ${solution.icon}`"></i>
              </div>
            </div>

            <div class="solution-content">
              <h2 class="solution-title">{{ solution.title }}</h2>
              <p class="solution-description">{{ solution.content }}</p>

              <div class="benefits-list">
                <h3>Key Benefits:</h3>
                <ul>
                  <li
                    v-for="(benefit, index) in solution.benefits"
                    :key="index"
                  >
                    <i class="pi pi-check"></i>
                    <span>{{ benefit }}</span>
                  </li>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <section class="section features-section">
      <div class="container">
        <h2 class="section-title" data-aos="fade-up">
          Why Choose Our Solutions?
        </h2>

        <div class="features-grid">
          <div
            v-for="(feature, index) in features"
            :key="index"
            class="feature-card"
            data-aos="fade-up"
            :data-aos-delay="index * 100"
          >
            <div class="feature-icon">
              <i :class="`pi ${feature.icon}`"></i>
            </div>
            <h3 class="feature-title">{{ feature.title }}</h3>
            <p class="feature-description">{{ feature.description }}</p>
          </div>
        </div>
      </div>
    </section>

    <section class="section cta-section">
      <div class="container">
        <div class="cta-content" data-aos="fade-up">
          <h2>Ready to Transform Your Recycling Process?</h2>
          <p>
            Contact us today to discuss your specific requirements and find the
            perfect solution.
          </p>
          <router-link to="/contact" class="btn btn-primary">
            {{ t("hero.contactUs") }}
            <i class="pi pi-arrow-right"></i>
          </router-link>
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
  content: "";
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-image: url("https://images.pexels.com/photos/802221/pexels-photo-802221.jpeg");
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

.solutions-section {
  padding: var(--space-6) 0;
  background-color: var(--color-white);
}

.solutions-grid {
  display: grid;
  grid-template-columns: 1fr;
  gap: var(--space-5);
}

.solution-card {
  background-color: var(--color-white);
  border-radius: var(--radius-lg);
  overflow: hidden;
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.05);
  transition: transform var(--transition-normal) ease,
    box-shadow var(--transition-normal) ease;
}

.solution-card:hover {
  transform: translateY(-5px);
  box-shadow: 0 12px 20px rgba(0, 0, 0, 0.1);
}

.solution-image {
  height: 300px;
  position: relative;
  overflow: hidden;
}

.solution-image img {
  width: 100%;
  height: 100%;
  object-fit: cover;
  transition: transform var(--transition-slow) ease;
}

.solution-card:hover .solution-image img {
  transform: scale(1.05);
}

.solution-icon {
  position: absolute;
  bottom: var(--space-4);
  right: var(--space-4);
  width: 60px;
  height: 60px;
  background-color: var(--color-primary);
  border-radius: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
  color: var(--color-white);
  font-size: 1.5rem;
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

.solution-content {
  padding: var(--space-4);
}

.solution-title {
  font-size: var(--font-size-2xl);
  margin-bottom: var(--space-2);
  color: var(--color-secondary);
}

.solution-description {
  color: var(--color-gray-600);
  margin-bottom: var(--space-4);
  line-height: 1.6;
}

.benefits-list h3 {
  font-size: var(--font-size-lg);
  margin-bottom: var(--space-2);
  color: var(--color-secondary);
}

.benefits-list ul {
  list-style: none;
  padding: 0;
}

.benefits-list li {
  display: flex;
  align-items: center;
  margin-bottom: var(--space-2);
  color: var(--color-gray-700);
}

.benefits-list li i {
  color: var(--color-primary);
  margin-right: var(--space-2);
}

.features-section {
  padding: var(--space-7) 0;
  background-color: var(--color-gray-100);
}

.features-grid {
  display: grid;
  grid-template-columns: 1fr;
  gap: var(--space-4);
  margin-top: var(--space-5);
}

.feature-card {
  background-color: var(--color-white);
  padding: var(--space-4);
  border-radius: var(--radius-lg);
  text-align: center;
  transition: transform var(--transition-normal) ease;
}

.feature-card:hover {
  transform: translateY(-5px);
}

.feature-icon {
  width: 60px;
  height: 60px;
  background-color: var(--color-primary);
  border-radius: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
  margin: 0 auto var(--space-3);
  color: var(--color-white);
  font-size: 1.5rem;
}

.feature-title {
  font-size: var(--font-size-xl);
  margin-bottom: var(--space-2);
  color: var(--color-secondary);
}

.feature-description {
  color: var(--color-gray-600);
}

.cta-section {
  padding: var(--space-6) 0;
  background-color: var(--color-primary);
  color: var(--color-white);
  text-align: center;
}

.cta-content {
  max-width: 700px;
  margin: 0 auto;
}

.cta-content h2 {
  font-size: var(--font-size-3xl);
  margin-bottom: var(--space-3);
}

.cta-content p {
  font-size: var(--font-size-lg);
  margin-bottom: var(--space-4);
  opacity: 0.9;
}

.cta-content .btn {
  font-size: var(--font-size-lg);
  padding: 0.75rem 2rem;
  background-color: var(--color-white);
  color: var(--color-primary);
}

.cta-content .btn:hover {
  background-color: var(--color-gray-100);
}

@media (min-width: 768px) {
  .solutions-grid {
    grid-template-columns: repeat(2, 1fr);
  }

  .features-grid {
    grid-template-columns: repeat(2, 1fr);
  }
}

@media (min-width: 1024px) {
  .solutions-grid {
    grid-template-columns: repeat(3, 1fr);
  }

  .features-grid {
    grid-template-columns: repeat(4, 1fr);
  }
}

:deep(.rtl) .benefits-list li i {
  margin-right: 0;
  margin-left: var(--space-2);
}

:deep(.rtl) .solution-icon {
  right: auto;
  left: var(--space-4);
}

:deep(.rtl) .cta-content .btn i {
  transform: scaleX(-1);
}
</style>