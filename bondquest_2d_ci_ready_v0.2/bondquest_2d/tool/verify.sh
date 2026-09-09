#!/bin/bash
set -e

echo "🔍 BondQuest Flutter Verification Script (v0.2)"
echo "============================================="
echo ""

# Check Flutter setup
echo "✓ Checking Flutter installation..."
flutter --version
echo ""

# Get dependencies
echo "✓ Installing dependencies..."
flutter pub get
echo ""

# Format code
echo "✓ Formatting source code..."
dart format --set-exit-if-changed .
echo ""

# Static analysis
echo "✓ Running static analysis..."
flutter analyze
echo ""

# Run tests
echo "✓ Running automated gameplay tests..."
flutter test --coverage
echo ""

# Build APK
echo "✓ Building release APK..."
flutter build apk --release
echo ""

echo "✅ PASS - All checks passed!"
echo "📦 APK ready at: build/app/outputs/flutter-apk/app-release.apk"
echo ""
echo "Manual Testing Checklist:"
echo "  □ Install APK on Android phone"
echo "  □ Test Couple/Family selection"
echo "  □ Navigate world map"
echo "  □ Play all 3 mini-games (Heart Catch, Memory Match, Rapid Tap)"
echo "  □ Verify scoring system"
echo "  □ Test back navigation"
echo "  □ Test small screen layout"
echo "  □ Test large screen layout"
echo ""
echo "Result: Green CI ✅ + Phone gameplay ✅ = Playable confirmed ✅"
