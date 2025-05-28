<script setup lang="ts">
import { ref, onMounted } from "vue";
import { useI18n } from "vue-i18n";

const { t } = useI18n();

const stats = ref([
  {
    label: t("stats.machines"),
    value: 0,
    target: 150,
    icon: "pi-cog",
    suffix: "+",
  },
  {
    label: t("stats.plasticType"),
    value: 0,
    target: 12,
    icon: "pi-filter",
    suffix: "",
  },
  {
    label: t("stats.customers"),
    value: 0,
    target: 75,
    icon: "pi-users",
    suffix: "+",
  },
  {
    label: t("stats.countries"),
    value: 0,
    target: 10,
    icon: "pi-globe",
    suffix: "",
  },
]);

const startCounting = () => {
  stats.value.forEach((stat) => {
    let startValue = 0;
    const duration = 2000;
    const steps = 60;
    const increment = stat.target / steps;
    const stepTime = duration / steps;

    const counter = setInterval(() => {
      startValue += increment;
      if (startValue >= stat.target) {
        stat.value = stat.target;
        clearInterval(counter);
      } else {
        stat.value = Math.floor(startValue);
      }
    }, stepTime);
  });
};

// In a production app, we'd use Intersection Observer for this
onMounted(() => {
  setTimeout(startCounting, 500);
});
</script>

<template>
  <section class="stats-section">
    <div class="container">
      <div class="stats-grid" data-aos="fade-up">
        <div
          v-for="(stat, index) in stats"
          :key="index"
          class="stat-item"
          :data-aos-delay="index * 100"
        >
          <div class="stat-icon">
            <i :class="`pi ${stat.icon}`"></i>
          </div>
          <div class="stat-value">
            <span class="counter">{{ stat.value }}</span
            ><span class="suffix">{{ stat.suffix }}</span>
          </div>
          <div class="stat-label">{{ stat.label }}</div>
        </div>
      </div>
    </div>
  </section>
</template>

<style scoped>
.stats-section {
  padding: var(--space-6) 0;
  background-color: var(--color-primary);
  color: var(--color-white);
  position: relative;
  overflow: hidden;
}

.stats-section::before {
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

.stats-grid {
  display: grid;
  grid-template-columns: repeat(2, 1fr);
  gap: var(--space-4);
  position: relative;
}

.stat-item {
  text-align: center;
  padding: var(--space-4);
  background-color: rgba(255, 255, 255, 0.1);
  border-radius: var(--radius-lg);
  transition: transform var(--transition-normal) ease;
}

.stat-item:hover {
  transform: translateY(-10px);
  background-color: rgba(255, 255, 255, 0.2);
}

.stat-icon {
  font-size: 2.5rem;
  margin-bottom: var(--space-2);
  opacity: 0.8;
}

.stat-value {
  font-size: 3rem;
  font-weight: 700;
  line-height: 1.2;
  margin-bottom: var(--space-2);
}

.suffix {
  font-size: 2rem;
}

.stat-label {
  font-size: var(--font-size-lg);
  opacity: 0.9;
}

@media (min-width: 768px) {
  .stats-grid {
    grid-template-columns: repeat(4, 1fr);
  }
}
</style>