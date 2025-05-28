param(
    [Parameter(Mandatory=$true)]
    [string]$RepositoryName
)

Write-Host "============================================" -ForegroundColor Green
Write-Host "   Grenco Website Deployment Helper" -ForegroundColor Green  
Write-Host "============================================" -ForegroundColor Green
Write-Host ""

Write-Host "Updating vite.config.ts with repository name: $RepositoryName" -ForegroundColor Yellow
Write-Host ""

# Update vite.config.ts
$content = Get-Content "vite.config.ts" -Raw
$content = $content -replace "/grenco-website/", "/$RepositoryName/"
Set-Content "vite.config.ts" $content

Write-Host "Building project..." -ForegroundColor Yellow
& npm run build

if ($LASTEXITCODE -ne 0) {
    Write-Host "Build failed! Please check the errors above." -ForegroundColor Red
    Read-Host "Press Enter to exit"
    exit 1
}

Write-Host ""
Write-Host "Committing changes..." -ForegroundColor Yellow
& git add .
& git commit -m "Update repository name for GitHub Pages deployment"

Write-Host ""
Write-Host "Pushing to GitHub..." -ForegroundColor Yellow
& git push

Write-Host ""
Write-Host "============================================" -ForegroundColor Green
Write-Host "   Deployment Complete!" -ForegroundColor Green
Write-Host "============================================" -ForegroundColor Green
Write-Host ""
Write-Host "Your website should be available at:" -ForegroundColor Cyan
Write-Host "https://YOUR_USERNAME.github.io/$RepositoryName/" -ForegroundColor Cyan
Write-Host ""
Write-Host "Note: It may take a few minutes for GitHub Pages to deploy." -ForegroundColor Yellow
Write-Host "Check the Actions tab in your GitHub repository for deployment status." -ForegroundColor Yellow
Write-Host ""
Read-Host "Press Enter to exit"
