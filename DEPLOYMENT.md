# GitHub Pages Deployment Instructions

## Prerequisites

- You need a GitHub account
- Git should be installed (which you already have)

## Step 1: Create a GitHub Repository

1. Go to [GitHub.com](https://github.com) and sign in
2. Click the "+" icon in the top right and select "New repository"
3. Name your repository (e.g., "grenco-website")
4. Make sure it's set to "Public" (required for GitHub Pages on free accounts)
5. Do NOT initialize with README, .gitignore, or license (we already have these)
6. Click "Create repository"

## Step 2: Connect Your Local Repository to GitHub

After creating the repository, GitHub will show you the commands. Run these in your terminal:

```powershell
git remote add origin https://github.com/YOUR_USERNAME/YOUR_REPOSITORY_NAME.git
git push -u origin main
```

Replace YOUR_USERNAME and YOUR_REPOSITORY_NAME with your actual values.

## Step 3: Update Vite Configuration

Before deploying, you need to update the `base` path in `vite.config.ts` to match your repository name:

```typescript
export default defineConfig({
  plugins: [vue()],
  base: "/YOUR_REPOSITORY_NAME/", // Replace with your actual repository name
  build: {
    outDir: "dist",
    assetsDir: "assets",
  },
});
```

## Step 4: Set Up Environment Variables in GitHub

1. Go to your repository on GitHub
2. Click on "Settings" tab
3. In the left sidebar, click "Secrets and variables" → "Actions"
4. Click "New repository secret"
5. Add these secrets:
   - Name: `VITE_CONTENTFUL_SPACE_ID`, Value: `g8e8ffg6jo04`
   - Name: `VITE_CONTENTFUL_ACCESS_TOKEN`, Value: `YBepEoTgpTm0KSlSF9QCN1ub0_G-qTB04NlJktUJuVE`

## Step 5: Enable GitHub Pages

1. In your repository, go to "Settings" tab
2. Scroll down to "Pages" in the left sidebar
3. Under "Source", select "GitHub Actions"
4. The GitHub Actions workflow is already configured in `.github/workflows/deploy.yml`

## Step 6: Deploy

Once you push your code and the workflow runs, your site will be available at:
`https://YOUR_USERNAME.github.io/YOUR_REPOSITORY_NAME/`

## Security Notes

✅ **What we've secured:**

- Environment variables are used for Contentful credentials
- Sensitive files are excluded from Git via `.gitignore`
- GitHub Secrets are used for production deployment
- The original credentials are kept as fallbacks for development

✅ **Additional Security Recommendations:**

- Consider rotating your Contentful access tokens periodically
- Monitor your Contentful usage for any unusual activity
- Set up proper content delivery API rate limits in Contentful
- Consider using Contentful's Preview API for development

## Troubleshooting

If the build fails:

1. Check the "Actions" tab in your GitHub repository
2. Look at the build logs for specific errors
3. Ensure all environment variables are correctly set
4. Verify that your repository name matches the `base` setting in `vite.config.ts`

## Local Development

To run the project locally:

```powershell
npm install
npm run dev
```

To build for production:

```powershell
npm run build
```

To preview the production build:

```powershell
npm run preview
```
