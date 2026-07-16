# EarthLink AI - Quick Start Guide

## 🚀 Get Started in 3 Steps

### Step 1: Clone Repository
```bash
git clone https://github.com/kamaleshskzone-coder/earthlink-ai.git
cd earthlink-ai
```

### Step 2: Run Setup Script

**On Linux/Mac:**
```bash
chmod +x setup.sh
./setup.sh
```

**On Windows:**
```bash
setup.bat
```

### Step 3: Start Development
```bash
npm run dev
# Opens http://localhost:3000
```

---

## 📋 What Gets Set Up

- ✅ Node.js dependencies installed
- ✅ Static files ready
- ✅ Development server configured
- ✅ Build artifacts prepared

## 🌐 Access Your Project

| Method | Command | URL |
|--------|---------|-----|
| **Dev Server** | `npm run dev` | http://localhost:3000 |
| **Static Serve** | `npm start` | http://localhost:3000 |
| **Python Server** | `npm run serve` | http://localhost:3000 |
| **Direct File** | Open `index.html` | file:/// |

## 📂 Project Structure

```
earthlink-ai/
├── index.html          # Landing page
├── README.md           # Main documentation
├── OFFLINE.md          # Offline setup guide
├── CONTRIBUTING.md     # Contributing guidelines
├── CHANGELOG.md        # Version history
├── LICENSE             # MIT License
├── package.json        # Dependencies
├── setup.sh            # Linux/Mac setup
├── setup.bat           # Windows setup
├── dist/               # Build output
└── .gitignore          # Git ignore rules
```

## 🔧 Available Commands

```bash
# Development
npm run dev            # Start dev server

# Production
npm run build          # Build for production
npm start              # Start static server

# Alternative
npm run serve          # Python server (no node needed)

# Testing
npm test               # Run tests (when configured)
```

## 💡 Offline Use

See [OFFLINE.md](OFFLINE.md) for detailed offline setup instructions.

## 🐛 Troubleshooting

### Port 3000 already in use?
```bash
# Use different port
npx http-server -p 8080
```

### npm not found?
- Install Node.js from https://nodejs.org/
- Restart terminal/command prompt

### Permission denied (setup.sh)?
```bash
chmod +x setup.sh
./setup.sh
```

---

## 📞 Support

- 📖 [Full Documentation](README.md)
- 🤝 [Contributing Guide](CONTRIBUTING.md)
- 📝 [Changelog](CHANGELOG.md)
- 🔒 [License](LICENSE)

**Ready to go! 🚀**
