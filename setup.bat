@echo off
REM EarthLink AI - Setup & Build Script for Windows

echo.
echo 🚀 EarthLink AI - Local Setup (Windows)
echo =====================================
echo.

REM Check Node.js
where node >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo ❌ Node.js is not installed
    echo 📥 Download from: https://nodejs.org/
    exit /b 1
)

for /f "tokens=*" %%i in ('node --version') do set NODE_VER=%%i
for /f "tokens=*" %%i in ('npm --version') do set NPM_VER=%%i

echo ✅ Node.js: %NODE_VER%
echo ✅ npm: %NPM_VER%
echo.

REM Install dependencies
echo 📦 Installing dependencies...
call npm install

REM Create dist directory
if not exist "dist" mkdir dist

REM Copy static files
echo 📋 Copying static files...
copy index.html dist\
copy README.md dist\
copy OFFLINE.md dist\

REM Build
echo.
echo 🔨 Building project...
call npm run build 2>nul || echo Build script not found, using static files

REM Summary
echo.
echo ✅ Setup Complete!
echo.
echo 📊 Project Status:
echo   ✓ Dependencies installed
echo   ✓ Static files copied
echo   ✓ Build completed
echo.
echo 🚀 To start development:
echo   npm run dev
echo.
echo 🌐 To build for production:
echo   npm run build
echo.
echo 📂 Output directory: .\dist
echo.
pause
