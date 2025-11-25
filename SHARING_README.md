# Women Safety App - Source Code

## Overview
Flutter mobile app for women's safety with emergency features, contact management, and safety tips.

## What's Included
This archive contains only the essential source code and configuration:
- `lib/` - All Dart source code (pages, models, utilities)
- `pubspec.yaml` - Dependencies and project configuration
- `pubspec.lock` - Locked dependency versions
- `analysis_options.yaml` - Linter configuration
- `README.md` - This file

## What's NOT Included (to reduce size)
- `flutter_tool/` - Flutter SDK (~1GB) - recipient needs to install Flutter separately
- `build/` - Build artifacts (regenerated on build)
- `.dart_tool/` - Build cache (regenerated on build)
- `android/` and `ios/` - Platform folders (can be regenerated with `flutter create`)

## How to Run (For Recipient)

### Prerequisites
1. Install Flutter SDK: https://docs.flutter.dev/get-started/install
2. Install dependencies:
   ```bash
   flutter pub get
   ```
3. Run the python server
    ```bash
    pip install requirements.txt

    lib\Python Backend\app.py
    ```


### Run Options

**Option 1: Web Browser (Easiest)**
```bash
flutter run -d web-server --web-port=8080
```
Then open `http://localhost:8080` in your browser.

**Option 2: Android Emulator**
1. Set up Android emulator in Android Studio
2. Start the emulator
3. Run: `flutter run`

**Option 3: iOS Simulator (Mac only)**
```bash
flutter run -d iPhone
```

## Project Structure
```
lib/
├── main.dart                 # App entry point
├── index.dart                # Barrel file (exports)
├── flutter_flow/             # Shared utilities & components
│   ├── flutter_flow_theme.dart
│   ├── flutter_flow_widgets.dart
│   ├── flutter_flow_util.dart
│   └── flutter_flow_model.dart
├── pages/                    # All app pages
│   ├── welcome_page2/        # Landing page
│   ├── login/                # Login page
│   ├── sign_up/              # Signup page
│   ├── terms/                # Terms & conditions
│   ├── dashboard_main/       # Main dashboard
│   ├── history/              # Safety history
│   ├── contacts/             # Emergency contacts
│   └── safety_tips/          # Safety tips
└── services/                 # Business logic
    └── auth_service.dart     # Authentication service
|── Python Backend/           # Python backend logic for login, signup

## Key Features
✅ User authentication (login/signup)
✅ Dashboard with quick actions
✅ Emergency contact management
✅ Safety history tracking
✅ Safety tips and resources
✅ Complete navigation flow

## Current Status
- ✅ All navigation working
- ✅ Authentication implemented (basic)
- ✅ All pages render correctly
- ✅ 0 compilation errors
- ⚠️  Backend integration pending (uses mock data)

## Notes
- Authentication is currently local-only (SharedPreferences)
- No real backend - ready for integration
- Generated using FlutterFlow and manually fixed
- Tested on web and ready for Android/iOS

## Contact
[Add your contact info here]
