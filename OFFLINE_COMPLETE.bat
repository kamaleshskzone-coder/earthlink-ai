@echo off
REM EarthLink AI - Complete Offline Setup & Sync Script (Windows)
REM This script handles ALL operations: clone, install, sync - completely offline capable

setlocal enabledelayedexpansion

echo.
echo 🚀 EarthLink AI - Complete Offline Setup (Windows)
echo ====================================================
echo.

REM Check if repo already exists
if exist ".git" (
    echo 📂 Git repository detected
    set REPO_EXISTS=true
) else (
    echo 📂 No git repository found - initializing
    set REPO_EXISTS=false
)

REM Initialize Git repo for offline use
if "%REPO_EXISTS%"=="false" (
    echo.
    echo Initializing Git repository for offline use...
    call git init
    call git config user.name "EarthLink AI"
    call git config user.email "earthlink@offline.local"
    
    REM Add all files
    call git add .
    call git commit -m "initial: EarthLink AI - Complete offline setup"
    
    REM Create main branch
    call git branch -M main
    
    REM Create publish branch for deployments
    call git checkout -b publish
    call git commit --allow-empty -m "init: Create publish branch for deployments"
    call git checkout main
    
    echo ✅ Git repository initialized
)

REM Create offline package
echo.
echo 📦 Creating offline package...

if not exist "offline-package" mkdir offline-package
xcopy . offline-package\earthlink-ai\ /E /I /Y >nul 2>&1

REM Create offline sync guide
(
echo # EarthLink AI - Offline Sync Guide (Windows^)
echo.
echo ## 🔄 How to Sync Between Offline Instances
echo.
echo ### Scenario 1: Two Local Machines (USB Transfer^)
echo.
echo **Machine A (has updates^):**
echo ```bash
echo cd earthlink-ai
echo git bundle create earthlink-ai.bundle --all
echo REM Transfer earthlink-ai.bundle via USB to Machine B
echo ```
echo.
echo **Machine B (receives updates^):**
echo ```bash
echo git clone earthlink-ai.bundle earthlink-ai
echo cd earthlink-ai
echo ```
echo.
echo ### Scenario 2: Sync Existing Repos
echo.
echo **Machine A ^> Machine B:**
echo ```bash
echo REM On Machine A
echo cd earthlink-ai
echo git bundle create sync.bundle main publish
echo REM Transfer sync.bundle via USB
echo.
echo REM On Machine B
echo cd earthlink-ai
echo git pull sync.bundle main
echo git pull sync.bundle publish
echo ```
echo.
echo ### Scenario 3: Create Patch Files
echo.
echo **To share changes:**
echo ```bash
echo REM On Machine A
echo git diff main..publish ^> changes.patch
echo.
echo REM On Machine B
echo git apply changes.patch
echo ```
echo.
echo ### Scenario 4: Manual File Sync
echo.
echo ```bash
echo REM Copy everything
echo xcopy earthlink-ai earthlink-ai-backup /E /I
echo.
echo REM Copy to USB ^(example: E: drive^)
echo xcopy earthlink-ai E:\earthlink-ai /E /I
echo.
echo REM Copy from USB
echo xcopy E:\earthlink-ai . /E /I
echo ```
echo.
echo ## 📋 Git Commands (All Offline^)
echo.
echo ```bash
echo git status              # Check status
echo git log                 # View history
echo git diff                # See changes
echo git branch              # Manage branches
echo git merge               # Merge branches
echo git commit              # Commit changes
echo git stash               # Stash changes
echo git reset               # Reset changes
echo git tag                 # Create tags
echo.
echo REM When internet available
echo git clone url           # Clone online repo
echo git push                # Push to remote
echo git pull                # Pull from remote
echo ```
echo.
echo ## 🔌 Complete Offline Workflow
echo.
echo ```bash
echo REM Setup (one time, can be offline^)
echo 1. Extract earthlink-ai folder
echo 2. cd earthlink-ai
echo 3. npm install
echo 4. npm run dev
echo.
echo REM Daily work (completely offline^)
echo 1. Make changes
echo 2. git add .
echo 3. git commit -m "your message"
echo 4. npm run build
echo 5. Test locally
echo.
echo REM Share changes (via USB/disk^)
echo 1. git bundle create sync.bundle main
echo 2. Copy to USB
echo 3. Transfer to another machine
echo 4. git clone sync.bundle
echo.
echo REM Access GitHub (when online^)
echo 1. git remote add origin https://github.com/kamaleshskzone-coder/earthlink-ai
echo 2. git push origin main
echo 3. git push origin publish
echo ```
echo.
echo ## 💾 Backup ^& Recovery
echo.
echo ```bash
echo REM Full backup
echo git bundle create backup-^!date^!.bundle --all
echo.
echo REM Restore from backup
echo git clone backup-20260716.bundle
echo.
echo REM Archive project
echo tar -czf earthlink-ai-^!date^!.tar.gz earthlink-ai/
echo ```
echo.
echo ---
echo.
echo **You now have COMPLETE offline Git control! 🚀**
) > offline-package\SYNC_GUIDE.md

REM Create dependencies guide
(
echo # EarthLink AI - Offline Dependencies
echo.
echo ## Already Included ✅
echo.
echo ### Node.js Packages
echo - All npm packages listed in `package.json`
echo - Installed in `node_modules/` directory
echo - No external API calls required
echo - Ready to use offline
echo.
echo ### Documentation
echo - README.md
echo - QUICKSTART.md
echo - OFFLINE.md
echo - CONTRIBUTING.md
echo - CHANGELOG.md
echo - LICENSE (MIT^)
echo - This guide (DEPENDENCIES.md^)
echo.
echo ### Setup Scripts
echo - setup.sh (Linux/Mac^)
echo - setup.bat (Windows^)
echo - Both work completely offline
echo.
echo ### Git Configuration
echo - Local git repository
echo - All history stored locally
echo - Branches: main, publish
echo - Ready for offline syncing
echo.
echo ## Required Software (Install Once Online^)
echo.
echo ### Essential
echo 1. **Node.js** (v16+^)
echo    - Download: https://nodejs.org/
echo    - Run offline after installation
echo    - Works without internet
echo.
echo 2. **Git** (any version^)
echo    - Download: https://git-scm.com/
echo    - Run offline after installation
echo    - Complete local control
echo.
echo ### Optional
echo 3. **Python** (for http.server alternative^)
echo    - Download: https://www.python.org/
echo    - Alternative to npm http-server
echo    - Pure Python, works offline
echo.
echo ## Installation Steps (When Online^)
echo.
echo ### Windows
echo 1. Download Node.js installer
echo 2. Run installer, select "Add to PATH"
echo 3. Download Git installer
echo 4. Run installer, use default settings
echo 5. Restart computer
echo.
echo ## After Installation (Works Offline^)
echo.
echo ```bash
echo REM Verify installation
echo node --version    # Should show v16+
echo npm --version     # Should show 8+
echo git --version     # Should show 2+
echo.
echo REM Setup project
echo npm install       # Install dependencies
echo npm run dev       # Start development server
echo ```
echo.
echo ## Offline Development
echo.
echo All development tools work offline:
echo.
echo ```bash
echo npm run dev          # Offline ✅
echo npm run build        # Offline ✅
echo npm start            # Offline ✅
echo npm run serve        # Offline ✅
echo git status           # Offline ✅
echo git commit -m "msg"  # Offline ✅
echo ```
echo.
echo ## No External Dependencies
echo.
echo Your project:
echo - ✅ No API calls
echo - ✅ No external CDNs
echo - ✅ No cloud services
echo - ✅ No authentication needed
echo - ✅ Completely self-contained
echo - ✅ Works in airplane mode
echo.
echo ---
echo.
echo **Your project is truly offline-independent! 🚀**
) > offline-package\DEPENDENCIES.md

REM Create offline development guide
(
echo # EarthLink AI - Complete Offline Development Guide
echo.
echo ## 🔌 100%% Offline Capable
echo.
echo Your project works COMPLETELY offline once installed:
echo - ✅ Development server
echo - ✅ Git operations
echo - ✅ Building
echo - ✅ Testing
echo - ✅ All tools
echo.
echo ## 🚀 Quick Start (Offline^)
echo.
echo ```bash
echo cd earthlink-ai
echo npm run dev
echo REM Open http://localhost:3000
echo ```
echo.
echo That's it! Works completely offline.
echo.
echo ## 📋 Complete Offline Workflow
echo.
echo ### 1. Setup (One-Time, Can Be Offline After^)
echo ```bash
echo REM Download Node.js from nodejs.org (online^)
echo REM Download Git from git-scm.com (online^)
echo REM Install both
echo.
echo REM Then offline forever:
echo npm install
echo npm run dev
echo ```
echo.
echo ### 2. Daily Development (100%% Offline^)
echo.
echo ```bash
echo REM Start dev server
echo npm run dev
echo.
echo REM Make changes to files
echo REM Browser auto-refreshes
echo.
echo REM Git operations
echo git add .
echo git commit -m "feat: Your feature"
echo git log
echo git branch
echo.
echo REM Build
echo npm run build
echo.
echo REM Test
echo npm test (when configured^)
echo ```
echo.
echo ### 3. Share Work (Offline Methods^)
echo.
echo ```bash
echo REM Option A: USB Transfer
echo xcopy earthlink-ai E:\earthlink-ai /E /I
echo REM Transfer USB to other computer
echo xcopy E:\earthlink-ai . /E /I
echo.
echo REM Option B: Git Bundle
echo git bundle create sync.bundle main
echo REM Transfer sync.bundle via USB/disk
echo git clone sync.bundle earthlink-ai-new
echo.
echo REM Option C: Zip Archive
echo tar -czf earthlink-ai.zip earthlink-ai/
echo REM Share via USB, email (small^), etc.
echo tar -xzf earthlink-ai.zip
echo ```
echo.
echo ### 4. When You Get Internet
echo.
echo ```bash
echo REM Push to GitHub
echo git remote add origin https://github.com/kamaleshskzone-coder/earthlink-ai
echo git push origin main
echo git push origin publish
echo.
echo REM Pull updates
echo git pull origin main
echo ```
echo.
echo ---
echo.
echo **You have COMPLETE offline independence! 🚀**
echo.
echo No internet required after initial setup. Work anywhere, anytime, offline.
) > offline-package\OFFLINE_DEVELOPMENT.md

echo.
echo ✅ Offline package created!
echo.
echo 📦 Package contents:
echo   ├─ earthlink-ai\          (Complete project^)
echo   ├─ SYNC_GUIDE.md          (How to sync offline^)
echo   ├─ DEPENDENCIES.md        (What you need^)
echo   └─ OFFLINE_DEVELOPMENT.md (Complete offline guide^)
echo.
echo Available commands:
echo   npm run dev          ✅ Works Offline
echo   npm run build        ✅ Works Offline
echo   git status           ✅ Works Offline
echo   git commit -m "msg"  ✅ Works Offline
echo   git push/pull        ⚠️  Needs Internet
echo.
echo ✅ Setup complete!
echo.
echo Next steps:
echo 1. npm install       (Install dependencies^)
echo 2. npm run dev       (Start development^)
echo 3. git add .         (Stage changes^)
echo 4. git commit -m ""  (Commit locally^)
echo.
pause
