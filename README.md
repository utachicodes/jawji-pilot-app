<p align="center">
  <img src="flutter_app/assets/logo.png" alt="JAWJI" width="120" />
</p>

<h1 align="center">JAWJI Pilot</h1>

<p align="center">
  Semi‑Autonomous Drone Delivery Platform — Client & Operator apps with sleek, light glass UI.
</p>

<p align="center">
  <a href="https://img.shields.io/badge/Flutter-3.35%2B-54C5F8?logo=flutter&logoColor=white"><img src="https://img.shields.io/badge/Flutter-3.35%2B-54C5F8?logo=flutter&logoColor=white" alt="Flutter" /></a>
  <a href="https://img.shields.io/badge/Platforms-Android%20%7C%20iOS%20%7C%20Web-lightgrey"><img src="https://img.shields.io/badge/Platforms-Android%20%7C%20iOS%20%7C%20Web-lightgrey" alt="Platforms" /></a>
  <a href="https://img.shields.io/github/license/utachicodes/jawji-pilot-app"><img src="https://img.shields.io/github/license/utachicodes/jawji-pilot-app" alt="License" /></a>
  <a href="https://img.shields.io/github/stars/utachicodes/jawji-pilot-app?style=social"><img src="https://img.shields.io/github/stars/utachicodes/jawji-pilot-app?style=social" alt="Stars" /></a>
</p>

---

## Overview

JAWJI Pilot is a two‑sided marketplace: Clients request drone deliveries; Operators accept and fly missions with flight‑sim‑grade controls. The app is built with Flutter and designed with a light, glassmorphism aesthetic, inspired by modern flight UIs.

- Client: request delivery, live tracking, transparent ETA.
- Operator: connected device dashboard, DJI‑style HUD, virtual joysticks, emergency controls.
- Cross‑platform: Android, iOS, Web.

Repository: [utachicodes/jawji-pilot-app](https://github.com/utachicodes/jawji-pilot-app)

Technical document: [docs/JAWJI_Pilot_Technical.pdf.md](docs/JAWJI_Pilot_Technical.pdf.md)

---

## Quick Start

Prereqs: Flutter (stable), optional Android SDK for device/emulator.

```bash
# From repo root
cd flutter_app
flutter pub get
flutter create .     # adds missing platform folders

# Web
flutter run -d chrome

# Android (device or emulator)
flutter devices
flutter run -d <device_id>
```

Generate branded splash & icons (optional):

```bash
flutter pub run flutter_native_splash:create
flutter pub run flutter_launcher_icons:main
```

---

## Features

- Authentication: Splash, Login (Apple/Phone actions), Register, Role Selection.
- Client: Home with map, Request Delivery form, Live Tracking.
- Operator: Connected Device screen, Drone Details with spec chips, Active Delivery with HUD + dual joysticks.
- UI/UX: Light gradients, frosted glass cards, haptics‑ready controls, portrait‑first layout.

---

## Tech Stack

- Flutter, Dart
- State: Riverpod
- Navigation: GoRouter
- Maps (placeholder), WebRTC (planned), Geolocator
- Design System: light theme + glassmorphism (custom widgets)

---

## Project Structure

```
flutter_app/
  lib/
    app.dart, main.dart
    layout/app_frame.dart
    theme.dart
    state/auth_state.dart
    widgets/
      brand.dart, brand_app_bar.dart, ui.dart
      glass.dart, gradient_bg.dart, status_chip.dart
      virtual_joystick.dart, flight_controls_widget.dart, operator_hud.dart
    screens/
      auth/ (splash, login, register, role_selection)
      client/ (client_shell, home, request_form, live_tracking)
      operator/ (operator_shell, connected_screen, drone_details_screen, active_delivery)
  pubspec.yaml
```

---

## Screenshots (WIP)

> Add device screenshots here (Login, Connected Device, Active Delivery, Client Home/Tracking).

---

## Roadmap

- Live video via flutter_webrtc + adaptive bitrate
- Google Maps integration & no‑fly overlays
- Waypoints & autopilot modes
- Chat, notifications, and mission history

---

## Contributing

PRs welcome. Please open an issue to discuss major changes first.

---

## License

MIT © JAWJI — see [LICENSE](LICENSE)


