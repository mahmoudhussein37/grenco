#!/usr/bin/env pwsh

Write-Host "🔧 Grenco Contentful Troubleshooting Script" -ForegroundColor Green
Write-Host "============================================" -ForegroundColor Green
Write-Host ""

# Check if secrets are in environment
Write-Host "1. Checking Environment Variables:" -ForegroundColor Yellow
Write-Host "   VITE_CONTENTFUL_SPACE_ID: $($env:VITE_CONTENTFUL_SPACE_ID ?? 'Not set')" -ForegroundColor White
Write-Host "   VITE_CONTENTFUL_ACCESS_TOKEN: $(if($env:VITE_CONTENTFUL_ACCESS_TOKEN) { 'Set' } else { 'Not set' })" -ForegroundColor White
Write-Host ""

# Check GitHub repository secrets page
Write-Host "2. GitHub Repository Secrets:" -ForegroundColor Yellow
Write-Host "   Open this page to verify secrets are added:" -ForegroundColor White
Write-Host "   https://github.com/mahmoudhussein37/grenco/settings/secrets/actions" -ForegroundColor Cyan
Write-Host ""

# Check latest deployment
Write-Host "3. Latest Deployment Status:" -ForegroundColor Yellow
Write-Host "   Check the latest GitHub Actions run:" -ForegroundColor White
Write-Host "   https://github.com/mahmoudhussein37/grenco/actions" -ForegroundColor Cyan
Write-Host ""

# Check live site
Write-Host "4. Live Site:" -ForegroundColor Yellow
Write-Host "   https://mahmoudhussein37.github.io/grenco/" -ForegroundColor Cyan
Write-Host ""

Write-Host "🔍 Common Issues and Solutions:" -ForegroundColor Yellow
Write-Host ""
Write-Host "Issue 1: Secrets not working" -ForegroundColor Red
Write-Host "Solution:" -ForegroundColor Green
Write-Host "- Ensure both secrets are added exactly as:" -ForegroundColor White
Write-Host "  VITE_CONTENTFUL_SPACE_ID = g8e8ffg6jo04" -ForegroundColor White
Write-Host "  VITE_CONTENTFUL_ACCESS_TOKEN = YBepEoTgpTm0KSlSF9QCN1ub0_G-qTB04NlJktUJuVE" -ForegroundColor White
Write-Host ""

Write-Host "Issue 2: GitHub Pages not enabled" -ForegroundColor Red
Write-Host "Solution:" -ForegroundColor Green
Write-Host "- Go to: https://github.com/mahmoudhussein37/grenco/settings/pages" -ForegroundColor White
Write-Host "- Set Source to: GitHub Actions" -ForegroundColor White
Write-Host ""

Write-Host "Issue 3: Contentful API key expired" -ForegroundColor Red
Write-Host "Solution:" -ForegroundColor Green
Write-Host "- Check if the API key is still valid in Contentful dashboard" -ForegroundColor White
Write-Host "- Generate a new access token if needed" -ForegroundColor White
Write-Host ""

Write-Host "Issue 4: Wrong content type" -ForegroundColor Red
Write-Host "Solution:" -ForegroundColor Green
Write-Host "- Verify you have a content type called 'news' in Contentful" -ForegroundColor White
Write-Host "- Check if there are published entries of type 'news'" -ForegroundColor White
Write-Host ""

$choice = Read-Host "Do you want to open GitHub secrets page to verify? (y/n)"
if ($choice -eq 'y' -or $choice -eq 'Y') {
    Start-Process "https://github.com/mahmoudhussein37/grenco/settings/secrets/actions"
    Write-Host "✅ Opened GitHub secrets page" -ForegroundColor Green
}

$choice2 = Read-Host "Do you want to open GitHub Actions to check deployment? (y/n)"
if ($choice2 -eq 'y' -or $choice2 -eq 'Y') {
    Start-Process "https://github.com/mahmoudhussein37/grenco/actions"
    Write-Host "✅ Opened GitHub Actions page" -ForegroundColor Green
}

$choice3 = Read-Host "Do you want to trigger a new deployment? (y/n)"
if ($choice3 -eq 'y' -or $choice3 -eq 'Y') {
    Write-Host "🚀 Triggering new deployment..." -ForegroundColor Yellow
    git commit --allow-empty -m "Debug: Trigger deployment to test Contentful secrets"
    git push
    Write-Host "✅ Deployment triggered!" -ForegroundColor Green
}
