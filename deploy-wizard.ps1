#!/usr/bin/env pwsh

Write-Host "=========================================" -ForegroundColor Green
Write-Host "  GRENCO WEBSITE DEPLOYMENT WIZARD" -ForegroundColor Green
Write-Host "=========================================" -ForegroundColor Green
Write-Host ""

# Step 1: Get user info
$username = Read-Host "Enter your GitHub username"
$repoName = Read-Host "Enter repository name (default: grenco-website)" 
if ([string]::IsNullOrWhiteSpace($repoName)) {
    $repoName = "grenco-website"
}

Write-Host ""
Write-Host "Setting up deployment for:" -ForegroundColor Yellow
Write-Host "  GitHub User: $username" -ForegroundColor Cyan
Write-Host "  Repository: $repoName" -ForegroundColor Cyan
Write-Host "  Future URL: https://$username.github.io/$repoName/" -ForegroundColor Green
Write-Host ""

# Step 2: Update Vite config
Write-Host "Step 1: Updating Vite configuration..." -ForegroundColor Yellow
$viteConfig = Get-Content "vite.config.ts" -Raw
$viteConfig = $viteConfig -replace "base: '/grenco-website/',", "base: '/$repoName/',"
Set-Content "vite.config.ts" $viteConfig
Write-Host "✅ Vite config updated for repository: $repoName" -ForegroundColor Green

# Step 3: Test build
Write-Host ""
Write-Host "Step 2: Testing build process..." -ForegroundColor Yellow
$buildResult = & npm run build 2>&1
if ($LASTEXITCODE -eq 0) {
    Write-Host "✅ Build successful!" -ForegroundColor Green
} else {
    Write-Host "❌ Build failed!" -ForegroundColor Red
    Write-Host $buildResult
    Write-Host ""
    Write-Host "Please fix the build errors and run this script again." -ForegroundColor Yellow
    exit 1
}

# Step 4: Commit changes
Write-Host ""
Write-Host "Step 3: Committing deployment configuration..." -ForegroundColor Yellow
git add vite.config.ts
git commit -m "Configure deployment for $repoName repository"
Write-Host "✅ Changes committed" -ForegroundColor Green

# Step 5: Check if remote exists
Write-Host ""
Write-Host "Step 4: Setting up GitHub connection..." -ForegroundColor Yellow
$remoteCheck = git remote get-url origin 2>&1
if ($LASTEXITCODE -eq 0) {
    Write-Host "⚠️  Remote repository already exists: $remoteCheck" -ForegroundColor Yellow
    $overwrite = Read-Host "Do you want to update it? (y/n)"
    if ($overwrite -eq "y" -or $overwrite -eq "Y") {
        git remote remove origin
        git remote add origin "https://github.com/$username/$repoName.git"
        Write-Host "✅ Remote repository updated" -ForegroundColor Green
    }
} else {
    git remote add origin "https://github.com/$username/$repoName.git"
    Write-Host "✅ Remote repository added: https://github.com/$username/$repoName.git" -ForegroundColor Green
}

# Step 6: Push to GitHub
Write-Host ""
Write-Host "Step 5: Pushing to GitHub..." -ForegroundColor Yellow
Write-Host "Note: Make sure you've created the repository on GitHub first!" -ForegroundColor Cyan

$pushResult = git push -u origin main 2>&1
if ($LASTEXITCODE -eq 0) {
    Write-Host "✅ Code successfully pushed to GitHub!" -ForegroundColor Green
} else {
    Write-Host "❌ Push failed. Error details:" -ForegroundColor Red
    Write-Host $pushResult
    Write-Host ""
    Write-Host "This usually means:" -ForegroundColor Yellow
    Write-Host "1. The repository doesn't exist on GitHub yet" -ForegroundColor White
    Write-Host "2. You need to authenticate with GitHub" -ForegroundColor White
    Write-Host "3. The repository name is incorrect" -ForegroundColor White
    Write-Host ""
    Write-Host "Please:" -ForegroundColor Cyan
    Write-Host "1. Create the repository on GitHub: https://github.com/new" -ForegroundColor White
    Write-Host "2. Make sure it's public and named exactly: $repoName" -ForegroundColor White
    Write-Host "3. Don't initialize with README, .gitignore, or license" -ForegroundColor White
    Write-Host "4. Then run this script again" -ForegroundColor White
    exit 1
}

# Step 7: Open GitHub settings
Write-Host ""
Write-Host "=========================================" -ForegroundColor Green
Write-Host "  DEPLOYMENT SETUP COMPLETE!" -ForegroundColor Green
Write-Host "=========================================" -ForegroundColor Green
Write-Host ""

Write-Host "Next steps to complete deployment:" -ForegroundColor Yellow
Write-Host ""

Write-Host "1. 🔐 Set up GitHub Secrets (opening now...):" -ForegroundColor Cyan
Write-Host "   Add these two secrets:" -ForegroundColor White
Write-Host "   - VITE_CONTENTFUL_SPACE_ID = g8e8ffg6jo04" -ForegroundColor Yellow
Write-Host "   - VITE_CONTENTFUL_ACCESS_TOKEN = YBepEoTgpTm0KSlSF9QCN1ub0_G-qTB04NlJktUJuVE" -ForegroundColor Yellow
Write-Host ""

Write-Host "2. 📄 Enable GitHub Pages (opening now...):" -ForegroundColor Cyan
Write-Host "   - Source: GitHub Actions" -ForegroundColor White
Write-Host ""

Write-Host "3. 🚀 Your website will be live at:" -ForegroundColor Green
Write-Host "   https://$username.github.io/$repoName/" -ForegroundColor Blue
Write-Host ""

Write-Host "4. 📊 Monitor deployment:" -ForegroundColor Cyan
Write-Host "   https://github.com/$username/$repoName/actions" -ForegroundColor White
Write-Host ""

# Open necessary GitHub pages
Write-Host "Opening GitHub settings pages..." -ForegroundColor Yellow
Start-Process "https://github.com/$username/$repoName/settings/secrets/actions"
Start-Sleep 2
Start-Process "https://github.com/$username/$repoName/settings/pages"
Start-Sleep 1
Start-Process "https://github.com/$username/$repoName/actions"

Write-Host ""
Write-Host "🎉 Deployment wizard complete!" -ForegroundColor Green
Write-Host "Your website should be live in 2-5 minutes after setting up the secrets and pages!" -ForegroundColor Cyan
Write-Host ""

Read-Host "Press Enter to exit"
