# GitHub Repository Secrets Setup for Contentful
# This script will guide you through adding Contentful secrets to GitHub

Write-Host "🔧 Contentful GitHub Secrets Setup" -ForegroundColor Green
Write-Host "=================================" -ForegroundColor Green
Write-Host ""

# Get current values from contentful.js
$contentfulFile = "src/contentful.js"
if (Test-Path $contentfulFile) {
    $content = Get-Content $contentfulFile -Raw
      # Extract space ID
    if ($content -match 'space.*?"([^"]+)"') {
        $spaceId = $matches[1]
        Write-Host "✅ Found Contentful Space ID: $spaceId" -ForegroundColor Green
    }
    
    # Extract access token  
    if ($content -match 'accessToken.*?"([^"]+)"') {
        $accessToken = $matches[1]
        Write-Host "✅ Found Contentful Access Token: $($accessToken.Substring(0,8))..." -ForegroundColor Green
    }
}

Write-Host ""
Write-Host "📋 Steps to add secrets to GitHub:" -ForegroundColor Yellow
Write-Host ""
Write-Host "1. Open your repository secrets page:" -ForegroundColor Cyan
Write-Host "   https://github.com/mahmoudhussein37/grenco/settings/secrets/actions" -ForegroundColor White
Write-Host ""
Write-Host "2. Click 'New repository secret' and add:" -ForegroundColor Cyan
Write-Host ""
Write-Host "   Secret 1:" -ForegroundColor Yellow
Write-Host "   Name: VITE_CONTENTFUL_SPACE_ID" -ForegroundColor White
Write-Host "   Value: $spaceId" -ForegroundColor White
Write-Host ""
Write-Host "   Secret 2:" -ForegroundColor Yellow
Write-Host "   Name: VITE_CONTENTFUL_ACCESS_TOKEN" -ForegroundColor White
Write-Host "   Value: $accessToken" -ForegroundColor White
Write-Host ""
Write-Host "3. After adding both secrets, trigger a new deployment:" -ForegroundColor Cyan
Write-Host "   - Go to: https://github.com/mahmoudhussein37/grenco/actions" -ForegroundColor White
Write-Host "   - Click 'Run workflow' on the latest workflow" -ForegroundColor White
Write-Host "   - Or make a small commit to trigger automatic deployment" -ForegroundColor White
Write-Host ""
Write-Host "🌐 Your site will be available at:" -ForegroundColor Green
Write-Host "   https://mahmoudhussein37.github.io/grenco/" -ForegroundColor Cyan
Write-Host ""

$choice = Read-Host "Do you want to open the GitHub secrets page now? (y/n)"
if ($choice -eq 'y' -or $choice -eq 'Y') {
    Start-Process "https://github.com/mahmoudhussein37/grenco/settings/secrets/actions"
    Write-Host "✅ Opened GitHub secrets page in your browser" -ForegroundColor Green
}

Write-Host ""
Write-Host "💡 After adding secrets, you can trigger a new deployment by running:" -ForegroundColor Yellow
Write-Host "   git commit --allow-empty -m 'Trigger deployment with Contentful secrets'" -ForegroundColor White
Write-Host "   git push" -ForegroundColor White
