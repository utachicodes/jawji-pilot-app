# JAWJI Pilot (Flutter)

This is the Flutter rewrite of JAWJI Pilot: a two‑sided drone delivery platform with semi‑autonomous flight and pilot‑grade controls.

## Prerequisites
- Install Flutter (latest stable): https://docs.flutter.dev/get-started/install
- Set up Android Studio or Xcode for device builds
- Enable platform tooling (Android SDK / iOS toolchain)

## First Run
```bash
cd flutter_app
flutter pub get
# Generate missing platform folders (android/ios/web/macos/windows/linux as needed)
flutter create .
# Run on a device/emulator or web
flutter run        # selects a device
flutter run -d chrome
```

## Included
- Riverpod state (auth, role)
- GoRouter navigation with client/operator shells and bottom nav
- Auth flow (splash, login, register, role selection)
- Client flow (home, request form, live tracking placeholder)
- Operator flow (dashboard, request list, active delivery with flight controls)
- Virtual joysticks and emergency controls (placeholders for control link)

## Next Steps
- Wire up Google Maps (google_maps_flutter) with API keys
- Integrate WebRTC (flutter_webrtc) for video + control data channels
- Implement WebSocket/WebRTC signaling server
- Add permissions (geolocator/permission_handler) for location
- Notifications via flutter_local_notifications / Firebase Messaging
- Production theming and animation polish

## Notes
- This skeleton is platform‑ready after `flutter create .`
- Keep secrets (API keys) in secure configs, not checked in


