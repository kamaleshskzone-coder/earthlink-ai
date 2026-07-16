# Contributing to EarthLink AI

Thank you for your interest in contributing to EarthLink AI! This document provides guidelines and instructions for contributing.

## 🤝 Code of Conduct

- Be respectful and inclusive
- Focus on constructive feedback
- Help others learn and grow
- Report issues professionally

## 🐛 Reporting Issues

Before creating an issue:
1. Check existing issues
2. Provide clear description
3. Include reproduction steps
4. Attach relevant files/screenshots

**Issue template:**
```
**Description**: What's the problem?
**Steps to Reproduce**: How to recreate it?
**Expected Behavior**: What should happen?
**Actual Behavior**: What happens instead?
**Environment**: OS, Node version, etc.
```

## 🎯 Feature Requests

**Before suggesting:**
- Check if feature exists
- Explain the use case
- Provide examples if possible

**Template:**
```
**Feature**: Brief title
**Problem**: What problem does it solve?
**Solution**: How should it work?
**Alternatives**: Other approaches considered?
```

## 📝 Pull Request Process

### 1. Fork Repository
```bash
git clone https://github.com/YOUR-USERNAME/earthlink-ai.git
cd earthlink-ai
git checkout -b feature/your-feature-name
```

### 2. Make Changes
```bash
# Install dependencies
npm install

# Test your changes
npm run dev

# Build for production
npm run build
```

### 3. Commit with Clear Messages
```bash
git add .
git commit -m "type: Short description

Detailed explanation if needed.
- Point 1
- Point 2"
```

**Commit types:**
- `feat:` New feature
- `fix:` Bug fix
- `docs:` Documentation
- `style:` Code style
- `refactor:` Code refactoring
- `perf:` Performance
- `test:` Tests
- `ci:` CI/CD
- `chore:` Maintenance

### 4. Push & Create PR
```bash
git push origin feature/your-feature-name
```

Then open a PR on GitHub with:
- Clear title
- Detailed description
- Link to related issues
- Screenshots (if applicable)

## 📋 PR Review Checklist

- [ ] Code follows project style
- [ ] Tests pass (if applicable)
- [ ] Documentation updated
- [ ] No breaking changes
- [ ] Commits are clean
- [ ] PR description is clear

## 🧪 Testing

```bash
# Run tests
npm test

# Test locally
npm run dev

# Build test
npm run build
```

## 📚 Documentation

- Update README.md for major changes
- Add comments for complex code
- Keep docs in sync with code
- Use clear, concise language

## 🎨 Code Style

- Use consistent indentation (2 spaces)
- Clear variable/function names
- Comment complex logic
- Remove debug code before PR

## 🚀 Development Workflow

1. **Clone & Setup**
   ```bash
   git clone https://github.com/kamaleshskzone-coder/earthlink-ai.git
   cd earthlink-ai
   ./setup.sh  # or setup.bat on Windows
   ```

2. **Create Feature Branch**
   ```bash
   git checkout -b feature/your-feature
   ```

3. **Develop & Test**
   ```bash
   npm run dev
   ```

4. **Commit & Push**
   ```bash
   git add .
   git commit -m "feat: Your feature"
   git push origin feature/your-feature
   ```

5. **Create Pull Request**
   - Fill in PR template
   - Link related issues
   - Request review

## 📖 Documentation Structure

```
docs/
├── README.md          # Main docs
├── QUICKSTART.md      # Getting started
├── OFFLINE.md         # Offline setup
├── CONTRIBUTING.md    # This file
├── CHANGELOG.md       # Version history
└── API.md             # API docs (future)
```

## 🔄 Sync with Main

Keep your branch up to date:
```bash
git fetch upstream
git rebase upstream/main
```

## ❌ Do Not

- Commit `node_modules/`
- Add API keys or secrets
- Make breaking changes without discussion
- Submit PRs without issues
- Ignore test failures

## ✅ Do

- Write meaningful commit messages
- Keep PRs focused and small
- Test before submitting
- Update documentation
- Link related issues
- Be respectful in discussions

## 🎓 Getting Help

- Read [README.md](README.md)
- Check [QUICKSTART.md](QUICKSTART.md)
- Review [OFFLINE.md](OFFLINE.md)
- Open an issue with questions
- Join discussions

## 📞 Contact

- **Issues**: For bugs and features
- **Discussions**: For questions and ideas
- **Email**: kamaleshsk.zone@gmail.com

## 📄 License

By contributing, you agree that your contributions will be licensed under the MIT License.

---

**Thank you for contributing to EarthLink AI! 🚀**
