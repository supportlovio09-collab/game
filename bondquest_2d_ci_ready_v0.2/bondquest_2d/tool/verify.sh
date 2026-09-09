#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
command -v flutter >/dev/null || { echo 'Flutter SDK not found'; exit 1; }
flutter --version
if [ ! -d android ]; then
  flutter create --platforms=android --org tech.mrvr .
fi
flutter pub get
dart format lib test
flutter analyze --fatal-infos
flutter test --reporter expanded
flutter build apk --release
printf '\nPASS: build/app/outputs/flutter-apk/app-release.apk\n'
