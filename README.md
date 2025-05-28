# Grenco Website

A modern, responsive website for Grenco built with Vue 3, TypeScript, and Vite.

## Features

- ⚡️ Vue 3 with Composition API
- 🎨 Modern UI with PrimeVue components
- 🌍 Internationalization (Arabic/English)
- 📱 Fully responsive design
- 🎯 SEO optimized
- 🔄 Content management with Contentful CMS

## Setup

1. Clone the repository
2. Install dependencies:
   ```bash
   npm install
   ```

3. Set up environment variables:
   ```bash
   cp .env.example .env.local
   ```
   Fill in your Contentful credentials in `.env.local`

4. Start the development server:
   ```bash
   npm run dev
   ```

## Building for Production

```bash
npm run build
```

## Deployment to GitHub Pages

1. Make sure your repository name matches the `base` setting in `vite.config.ts`
2. Install gh-pages globally (if not already installed):
   ```bash
   npm install -g gh-pages
   ```
3. Deploy:
   ```bash
   npm run deploy
   ```

## Environment Variables

- `VITE_CONTENTFUL_SPACE_ID`: Your Contentful space ID
- `VITE_CONTENTFUL_ACCESS_TOKEN`: Your Contentful delivery API access token

## Project Structure

- `src/components/` - Reusable Vue components
- `src/views/` - Page components
- `src/stores/` - Pinia stores for state management
- `src/locales/` - Internationalization files
- `src/assets/` - Static assets (images, etc.)

## Security

- Environment variables are used for sensitive data
- Contentful credentials are not committed to the repository
- Build artifacts and sensitive files are excluded via .gitignore
