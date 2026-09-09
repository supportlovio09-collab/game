#!/bin/bash
set -e

echo "🔍 BondQuest Flutter Verification Script"
echo "========================================"

# Check Flutter setup
echo "✓ Checking Flutter installation..."
flutter --version

# Get dependencies
echo "✓ Installing dependencies..."
flutter pub get

# Format code
echo "✓ Formatting source code..."
dart format --set-exit-if-changed .

# Static analysis
echo "✓ Running static analysis..."
flutter analyze

# Run tests
echo "✓ Running automated gameplay tests..."
flutter test --coverage

# Build APK
echo "✓ Building release APK..."
flutter build apk --release

echo ""
echo "✅ All checks passed!"
echo "📦 APK ready at: build/app/outputs/flutter-apk/app-release.apk"
