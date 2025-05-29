#!/usr/bin/env pwsh

Write-Host "🔧 GitHub Pages Setup Guide" -ForegroundColor Green
Write-Host "=============================" -ForegroundColor Green
Write-Host ""

Write-Host "Your repository: https://github.com/mahmoudhussein37/grenco" -ForegroundColor Cyan
Write-Host ""

Write-Host "Step 1: Enable GitHub Pages" -ForegroundColor Yellow
Write-Host "1. Open: https://github.com/mahmoudhussein37/grenco/settings/pages" -ForegroundColor White
Write-Host "2. Under 'Source', select 'GitHub Actions'" -ForegroundColor White
Write-Host "3. Click 'Save'" -ForegroundColor White
Write-Host ""

Write-Host "Step 2: Add Contentful Secrets" -ForegroundColor Yellow
Write-Host "1. Open: https://github.com/mahmoudhussein37/grenco/settings/secrets/actions" -ForegroundColor White
Write-Host "2. Click 'New repository secret'" -ForegroundColor White
Write-Host "3. Add these secrets:" -ForegroundColor White
Write-Host "   - Name: VITE_CONTENTFUL_SPACE_ID" -ForegroundColor Cyan
Write-Host "   - Value: g8e8ffg6jo04" -ForegroundColor Cyan
Write-Host ""
Write-Host "   - Name: VITE_CONTENTFUL_ACCESS_TOKEN" -ForegroundColor Cyan
Write-Host "   - Value: YBepEoTgpTm0KSlSF9QCN1ub0_G-qTB04NlJktUJuVE" -ForegroundColor Cyan
Write-Host ""

Write-Host "Step 3: Trigger Deployment" -ForegroundColor Yellow
Write-Host "After completing steps 1 and 2, run:" -ForegroundColor White
Write-Host "   git commit -am 'Secure contentful token'" -ForegroundColor Cyan
Write-Host "   git push" -ForegroundColor Cyan
Write-Host ""

Write-Host "Your site will be available at:" -ForegroundColor Green
Write-Host "https://mahmoudhussein37.github.io/grenco/" -ForegroundColor Cyan
Write-Host ""

Write-Host "Press Enter to open GitHub Pages settings..." -ForegroundColor Yellow
Read-Host
Start-Process "https://github.com/mahmoudhussein37/grenco/settings/pages"

Write-Host "Press Enter to open Secrets settings..." -ForegroundColor Yellow
Read-Host
Start-Process "https://github.com/mahmoudhussein37/grenco/settings/secrets/actions"
