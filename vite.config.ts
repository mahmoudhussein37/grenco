import { defineConfig } from 'vite'
import vue from '@vitejs/plugin-vue'

// https://vitejs.dev/config/
export default defineConfig({
  plugins: [vue()],
  base: '/grenco/', // Replace with your repository name
  build: {
    outDir: 'dist',
    assetsDir: 'assets',
  }
})

