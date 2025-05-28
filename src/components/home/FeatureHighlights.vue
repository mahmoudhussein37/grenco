<script setup lang="ts">
import { ref } from "vue";

const features = ref([
  {
    icon: "pi-bolt",
    title: "Energy Efficient",
    description:
      "Reduce power consumption with smart energy management systems",
    color: "#00c853",
  },
  {
    icon: "pi-cog",
    title: "Customizable",
    description: "Configure machines to match your specific requirements",
    color: "#1e88e5",
  },
  {
    icon: "pi-mobile",
    title: "Smart Controls",
    description: "Monitor and control operations remotely via mobile app",
    color: "#7b1fa2",
  },
  {
    icon: "pi-chart-line",
    title: "Data Analytics",
    description: "Track performance, yield, and maintenance needs in real-time",
    color: "#ff6d00",
  },
  {
    icon: "pi-filter",
    title: "Multi-material",
    description: "Process various plastic types with adaptable settings",
    color: "#2962ff",
  },
  {
    icon: "pi-check-circle",
    title: "Quality Assurance",
    description: "Ensure consistent output quality with integrated testing",
    color: "#00bcd4",
  },
]);
</script>

<template>
  <section class="section features-section">
    <div class="container">
      <div class="features-grid">
        <div
          v-for="(feature, index) in features"
          :key="index"
          class="feature-card"
          data-aos="zoom-in"
          :data-aos-delay="index * 100"
        >
          <div class="feature-icon" :style="{ backgroundColor: feature.color }">
            <i :class="`pi ${feature.icon}`"></i>
          </div>
          <h3 class="feature-title">{{ feature.title }}</h3>
          <p class="feature-description">{{ feature.description }}</p>
        </div>
      </div>
    </div>
  </section>
</template>

<style scoped>
.features-section {
  padding: var(--space-7) 0;
  background-color: var(--color-gray-100);
  position: relative;
  overflow: hidden;
}

.features-section::before {
  content: "";
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-image: url("https://images.pexels.com/photos/802221/pexels-photo-802221.jpeg");
  background-size: cover;
  background-position: center;
  opacity: 0.05;
}

.features-grid {
  display: grid;
  grid-template-columns: 1fr;
  gap: var(--space-4);
  position: relative;
}

.feature-card {
  background-color: var(--color-white);
  padding: var(--space-4);
  border-radius: var(--radius-lg);
  box-shadow: 0 4px 10px rgba(0, 0, 0, 0.05);
  transition: transform var(--transition-normal) ease;
  text-align: center;
}

.feature-card:hover {
  transform: translateY(-10px);
}

.feature-icon {
  width: 70px;
  height: 70px;
  border-radius: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
  margin: 0 auto var(--space-3);
  color: var(--color-white);
}

.feature-icon i {
  font-size: 2rem;
}

.feature-title {
  font-size: var(--font-size-xl);
  margin-bottom: var(--space-2);
  color: var(--color-secondary);
}

.feature-description {
  color: var(--color-gray-600);
  line-height: 1.5;
}

@media (min-width: 640px) {
  .features-grid {
    grid-template-columns: repeat(2, 1fr);
  }
}

@media (min-width: 1024px) {
  .features-grid {
    grid-template-columns: repeat(3, 1fr);
  }
}
</style>