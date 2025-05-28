@echo off
echo ============================================
echo   Grenco Website Deployment Helper
echo ============================================
echo.

REM Check if repository name is provided
if "%1"=="" (
    echo Usage: deploy.bat [repository-name]
    echo Example: deploy.bat grenco-website
    echo.
    echo This script will:
    echo 1. Update vite.config.ts with your repository name
    echo 2. Build the project
    echo 3. Commit and push changes
    echo.
    pause
    exit /b 1
)

set REPO_NAME=%1

echo Updating vite.config.ts with repository name: %REPO_NAME%
echo.

REM Update vite.config.ts
powershell -Command "(Get-Content vite.config.ts) -replace '/grenco-website/', '/%REPO_NAME%/' | Set-Content vite.config.ts"

echo Building project...
call npm run build

if %ERRORLEVEL% neq 0 (
    echo Build failed! Please check the errors above.
    pause
    exit /b 1
)

echo.
echo Committing changes...
git add .
git commit -m "Update repository name for GitHub Pages deployment"

echo.
echo Pushing to GitHub...
git push

echo.
echo ============================================
echo   Deployment Complete!
echo ============================================
echo.
echo Your website should be available at:
echo https://YOUR_USERNAME.github.io/%REPO_NAME%/
echo.
echo Note: It may take a few minutes for GitHub Pages to deploy.
echo Check the Actions tab in your GitHub repository for deployment status.
echo.
pause
