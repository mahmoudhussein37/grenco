#!/usr/bin/env pwsh

Write-Host "🔧 Final Grenco Deployment Verification" -ForegroundColor Green
Write-Host "=======================================" -ForegroundColor Green
Write-Host ""

Write-Host "Step 1: Opening GitHub Secrets Page..." -ForegroundColor Yellow
Start-Process "https://github.com/mahmoudhussein37/grenco/settings/secrets/actions"
Write-Host "✅ Verify these secrets exist:" -ForegroundColor Green
Write-Host "   • VITE_CONTENTFUL_SPACE_ID = g8e8ffg6jo04" -ForegroundColor White
Write-Host "   • VITE_CONTENTFUL_ACCESS_TOKEN = YBepEoTgpTm0KSlSF9QCN1ub0_G-qTB04NlJktUJuVE" -ForegroundColor White
Write-Host ""

Start-Sleep -Seconds 3

Write-Host "Step 2: Opening GitHub Pages Settings..." -ForegroundColor Yellow
Start-Process "https://github.com/mahmoudhussein37/grenco/settings/pages"
Write-Host "✅ Verify Source is set to: GitHub Actions" -ForegroundColor Green
Write-Host ""

Start-Sleep -Seconds 3

Write-Host "Step 3: Opening GitHub Actions..." -ForegroundColor Yellow
Start-Process "https://github.com/mahmoudhussein37/grenco/actions"
Write-Host "✅ Wait for deployment to complete (green checkmark)" -ForegroundColor Green
Write-Host ""

Start-Sleep -Seconds 3

Write-Host "Step 4: Opening your live site..." -ForegroundColor Yellow
Start-Process "https://mahmoudhussein37.github.io/grenco/"
Write-Host "✅ Test the news section and check browser console (F12)" -ForegroundColor Green
Write-Host ""

Write-Host "🔍 If news still doesn't load:" -ForegroundColor Red
Write-Host "1. Open browser console (F12) on your live site" -ForegroundColor White
Write-Host "2. Look for Contentful debug messages starting with 🔧" -ForegroundColor White
Write-Host "3. Check if environment variables are properly loaded" -ForegroundColor White
Write-Host "4. Look for any error messages in the console" -ForegroundColor White
Write-Host ""

Write-Host "💡 The enhanced debugging will show:" -ForegroundColor Yellow
Write-Host "• Space ID and Access Token being used" -ForegroundColor White
Write-Host "• Detailed error messages if connection fails" -ForegroundColor White
Write-Host "• Number of articles fetched from Contentful" -ForegroundColor White
Write-Host ""

Write-Host "🎯 Expected Result:" -ForegroundColor Green
Write-Host "Your site should load news articles from Contentful successfully!" -ForegroundColor Cyan
