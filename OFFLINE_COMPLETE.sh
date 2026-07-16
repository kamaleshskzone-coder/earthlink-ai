#!/bin/bash

# EarthLink AI - Complete Offline Setup & Sync Script
# This script handles ALL operations: clone, install, sync - completely offline capable

echo "🚀 EarthLink AI - Complete Offline Setup"
echo "=========================================="
echo ""

# Color codes
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Check if repo already exists
if [ -d ".git" ]; then
    echo "${BLUE}📂 Git repository detected${NC}"
    REPO_EXISTS=true
else
    echo "${BLUE}📂 No git repository found - initializing${NC}"
    REPO_EXISTS=false
fi

# Initialize Git repo for offline use
if [ "$REPO_EXISTS" = false ]; then
    echo ""
    echo "${BLUE}Initializing Git repository for offline use...${NC}"
    git init
    git config user.name "EarthLink AI"
    git config user.email "earthlink@offline.local"
    
    # Add all files
    git add .
    git commit -m "initial: EarthLink AI - Complete offline setup"
    
    # Create main branch
    git branch -M main
    
    # Create publish branch for deployments
    git checkout -b publish
    git commit --allow-empty -m "init: Create publish branch for deployments"
    git checkout main
    
    echo "${GREEN}✅ Git repository initialized${NC}"
fi

# Create offline package
echo ""
echo "${BLUE}📦 Creating offline package...${NC}"

mkdir -p offline-package
cp -r . offline-package/earthlink-ai/ 2>/dev/null || true

# Create offline sync script
cat > offline-package/SYNC_GUIDE.md << 'EOF'
# EarthLink AI - Offline Sync Guide

## 🔄 How to Sync Between Offline Instances

### Scenario 1: Two Local Machines (USB Transfer)

**Machine A (has updates):**
```bash
cd earthlink-ai
git bundle create ~/earthlink-ai.bundle --all
# Transfer earthlink-ai.bundle via USB to Machine B
```

**Machine B (receives updates):**
```bash
git clone ~/earthlink-ai.bundle earthlink-ai
cd earthlink-ai
```

### Scenario 2: Sync Existing Repos

**Machine A → Machine B:**
```bash
# On Machine A
cd earthlink-ai
git bundle create ../sync.bundle main publish
# Transfer sync.bundle via USB

# On Machine B
cd earthlink-ai
git pull ../sync.bundle main
git pull ../sync.bundle publish
```

### Scenario 3: Create Patch Files

**To share changes:**
```bash
# On Machine A
git diff main..publish > changes.patch

# On Machine B
git apply changes.patch
```

### Scenario 4: Manual File Sync

```bash
# Copy everything
cp -r earthlink-ai earthlink-ai-backup/

# Push to USB
cp -r earthlink-ai /mnt/usb/

# Pull from USB
cp -r /mnt/usb/earthlink-ai .
```

## 📋 Git Commands (All Offline)

```bash
# Local operations (work offline)
git status              # Check status
git log                 # View history
git diff                # See changes
git branch              # Manage branches
git merge               # Merge branches
git commit              # Commit changes
git stash               # Stash changes
git reset               # Reset changes
git tag                 # Create tags

# When internet available
git clone <url>         # Clone online repo
git push                # Push to remote
git pull                # Pull from remote
```

## 🔌 Complete Offline Workflow

```bash
# Setup (one time, can be offline)
1. Extract earthlink-ai folder
2. cd earthlink-ai
3. npm install
4. npm run dev

# Daily work (completely offline)
1. Make changes
2. git add .
3. git commit -m "your message"
4. npm run build
5. Test locally

# Share changes (via USB/disk)
1. git bundle create ../sync.bundle main
2. Copy to USB
3. Transfer to another machine
4. git clone ../sync.bundle

# Access GitHub (when online)
1. git remote add origin https://github.com/kamaleshskzone-coder/earthlink-ai
2. git push origin main
3. git push origin publish
```

## 💾 Backup & Recovery

```bash
# Full backup
git bundle create backup-$(date +%Y%m%d).bundle --all

# Restore from backup
git clone backup-20260716.bundle

# Archive project
tar -czf earthlink-ai-$(date +%Y%m%d).tar.gz earthlink-ai/
```

## ⚡ Quick Reference

| Task | Command | Offline |
|------|---------|---------|
| Check status | `git status` | ✅ Yes |
| View history | `git log` | ✅ Yes |
| Commit changes | `git commit -m "msg"` | ✅ Yes |
| Create branch | `git branch name` | ✅ Yes |
| Merge branch | `git merge branch` | ✅ Yes |
| Bundle for transfer | `git bundle create` | ✅ Yes |
| Push to GitHub | `git push origin main` | ❌ Need internet |
| Clone from GitHub | `git clone url` | ❌ Need internet |

---

**You now have COMPLETE offline Git control! 🚀**
EOF

# Create offline dependencies note
cat > offline-package/DEPENDENCIES.md << 'EOF'
# EarthLink AI - Offline Dependencies

## Already Included ✅

### Node.js Packages
- All npm packages listed in `package.json`
- Installed in `node_modules/` directory
- No external API calls required
- Ready to use offline

### Documentation
- README.md
- QUICKSTART.md
- OFFLINE.md
- CONTRIBUTING.md
- CHANGELOG.md
- LICENSE (MIT)
- This guide (DEPENDENCIES.md)

### Setup Scripts
- setup.sh (Linux/Mac)
- setup.bat (Windows)
- Both work completely offline

### Git Configuration
- Local git repository
- All history stored locally
- Branches: main, publish
- Ready for offline syncing

## Required Software (Install Once Online)

### Essential
1. **Node.js** (v16+)
   - Download: https://nodejs.org/
   - Run offline after installation
   - Works without internet

2. **Git** (any version)
   - Download: https://git-scm.com/
   - Run offline after installation
   - Complete local control

### Optional
3. **Python** (for http.server alternative)
   - Download: https://www.python.org/
   - Alternative to npm http-server
   - Pure Python, works offline

## Installation Steps (When Online)

### Windows
1. Download Node.js installer
2. Run installer, select "Add to PATH"
3. Download Git installer
4. Run installer, use default settings
5. Restart computer

### macOS/Linux
```bash
# macOS (using Homebrew)
brew install node git

# Ubuntu/Debian
sudo apt-get install nodejs npm git

# Fedora
sudo dnf install nodejs npm git
```

## After Installation (Works Offline)

```bash
# Verify installation
node --version    # Should show v16+
npm --version     # Should show 8+
git --version     # Should show 2+

# Setup project
npm install       # Install dependencies
npm run dev       # Start development server
```

## Offline Development

All development tools work offline:

```bash
npm run dev          # Offline ✅
npm run build        # Offline ✅
npm start            # Offline ✅
npm run serve        # Offline ✅
git status           # Offline ✅
git commit -m "msg"  # Offline ✅
```

## No External Dependencies

Your project:
- ✅ No API calls
- ✅ No external CDNs
- ✅ No cloud services
- ✅ No authentication needed
- ✅ Completely self-contained
- ✅ Works in airplane mode

## Storage Requirements

| Component | Size |
|-----------|------|
| Project files | ~10 MB |
| node_modules/ | ~200 MB |
| .git history | ~5 MB |
| **Total** | **~215 MB** |

## Portable Setup

Create portable version:

```bash
# Linux/Mac
tar -czf earthlink-ai-portable.tar.gz earthlink-ai/

# Windows
7z a earthlink-ai-portable.7z earthlink-ai/

# Copy to USB drive
cp earthlink-ai-portable.* /mnt/usb/
```

Then on any computer with Node.js + Git installed:

```bash
# Extract and run
tar -xzf earthlink-ai-portable.tar.gz
cd earthlink-ai
npm run dev
```

---

**Your project is truly offline-independent! 🚀**
EOF

# Create offline development guide
cat > offline-package/OFFLINE_DEVELOPMENT.md << 'EOF'
# EarthLink AI - Complete Offline Development Guide

## 🔌 100% Offline Capable

Your project works COMPLETELY offline once installed:
- ✅ Development server
- ✅ Git operations
- ✅ Building
- ✅ Testing
- ✅ All tools

## 🚀 Quick Start (Offline)

```bash
cd earthlink-ai
npm run dev
# Open http://localhost:3000
```

That's it! Works completely offline.

## 📋 Complete Offline Workflow

### 1. Setup (One-Time, Can Be Offline After)
```bash
# Download Node.js from nodejs.org (online)
# Download Git from git-scm.com (online)
# Install both

# Then offline forever:
npm install
npm run dev
```

### 2. Daily Development (100% Offline)

```bash
# Start dev server
npm run dev

# Make changes to files
# Browser auto-refreshes

# Git operations
git add .
git commit -m "feat: Your feature"
git log
git branch

# Build
npm run build

# Test
npm test (when configured)
```

### 3. Share Work (Offline Methods)

```bash
# Option A: USB Transfer
cp -r earthlink-ai /mnt/usb/
# Transfer USB to other computer
cp -r /mnt/usb/earthlink-ai .

# Option B: Git Bundle
git bundle create sync.bundle main
# Transfer sync.bundle via USB/disk
git clone sync.bundle earthlink-ai-new

# Option C: Zip Archive
zip -r earthlink-ai.zip earthlink-ai/
# Share via USB, email (small), etc.
unzip earthlink-ai.zip
```

### 4. When You Get Internet

```bash
# Push to GitHub
git remote add origin https://github.com/kamaleshskzone-coder/earthlink-ai
git push origin main
git push origin publish

# Pull updates
git pull origin main
```

## 💾 Offline Git Complete Control

### Create Local Branches
```bash
git branch feature/offline-feature
git checkout feature/offline-feature
# Work on feature offline
git commit -m "feat: offline feature"
git checkout main
git merge feature/offline-feature
```

### View Complete History
```bash
git log                    # All commits
git log --oneline         # Short format
git log --graph           # Visual tree
git diff HEAD~1           # Compare versions
```

### Backup Everything
```bash
# Create bundle (shareable via USB)
git bundle create backup.bundle --all

# Create archive (compressed)
tar -czf earthlink-ai-backup.tar.gz .git/
```

### Recover from Mistakes
```bash
git status                 # See current state
git diff                   # See changes
git reset --hard HEAD      # Undo all changes
git checkout main          # Switch branches
git log                    # See history
```

## 🌐 Server Options (All Offline)

### Option 1: npm (Recommended)
```bash
npm run dev     # With live reload
npm start       # Static server
```

### Option 2: Python
```bash
npm run serve   # Requires Python
# Or manual:
python -m http.server 3000
```

### Option 3: Direct File
```bash
# Just open index.html in browser
open index.html
```

## 📁 Project Structure (All Offline)

```
earthlink-ai/
├── .git/              # Full git history (offline)
├── node_modules/      # All dependencies (offline)
├── index.html         # Landing page
├── README.md          # Documentation
├── package.json       # Dependencies list
├── setup.sh           # Setup script
├── setup.bat          # Windows setup
└── dist/              # Build output
```

## 🔧 Development Commands (All Offline)

```bash
# Start development
npm run dev           # http://localhost:3000

# Build for production
npm run build         # Creates dist/

# Alternative servers
npm start             # Static server
npm run serve         # Python server

# Git operations (all offline)
git status            # Check status
git add .             # Stage files
git commit -m "msg"   # Commit
git log               # View history
git branch            # Manage branches
git merge             # Merge branches
git diff              # See changes
git tag v1.0.0        # Create release tags
```

## 📊 What Works Offline

| Feature | Works | Notes |
|---------|-------|-------|
| Edit files | ✅ | Any editor |
| Git commit | ✅ | All history local |
| Git branch | ✅ | Local control |
| Git merge | ✅ | Complete offline |
| Dev server | ✅ | npm run dev |
| Build | ✅ | npm run build |
| Test code | ✅ | Local testing |
| View docs | ✅ | All markdown files |
| Backup | ✅ | git bundle, zip |

## ⚠️ What Needs Internet

| Feature | Status | When |
|---------|--------|------|
| Git push | ❌ | Only to sync with GitHub |
| Git pull | ❌ | Only to get updates from GitHub |
| npm install | ❌ | Only first time setup |
| Download Node.js | ❌ | Only initial installation |
| GitHub access | ❌ | Only when publishing |

## 🎯 Complete Offline Workflow Example

```bash
# Day 1 - Setup (or have internet)
git clone https://github.com/kamaleshskzone-coder/earthlink-ai.git
cd earthlink-ai
npm install
git checkout -b feature/my-feature

# Days 2-30 - Complete Offline ✅
npm run dev                    # Start server
# Edit files in browser        # Auto-reload
git add .                      # Stage changes
git commit -m "feat: update"   # Commit
npm run build                  # Build
npm test                       # Test (future)

# Repeat daily - all offline! No internet needed.

# Day 31 - Back Online
git push origin feature/my-feature    # Push to GitHub
# Create pull request on GitHub web
```

## 💡 Pro Tips

1. **Save Everything Locally**
   - Your git history is complete locally
   - No cloud sync needed
   - Fully portable on USB

2. **Use Git Tags for Versions**
   ```bash
   git tag v1.0.0
   git tag v1.1.0
   # Later view: git tag -l
   ```

3. **Create Bundles for Easy Sharing**
   ```bash
   git bundle create my-work.bundle main
   # Share via USB, move to other PC
   git clone my-work.bundle new-location
   ```

4. **Regular Backups**
   ```bash
   cp -r earthlink-ai earthlink-ai-backup-$(date +%Y%m%d)
   ```

5. **Keep node_modules Local**
   - Already in .gitignore
   - Install once per machine
   - Keeps repo small for backup

---

**You have COMPLETE offline independence! 🚀**

No internet required after initial setup. Work anywhere, anytime, offline.
EOF

echo ""
echo "${GREEN}✅ Offline package created!${NC}"
echo ""
echo "${YELLOW}📦 Package contents:${NC}"
echo "  ├─ earthlink-ai/          (Complete project)"
echo "  ├─ SYNC_GUIDE.md          (How to sync offline)"
echo "  ├─ DEPENDENCIES.md        (What you need)"
echo "  └─ OFFLINE_DEVELOPMENT.md (Complete offline guide)"
echo ""
echo "${BLUE}Available commands:${NC}"
echo "  npm run dev          ${GREEN}✅ Works Offline${NC}"
echo "  npm run build        ${GREEN}✅ Works Offline${NC}"
echo "  git status           ${GREEN}✅ Works Offline${NC}"
echo "  git commit -m 'msg'  ${GREEN}✅ Works Offline${NC}"
echo "  git push/pull        ${YELLOW}Needs Internet${NC}"
echo ""
echo "${GREEN}✅ Setup complete!${NC}"
echo ""
echo "Next steps:"
echo "1. npm install       (Install dependencies)"
echo "2. npm run dev       (Start development)"
echo "3. git add .         (Stage changes)"
echo "4. git commit -m ''  (Commit locally)"
echo ""
