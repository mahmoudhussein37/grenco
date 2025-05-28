<script setup lang="ts">
import { ref, reactive } from "vue";
import { useI18n } from "vue-i18n";

const { t } = useI18n();

const form = reactive({
  name: "",
  email: "",
  phone: "",
  subject: "",
  message: "",
});

const errors = reactive({
  name: "",
  email: "",
  subject: "",
  message: "",
});

const successMessage = ref("");
const errorMessage = ref("");
const isLoading = ref(false);

const validateForm = () => {
  let isValid = true;

  // Reset errors
  errors.name = "";
  errors.email = "";
  errors.subject = "";
  errors.message = "";

  if (!form.name.trim()) {
    errors.name = "Name is required";
    isValid = false;
  }

  if (!form.email.trim()) {
    errors.email = "Email is required";
    isValid = false;
  } else if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(form.email)) {
    errors.email = "Please enter a valid email address";
    isValid = false;
  }

  if (!form.subject.trim()) {
    errors.subject = "Subject is required";
    isValid = false;
  }

  if (!form.message.trim()) {
    errors.message = "Message is required";
    isValid = false;
  }

  return isValid;
};

const handleSubmit = async () => {
  if (!validateForm()) {
    return;
  }

  isLoading.value = true;
  errorMessage.value = "";
  successMessage.value = "";

  try {
    const response = await fetch("https://formspree.io/f/movdegng", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify(form),
    });

    if (response.ok) {
      successMessage.value = t("contact.success");
      // Reset form
      form.name = "";
      form.email = "";
      form.phone = "";
      form.subject = "";
      form.message = "";
    } else {
      errorMessage.value = t("contact.error");
    }
  } catch (error) {
    errorMessage.value = t("contact.error");
  } finally {
    isLoading.value = false;
  }
};
</script>

<template>
  <div class="contact-page">
    <div class="page-header">
      <div class="container">
        <h1 class="page-title" data-aos="fade-up">{{ t("contact.title") }}</h1>
        <p class="page-subtitle" data-aos="fade-up" data-aos-delay="100">
          {{ t("contact.subtitle") }}
        </p>
      </div>
    </div>

    <section class="section contact-section">
      <div class="container">
        <div class="contact-grid">
          <div class="contact-form-wrapper" data-aos="fade-right">
            <form class="contact-form" @submit.prevent="handleSubmit">
              <div class="form-success" v-if="successMessage">
                {{ successMessage }}
              </div>
              <div class="form-error" v-if="errorMessage">
                {{ errorMessage }}
              </div>

              <div class="form-group">
                <label for="name">{{ t("contact.name") }} *</label>
                <input
                  type="text"
                  id="name"
                  v-model="form.name"
                  :placeholder="t('contact.name')"
                  :class="{ error: errors.name }"
                  name="name"
                />
                <div class="error-message" v-if="errors.name">
                  {{ errors.name }}
                </div>
              </div>

              <div class="form-group">
                <label for="email">{{ t("contact.email") }} *</label>
                <input
                  type="email"
                  id="email"
                  v-model="form.email"
                  :placeholder="t('contact.email')"
                  :class="{ error: errors.email }"
                  name="email"
                />
                <div class="error-message" v-if="errors.email">
                  {{ errors.email }}
                </div>
              </div>

              <div class="form-group">
                <label for="phone">{{ t("contact.phone") }}</label>
                <input
                  type="tel"
                  id="phone"
                  v-model="form.phone"
                  :placeholder="t('contact.phone')"
                  name="phone"
                />
              </div>

              <div class="form-group">
                <label for="subject">{{ t("contact.subject") }} *</label>
                <input
                  type="text"
                  id="subject"
                  v-model="form.subject"
                  :placeholder="t('contact.subject')"
                  :class="{ error: errors.subject }"
                  name="subject"
                />
                <div class="error-message" v-if="errors.subject">
                  {{ errors.subject }}
                </div>
              </div>

              <div class="form-group">
                <label for="message">{{ t("contact.message") }} *</label>
                <textarea
                  id="message"
                  v-model="form.message"
                  :placeholder="t('contact.message')"
                  rows="5"
                  :class="{ error: errors.message }"
                  name="message"
                ></textarea>
                <div class="error-message" v-if="errors.message">
                  {{ errors.message }}
                </div>
              </div>

              <button
                type="submit"
                class="btn btn-primary"
                :disabled="isLoading"
              >
                <span v-if="isLoading">Sending...</span>
                <span v-else>{{ t("contact.submit") }}</span>
              </button>
            </form>
          </div>

          <div class="contact-info" data-aos="fade-left">
            <div class="info-card">
              <h3>{{ t("contact.office") }}</h3>
              <div class="info-item">
                <i class="pi pi-map-marker"></i>
                <p>{{ t("footer.address") }}</p>
              </div>
              <div class="info-item">
                <i class="pi pi-phone"></i>
                <p>+20 11 52338718</p>
              </div>
              <div class="info-item">
                <i class="pi pi-envelope"></i>
                <p>info@grenco.org</p>
              </div>

              <h3 class="mt-5">{{ t("contact.followUs") }}</h3>
              <div class="social-links">
                <a
                  href="https://www.linkedin.com/company/grenco"
                  target="_blank"
                  rel="noopener noreferrer"
                  aria-label="LinkedIn"
                >
                  <i class="pi pi-linkedin"></i>
                </a>
                <a
                  href="https://www.facebook.com/Grenco.Company"
                  target="_blank"
                  rel="noopener noreferrer"
                  aria-label="Facebook"
                >
                  <i class="pi pi-facebook"></i>
                </a>
                <a
                  href="#"
                  target="_blank"
                  rel="noopener noreferrer"
                  aria-label="Instagram"
                >
                  <i class="pi pi-instagram"></i>
                </a>
              </div>
            </div>

            <div class="map-container">
              <iframe
                src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d110502.76964842845!2d31.182097223099174!3d30.05946357436829!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x14583fa60b21beeb%3A0x79dfb296e8423bba!2sCairo%2C%20Cairo%20Governorate%2C%20Egypt!5e0!3m2!1sen!2sus!4v1663094748305!5m2!1sen!2sus"
                width="100%"
                height="100%"
                style="border: 0"
                allowfullscreen
                loading="lazy"
              ></iframe>
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

.contact-section {
  padding: var(--space-6) 0;
  background-color: var(--color-white);
}

.contact-grid {
  display: grid;
  grid-template-columns: 1fr;
  gap: var(--space-5);
}

.contact-form {
  background-color: var(--color-white);
  padding: var(--space-4);
  border-radius: var(--radius-lg);
  box-shadow: 0 10px 30px rgba(0, 0, 0, 0.05);
}

.form-group {
  margin-bottom: var(--space-4);
}

.form-group label {
  display: block;
  margin-bottom: var(--space-1);
  font-weight: 500;
  color: var(--color-secondary);
}

.form-group input,
.form-group textarea {
  width: 100%;
  padding: var(--space-3);
  border: 1px solid var(--color-gray-300);
  border-radius: var(--radius-md);
  background-color: var(--color-gray-100);
  transition: border-color var(--transition-normal),
    box-shadow var(--transition-normal);
}

.form-group input:focus,
.form-group textarea:focus {
  outline: none;
  border-color: var(--color-primary);
  box-shadow: 0 0 0 3px rgba(0, 200, 83, 0.1);
  background-color: var(--color-white);
}

.form-group input.error,
.form-group textarea.error {
  border-color: var(--color-error);
  background-color: rgba(244, 67, 54, 0.05);
}

.error-message {
  color: var(--color-error);
  font-size: var(--font-size-sm);
  margin-top: var(--space-1);
}

.form-success {
  background-color: rgba(76, 175, 80, 0.1);
  color: var(--color-success);
  padding: var(--space-3);
  border-radius: var(--radius-md);
  margin-bottom: var(--space-4);
  font-weight: 500;
}

.form-error {
  background-color: rgba(244, 67, 54, 0.1);
  color: var(--color-error);
  padding: var(--space-3);
  border-radius: var(--radius-md);
  margin-bottom: var(--space-4);
  font-weight: 500;
}

.contact-info {
  display: flex;
  flex-direction: column;
  gap: var(--space-4);
}

.info-card {
  background-color: var(--color-white);
  padding: var(--space-4);
  border-radius: var(--radius-lg);
  box-shadow: 0 10px 30px rgba(0, 0, 0, 0.05);
}

.info-card h3 {
  font-size: var(--font-size-xl);
  margin-bottom: var(--space-3);
  color: var(--color-secondary);
}

.info-item {
  display: flex;
  align-items: center;
  margin-bottom: var(--space-3);
}

.info-item i {
  font-size: 1.5rem;
  color: var(--color-primary);
  margin-right: var(--space-3);
}

.social-links {
  display: flex;
  gap: var(--space-2);
  margin-top: var(--space-3);
}

.social-links a {
  display: flex;
  align-items: center;
  justify-content: center;
  width: 40px;
  height: 40px;
  border-radius: 50%;
  background-color: var(--color-gray-100);
  color: var(--color-primary);
  transition: background-color var(--transition-normal),
    transform var(--transition-normal);
}

.social-links a:hover {
  background-color: var(--color-primary);
  color: var(--color-white);
  transform: translateY(-3px);
}

.map-container {
  height: 300px;
  border-radius: var(--radius-lg);
  overflow: hidden;
  box-shadow: 0 10px 30px rgba(0, 0, 0, 0.05);
}

@media (min-width: 1024px) {
  .contact-grid {
    grid-template-columns: 1fr 1fr;
  }

  .map-container {
    height: 100%;
    min-height: 400px;
  }
}

:deep(.rtl) .info-item i {
  margin-right: 0;
  margin-left: var(--space-3);
}
</style>