# Grenco Website

A modern, responsive website for Grenco built with Vue 3, TypeScript, and Vite.

## Features

- ⚡️ Vue 3 with Composition API
- 🎨 Modern UI with PrimeVue components
- 🌍 Internationalization (Arabic/English)
- 📱 Fully responsive design
- 🎯 SEO optimized
- 🔄 Content management with Contentful CMS

## Quick Start

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

## 📚 Documentation

- **[Deployment Guide](DEPLOYMENT.md)** - Complete guide for deploying to GitHub Pages
- **[Security Guidelines](SECURITY.md)** - Security best practices and checklist

## Deployment to GitHub Pages

### Quick Deployment

Use the provided deployment script:

```powershell
.\deploy.ps1 your-repository-name
```

### Manual Deployment

See [DEPLOYMENT.md](DEPLOYMENT.md) for detailed step-by-step instructions.

## Building for Production

```bash
npm run build
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

This project follows security best practices:

- ✅ Environment variables for sensitive data
- ✅ Credentials excluded from version control
- ✅ Secure GitHub Actions deployment
- ✅ Regular dependency updates

See [SECURITY.md](SECURITY.md) for complete security guidelines.

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly
5. Submit a pull request

## License

This project is licensed under the MIT License.
