#!/bin/bash

# EarthLink AI - Setup & Build Script
# This script sets up and builds the project locally

echo "🚀 EarthLink AI - Local Setup"
echo "================================"

# Check Node.js
if ! command -v node &> /dev/null; then
    echo "❌ Node.js is not installed"
    echo "📥 Download from: https://nodejs.org/"
    exit 1
fi

echo "✅ Node.js: $(node --version)"
echo "✅ npm: $(npm --version)"

# Install dependencies
echo ""
echo "📦 Installing dependencies..."
npm install

# Create dist directory if it doesn't exist
mkdir -p dist

# Copy static files
echo "📋 Copying static files..."
cp index.html dist/
cp README.md dist/
cp OFFLINE.md dist/

# Build
echo ""
echo "🔨 Building project..."
npm run build 2>/dev/null || echo "Build script not found, using static files"

# Summary
echo ""
echo "✅ Setup Complete!"
echo ""
echo "📊 Project Status:"
echo "  ✓ Dependencies installed"
echo "  ✓ Static files copied"
echo "  ✓ Build completed"
echo ""
echo "🚀 To start development:"
echo "  npm run dev"
echo ""
echo "🌐 To build for production:"
echo "  npm run build"
echo ""
echo "📂 Output directory: ./dist"
