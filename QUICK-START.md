# Quick GitHub Repository Creation Guide

## 🚀 Fastest Way to Deploy Your Grenco Website

### Method 1: Using the Setup Script (Recommended)

1. **Run the setup script with your GitHub details:**

   ```powershell
   .\setup-github.ps1 -GitHubUsername "YOUR_GITHUB_USERNAME" -RepositoryName "grenco-website"
   ```

2. **If the repository doesn't exist yet, the script will:**
   - Open GitHub for you to create it
   - Guide you through the remaining steps
   - Provide direct links to all settings pages

### Method 2: Manual Step-by-Step

#### Step 1: Create Repository on GitHub

1. Go to [https://github.com/new](https://github.com/new)
2. Repository name: `grenco-website` (or your preferred name)
3. Make it **Public** (required for free GitHub Pages)
4. **Don't** initialize with README, .gitignore, or license
5. Click "Create repository"

#### Step 2: Connect Your Local Repository

```powershell
# Replace YOUR_USERNAME with your actual GitHub username
git remote add origin https://github.com/YOUR_USERNAME/grenco-website.git

# Update Vite configuration for your repository name
$content = Get-Content "vite.config.ts" -Raw
$content = $content -replace "base: '/grenco-website/',", "base: '/grenco-website/',"
Set-Content "vite.config.ts" $content

# Test build
npm run build

# Commit and push
git add .
git commit -m "Configure for GitHub Pages deployment"
git push -u origin main
```

#### Step 3: Set Up GitHub Secrets

1. Go to your repository → Settings → Secrets and variables → Actions
2. Click "New repository secret"
3. Add these secrets:

   - **Name:** `VITE_CONTENTFUL_SPACE_ID`
   - **Value:** `g8e8ffg6jo04`

   - **Name:** `VITE_CONTENTFUL_ACCESS_TOKEN`
   - **Value:** `YBepEoTgpTm0KSlSF9QCN1ub0_G-qTB04NlJktUJuVE`

#### Step 4: Enable GitHub Pages

1. Go to your repository → Settings → Pages
2. Under "Source", select **"GitHub Actions"**
3. Save the settings

### 🎉 That's It!

Your website will be automatically deployed to:
`https://YOUR_USERNAME.github.io/grenco-website/`

## 📊 Monitoring Deployment

- **Check deployment status:** Go to your repository → Actions tab
- **View live site:** Your GitHub Pages URL (takes 2-5 minutes for first deployment)
- **Logs:** Click on any workflow run to see detailed logs

## 🔧 Troubleshooting

### Build Fails

- Check the Actions tab for error details
- Ensure all GitHub Secrets are set correctly
- Verify repository name matches vite.config.ts

### Site Not Loading

- Wait 5-10 minutes for GitHub Pages to propagate
- Check that GitHub Pages source is set to "GitHub Actions"
- Verify the site URL format: `https://username.github.io/repository-name/`

### Authentication Issues

- Make sure your repository is public
- Check if you need to configure Git credentials:
  ```powershell
  git config --global user.name "Your Name"
  git config --global user.email "your.email@example.com"
  ```

## 🔄 Future Updates

To update your live website:

1. Make changes to your code
2. Commit and push to main branch:
   ```powershell
   git add .
   git commit -m "Your update message"
   git push
   ```
3. GitHub Actions will automatically rebuild and deploy!
