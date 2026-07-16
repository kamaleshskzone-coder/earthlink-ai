# EarthLink AI - Offline Setup Guide

## 🚀 Offline Installation & Usage

This guide helps you set up and use EarthLink AI without internet access.

## 📋 Prerequisites

Download these files **before going offline**:
- Node.js (v16+) - https://nodejs.org/
- npm packages (bundled in this repo)
- All dependencies included in `package-lock.json`

## 💾 Step 1: Clone Repository Locally

```bash
# Clone the repository
git clone https://github.com/kamaleshskzone-coder/earthlink-ai.git
cd earthlink-ai

# This creates a complete local copy with all history
```

## 🔌 Step 2: Offline Installation (No Internet)

### Install all dependencies while online:
```bash
npm install
# This downloads all packages needed
```

### Create offline bundle (while still online):
```bash
# Create a package archive
npm pack
tar -czf earthlink-ai-offline.tar.gz node_modules package.json package-lock.json
```

## 🏃 Step 3: Run Offline

### Start development server (no internet needed):
```bash
npm run dev
# Server runs on http://localhost:3000
```

### Build for offline use:
```bash
npm run build
# Creates static files in /dist directory
```

## 📂 Project Structure

```
earthlink-ai/
├── index.html          # Landing page
├── README.md           # Documentation
├── package.json        # Dependencies list
├── node_modules/       # All dependencies (offline)
└── src/                # Your source code
```

## 🌐 Access Points (Offline)

| Access Method | URL | Status |
|---------------|-----|--------|
| Development Server | http://localhost:3000 | ✅ Works Offline |
| Local File | file:///path/to/index.html | ✅ Works Offline |
| Built App | /dist/index.html | ✅ Works Offline |

## 🔒 Offline Features

- ✅ No external API calls
- ✅ All dependencies bundled
- ✅ Works without internet
- ✅ Local storage support
- ✅ Standalone operation

## 🛠️ Development Offline

```bash
# Start dev server
npm run dev

# Open in browser
# http://localhost:3000

# Keep running - works without internet
```

## 📦 Bundle for Offline Distribution

```bash
# Create portable package
zip -r earthlink-ai-offline.zip . -x "node_modules/*" "dist/*"

# On another computer (after installing Node):
npm install  # Install dependencies once
npm run dev  # Run offline
```

## 🔄 Sync with Internet (Optional)

When back online:
```bash
git pull origin main
npm update
```

## 💡 Tips for Offline Use

1. **Keep Node.js installed** - Required for running the app
2. **Download dependencies** - Run `npm install` while online
3. **Use `.nojekyll`** - Enables offline static serving
4. **Static builds** - Use `npm run build` for fastest offline access
5. **Local Git** - Full repository history available locally

## ⚠️ Limitations

- Cannot fetch external APIs (when offline)
- Git push requires internet
- npm packages cannot be updated offline

## ✅ Full Offline Checklist

- [ ] Node.js v16+ installed
- [ ] Repository cloned locally
- [ ] `npm install` completed
- [ ] Development server tested
- [ ] `npm run build` successful
- [ ] Static files ready in `/dist`

---

**Status**: ✅ Ready for Offline Use
**Last Updated**: 2026-07-16
