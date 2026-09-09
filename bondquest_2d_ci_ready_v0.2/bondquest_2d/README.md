# BondQuest 2D — CI-ready Prototype 0.2

A dependency-free Flutter 2D vertical slice for couples and families.

## Playable now
- Couple/Family mode selection
- Custom-painted 2D world map
- On-map player movement
- Three selectable zones
- Heart Catch, Memory Match, and Rapid Tap mini-games
- Hearts/score and completed-level state
- Marathi-first UI
- No external assets, ads, login, network, permissions, or runtime packages

## Confirm it is playable

### Automatic GitHub proof
Push this folder to GitHub and open **Actions → BondQuest Flutter CI → Run workflow**. The workflow generates the Android runner, formats and analyzes the source, runs gameplay tests, builds a release APK, and uploads `bondquest-2d-release-apk`.

A green workflow plus successful installation and play on a real Android phone is the release gate.

### Local proof
```bash
chmod +x tool/verify.sh
./tool/verify.sh
```

The command must finish with `PASS` and produce `build/app/outputs/flutter-apk/app-release.apk`.

## Downloadable Play module
`lib/downloadable_entry.dart` is the stable game entry point. See `android_delivery/README.md`. Final Play Feature Delivery wiring requires the current host app because Flutter, Gradle, AGP, package name, signing, and navigation setup must match it exactly.

## Current limitations
This is the first vertical slice, not the final content-complete game. Persistence, audio/haptics, localization files, character customization, production sprites, accessibility review, and host integration remain for later milestones.
