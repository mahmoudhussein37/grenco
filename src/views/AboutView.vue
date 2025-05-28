<script setup lang="ts">
import { ref } from 'vue'
import { useI18n } from 'vue-i18n'

const { t } = useI18n()

const company = ref({
  founded: 2020,
  employees: 25,
  machines: 150,
  countries: 10
})

const team = ref([
  {
    name: "Rabeh Yaser",
    position: "CEO & Founder",
    image: "/src/assets/images/team/Rabeh.jpeg"
  },
  {
    name: "Mahmoud Hussin",
    position: "DevOps Developer",
    image: "/src/assets/images/team/Mahmoud.JPG"
  },
  {
    name: "Aliaa Ahmed",
    position: "Data Analyst",
    image: "https://images.pexels.com/photos/774909/pexels-photo-774909.jpeg"
  },
  {
    name: "Yasmen Essam",
    position: "HR Manager",
    image: "https://images.pexels.com/photos/774909/pexels-photo-774909.jpeg"
  },
  // {
  //   name: "Ahmed Farrag",
  //   position: "Application Developer",
  //   image: "https://images.pexels.com/photos/1222271/pexels-photo-1222271.jpeg"
  // }
].filter(member => member && member.name && member.position && member.image))

const values = ref([
  {
    title: t('about.values.sustainability'),
    icon: 'pi-globe',
    description: 'We are committed to environmental sustainability and reducing plastic waste through innovative recycling solutions.'
  },
  {
    title: t('about.values.innovation'),
    icon: 'pi-bolt',
    description: 'We continually innovate our recycling technology to improve efficiency and adapt to new challenges.'
  },
  {
    title: t('about.values.quality'),
    icon: 'pi-check-circle',
    description: 'We maintain the highest standards of quality in our machines and customer service.'
  },
  {
    title: t('about.values.integrity'),
    icon: 'pi-shield',
    description: 'We operate with transparency, honesty, and ethical business practices in all our relationships.'
  }
])
</script>

<template>
  <div class="about-page">
    <div class="page-header">
      <div class="container">
        <h1 class="page-title" data-aos="fade-up">{{ t('about.title') }}</h1>
      </div>
    </div>
    
    <section class="section about-mission">
      <div class="container">
        <div class="mission-grid">
          <div class="mission-content" data-aos="fade-right">
            <h2>{{ t('about.mission.title') }}</h2>
            <p class="mission-text">{{ t('about.mission.content') }}</p>
            
            <h2 class="mt-5">{{ t('about.vision.title') }}</h2>
            <p class="mission-text">{{ t('about.vision.content') }}</p>
            
            <div class="company-stats">
              <div class="stat-item">
                <div class="stat-value">{{ company.founded }}</div>
                <div class="stat-label">Founded</div>
              </div>
              <div class="stat-item">
                <div class="stat-value">{{ company.employees }}+</div>
                <div class="stat-label">Employees</div>
              </div>
              <div class="stat-item">
                <div class="stat-value">{{ company.machines }}+</div>
                <div class="stat-label">Machines</div>
              </div>
              <div class="stat-item">
                <div class="stat-value">{{ company.countries }}</div>
                <div class="stat-label">Countries</div>
              </div>
            </div>
          </div>
          
          <div class="mission-image" data-aos="fade-left">
            <img src="https://images.pexels.com/photos/802221/pexels-photo-802221.jpeg" alt="Grenco mission" class="image-rounded" />
          </div>
        </div>
      </div>
    </section>
    
    <section class="section values-section">
      <div class="container">
        <h2 class="section-title" data-aos="fade-up">{{ t('about.values.title') }}</h2>
        
        <div class="values-grid">
          <div 
            v-for="(value, index) in values" 
            :key="index"
            class="value-card"
            data-aos="fade-up"
            :data-aos-delay="index * 100"
          >
            <div class="value-icon">
              <i :class="`pi ${value.icon}`"></i>
            </div>
            <h3 class="value-title">{{ value.title }}</h3>
            <p class="value-description">{{ value.description }}</p>
          </div>
        </div>
      </div>
    </section>
    
    <section class="section team-section">
      <div class="container">
        <h2 class="section-title" data-aos="fade-up">Our Team</h2>
        
        <div class="team-grid">
          <div 
            v-for="(member, index) in team" 
            :key="index"
            class="team-card"
            data-aos="fade-up"
            :data-aos-delay="index * 100"
          >
            <div class="team-image">
              <img v-if="member" :src="member.image" :alt="member.name" />
            </div>
            <div class="team-info">
              <h3 class="team-name">{{ member.name }}</h3>
              <p class="team-position">{{ member.position }}</p>
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

.about-mission {
  padding: var(--space-6) 0;
  background-color: var(--color-white);
}

.mission-grid {
  display: grid;
  grid-template-columns: 1fr;
  gap: var(--space-5);
}

.mission-content {
  display: flex;
  flex-direction: column;
  justify-content: center;
}

.mission-text {
  font-size: var(--font-size-lg);
  margin-bottom: var(--space-4);
  color: var(--color-gray-700);
  line-height: 1.7;
}

.company-stats {
  display: flex;
  flex-wrap: wrap;
  gap: var(--space-4);
  margin-top: var(--space-4);
}

.stat-item {
  flex: 1;
  min-width: 120px;
  background-color: var(--color-gray-100);
  padding: var(--space-3);
  border-radius: var(--radius-lg);
  text-align: center;
  transition: transform var(--transition-normal) ease;
}

.stat-item:hover {
  transform: translateY(-5px);
  background-color: var(--color-primary);
  color: var(--color-white);
}

.stat-value {
  font-size: var(--font-size-2xl);
  font-weight: 700;
  margin-bottom: var(--space-1);
}

.stat-label {
  font-size: var(--font-size-sm);
  opacity: 0.8;
}

.mission-image {
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

.mission-image:hover .image-rounded {
  transform: scale(1.05);
}

.values-section {
  padding: var(--space-7) 0;
  background-color: var(--color-gray-100);
}

.values-grid {
  display: grid;
  grid-template-columns: 1fr;
  gap: var(--space-4);
}

.value-card {
  background-color: var(--color-white);
  padding: var(--space-4);
  border-radius: var(--radius-lg);
  box-shadow: 0 4px 6px rgba(0,0,0,0.05);
  transition: transform var(--transition-normal) ease;
  text-align: center;
}

.value-card:hover {
  transform: translateY(-10px);
  box-shadow: 0 12px 20px rgba(0,0,0,0.1);
}

.value-icon {
  width: 70px;
  height: 70px;
  border-radius: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
  background-color: var(--color-primary);
  color: var(--color-white);
  margin: 0 auto var(--space-3);
}

.value-icon i {
  font-size: 2rem;
}

.value-title {
  font-size: var(--font-size-xl);
  margin-bottom: var(--space-2);
  color: var(--color-secondary);
}

.value-description {
  color: var(--color-gray-600);
  line-height: 1.5;
}

.team-section {
  padding: var(--space-7) 0;
  background-color: var(--color-white);
}

.team-grid {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
  gap: var(--space-4);
}

.team-card {
  background-color: var(--color-white);
  border-radius: var(--radius-lg);
  overflow: hidden;
  box-shadow: 0 4px 6px rgba(0,0,0,0.05);
  transition: transform var(--transition-normal) ease;
}

.team-card:hover {
  transform: translateY(-10px);
  box-shadow: 0 12px 20px rgba(0,0,0,0.1);
}

.team-image {
  height: 250px;
  position: relative;
  overflow: hidden;
}

.team-image::after {
  content: '';
  position: absolute;
  bottom: 0;
  left: 0;
  width: 100%;
  height: 30%;
  background: linear-gradient(to top, rgba(0, 200, 83, 0.8), transparent);
}

.team-image img {
  width: 100%;
  height: 100%;
  object-fit: cover;
  transition: transform var(--transition-slow) ease;
}

.team-card:hover .team-image img {
  transform: scale(1.1);
}

.team-info {
  padding: var(--space-3);
  text-align: center;
}

.team-name {
  font-size: var(--font-size-lg);
  margin-bottom: var(--space-1);
  color: var(--color-secondary);
}

.team-position {
  font-size: var(--font-size-sm);
  color: var(--color-gray-600);
}

@media (min-width: 768px) {
  .values-grid {
    grid-template-columns: repeat(2, 1fr);
  }
}

@media (min-width: 1024px) {
  .mission-grid {
    grid-template-columns: 3fr 2fr;
  }
  
  .values-grid {
    grid-template-columns: repeat(4, 1fr);
  }
}
</style>