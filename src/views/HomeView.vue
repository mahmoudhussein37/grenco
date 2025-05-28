<script setup lang="ts">
import { ref } from "vue";
import { useI18n } from "vue-i18n";
import HeroSection from "../components/home/HeroSection.vue";
import AboutPreview from "../components/home/AboutPreview.vue";
import ProductsPreview from "../components/home/ProductsPreview.vue";
import FeatureHighlights from "../components/home/FeatureHighlights.vue";
import TestimonialsSection from "../components/home/TestimonialsSection.vue";
import StatsCounter from "../components/home/StatsCounter.vue";
import NewsPreview from "../components/home/NewsPreview.vue";
import ContactCta from "../components/home/ContactCta.vue";

const { t } = useI18n();
</script>

<template>
  <div class="home">
    <HeroSection />
    <AboutPreview />
    <ProductsPreview />
    <FeatureHighlights />
    <TestimonialsSection />
    <StatsCounter />
    <NewsPreview />
    <ContactCta />
  </div>
</template>