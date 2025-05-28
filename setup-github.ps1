param(
    [Parameter(Mandatory=$true)]
    [string]$GitHubUsername,
    
    [Parameter(Mandatory=$true)]
    [string]$RepositoryName
)

$ErrorActionPreference = "Stop"

Write-Host "============================================" -ForegroundColor Green
Write-Host "   Grenco Website GitHub Setup Script" -ForegroundColor Green  
Write-Host "============================================" -ForegroundColor Green
Write-Host ""

Write-Host "Setting up GitHub repository for:" -ForegroundColor Yellow
Write-Host "  Username: $GitHubUsername" -ForegroundColor Cyan
Write-Host "  Repository: $RepositoryName" -ForegroundColor Cyan
Write-Host ""

# Step 1: Update vite.config.ts with the repository name
Write-Host "Step 1: Updating vite.config.ts with repository name..." -ForegroundColor Yellow
$content = Get-Content "vite.config.ts" -Raw
$content = $content -replace "base: '/grenco-website/',", "base: '/$RepositoryName/',"
Set-Content "vite.config.ts" $content
Write-Host "✅ vite.config.ts updated" -ForegroundColor Green

# Step 2: Test the build
Write-Host ""
Write-Host "Step 2: Testing the build process..." -ForegroundColor Yellow
& npm run build

if ($LASTEXITCODE -ne 0) {
    Write-Host "❌ Build failed! Please check the errors above." -ForegroundColor Red
    Read-Host "Press Enter to exit"
    exit 1
}
Write-Host "✅ Build successful" -ForegroundColor Green

# Step 3: Commit the configuration changes
Write-Host ""
Write-Host "Step 3: Committing configuration changes..." -ForegroundColor Yellow
& git add vite.config.ts
& git commit -m "Configure Vite for GitHub Pages deployment to $RepositoryName"
Write-Host "✅ Changes committed" -ForegroundColor Green

# Step 4: Add remote repository
Write-Host ""
Write-Host "Step 4: Adding GitHub remote repository..." -ForegroundColor Yellow
$repoUrl = "https://github.com/$GitHubUsername/$RepositoryName.git"
& git remote add origin $repoUrl
Write-Host "✅ Remote repository added: $repoUrl" -ForegroundColor Green

# Step 5: Push to GitHub
Write-Host ""
Write-Host "Step 5: Pushing code to GitHub..." -ForegroundColor Yellow
& git push -u origin main

if ($LASTEXITCODE -ne 0) {
    Write-Host "❌ Push failed! This usually means:" -ForegroundColor Red
    Write-Host "  1. The repository doesn't exist on GitHub yet" -ForegroundColor Yellow
    Write-Host "  2. You don't have permission to push to this repository" -ForegroundColor Yellow
    Write-Host "  3. Authentication failed" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "Please create the repository on GitHub first:" -ForegroundColor Cyan
    Write-Host "  1. Go to https://github.com/new" -ForegroundColor White
    Write-Host "  2. Repository name: $RepositoryName" -ForegroundColor White
    Write-Host "  3. Make it Public (required for free GitHub Pages)" -ForegroundColor White
    Write-Host "  4. Don't initialize with README, .gitignore, or license" -ForegroundColor White
    Write-Host "  5. Click 'Create repository'" -ForegroundColor White
    Write-Host ""
    Write-Host "Then run this script again." -ForegroundColor Yellow
    Read-Host "Press Enter to exit"
    exit 1
}
Write-Host "✅ Code pushed to GitHub successfully" -ForegroundColor Green

# Step 6: Provide next steps
Write-Host ""
Write-Host "============================================" -ForegroundColor Green
Write-Host "   Setup Complete! Next Steps:" -ForegroundColor Green
Write-Host "============================================" -ForegroundColor Green
Write-Host ""

Write-Host "1. 🔐 Set up GitHub Secrets:" -ForegroundColor Yellow
Write-Host "   Go to: https://github.com/$GitHubUsername/$RepositoryName/settings/secrets/actions" -ForegroundColor White
Write-Host "   Add these secrets:" -ForegroundColor White
Write-Host "   - VITE_CONTENTFUL_SPACE_ID = g8e8ffg6jo04" -ForegroundColor Cyan
Write-Host "   - VITE_CONTENTFUL_ACCESS_TOKEN = YBepEoTgpTm0KSlSF9QCN1ub0_G-qTB04NlJktUJuVE" -ForegroundColor Cyan
Write-Host ""

Write-Host "2. 📄 Enable GitHub Pages:" -ForegroundColor Yellow
Write-Host "   Go to: https://github.com/$GitHubUsername/$RepositoryName/settings/pages" -ForegroundColor White
Write-Host "   Under 'Source', select 'GitHub Actions'" -ForegroundColor Cyan
Write-Host ""

Write-Host "3. 🚀 Your website will be available at:" -ForegroundColor Yellow
Write-Host "   https://$GitHubUsername.github.io/$RepositoryName/" -ForegroundColor Cyan
Write-Host ""

Write-Host "4. 📊 Monitor deployment:" -ForegroundColor Yellow
Write-Host "   Check: https://github.com/$GitHubUsername/$RepositoryName/actions" -ForegroundColor White
Write-Host ""

Write-Host "The GitHub Actions workflow will automatically deploy your site" -ForegroundColor Green
Write-Host "when you push changes to the main branch." -ForegroundColor Green
Write-Host ""

Read-Host "Press Enter to open GitHub repository creation page"
Start-Process "https://github.com/new"

Read-Host "Press Enter to open repository settings for secrets"
Start-Process "https://github.com/$GitHubUsername/$RepositoryName/settings/secrets/actions"

Read-Host "Press Enter to open Pages settings"
Start-Process "https://github.com/$GitHubUsername/$RepositoryName/settings/pages"
