# Women Safety App - Complete Setup Guide

## 📱 Project Overview
A Flutter mobile application for women's safety featuring:
- Emergency SOS alerts (1091, 112)
- Emergency contact management
- Safety history tracking
- Safety tips and resources
- User authentication

## 📋 Prerequisites

### Required Software
1. **Flutter SDK** (Version 3.x or higher)
2. **Android Studio** OR **Command Line Tools** (for Android development)
3. **Git** (optional, for version control)
4. **Code Editor** - VS Code or Android Studio recommended

### System Requirements
- **Windows**: Windows 10/11
- **Mac**: macOS 10.14 or later
- **Linux**: Any modern Linux distribution
- Minimum 8GB RAM (16GB recommended)
- 10GB free disk space

---

## 🚀 Step-by-Step Setup

### Step 1: Install Flutter SDK

#### Windows
1. Download Flutter from: https://docs.flutter.dev/get-started/install/windows
2. Extract to `C:\src\flutter`
3. Add to PATH:
   - Search "Environment Variables"
   - Edit PATH, add `C:\src\flutter\bin`
4. Verify: Open Command Prompt and run:
   ```cmd
   flutter --version
   ```

#### macOS
```bash
# Install Flutter via Homebrew
brew install flutter

# Or download manually from:
# https://docs.flutter.dev/get-started/install/macos

# Verify installation
flutter --version
```

#### Linux
```bash
# Download Flutter
cd ~
wget https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.x.x-stable.tar.xz

# Extract
tar xf flutter_linux_3.x.x-stable.tar.xz

# Add to PATH (add to ~/.bashrc or ~/.zshrc)
export PATH="$PATH:$HOME/flutter/bin"

# Reload shell
source ~/.bashrc  # or source ~/.zshrc

# Verify
flutter --version
```

### Step 2: Run Flutter Doctor

Run this command to check your setup:
```bash
flutter doctor
```

This will show what's missing. Common issues:
- ✗ Android toolchain → Install Android Studio
- ✗ Chrome → Install Google Chrome (for web development)
- ✗ Connected devices → Enable USB debugging (see Step 5)

### Step 3: Install Android Studio (Optional but Recommended)

1. Download from: https://developer.android.com/studio
2. Install with **Android SDK** and **Android Virtual Device**
3. Open Android Studio → **More Actions** → **SDK Manager**
4. Install:
   - Android SDK Platform (API 33 or higher)
   - Android SDK Build-Tools
   - Android Emulator

**OR use Command Line Tools only:**
```bash
# Linux/Mac
flutter config --android-sdk /path/to/android/sdk

# Windows
flutter config --android-sdk C:\Users\YourName\AppData\Local\Android\Sdk
```

### Step 4: Extract and Setup Project

1. **Extract the zip file:**
   ```bash
   unzip women_safety_app_complete.zip
   cd women_safety_app
   ```

2. **Install dependencies:**
   ```bash
   flutter pub get
   ```

3. **Verify no errors:**
   ```bash
   flutter analyze
   ```

### Step 5: Run on Your Phone (USB Debugging)

#### Enable USB Debugging on Android Phone

1. **Enable Developer Mode:**
   - Go to **Settings** → **About Phone**
   - Tap **Build Number** 7 times
   - You'll see "You are now a developer!"

2. **Enable USB Debugging:**
   - Go to **Settings** → **System** → **Developer Options**
   - Enable **"USB Debugging"**
   - Enable **"Install via USB"** (if available)

3. **Connect Phone:**
   - Connect phone to computer via USB cable
   - On phone, tap **"Always allow from this computer"** → **"Allow"**

4. **Verify Connection:**
   ```bash
   flutter devices
   ```
   You should see your phone listed (e.g., "moto g64 5G")

5. **Run the App:**
   ```bash
   flutter run
   ```

   **First build takes 2-5 minutes**. Subsequent builds are much faster!

---

## 🌐 Alternative: Run on Web Browser

If you don't have an Android phone:

```bash
flutter run -d chrome
```

Or start a web server:
```bash
flutter run -d web-server --web-port=8080
```

Then open http://localhost:8080 in your browser.

---

## 🖥️ Alternative: Run on Emulator

### Create Android Emulator (via Android Studio)

1. Open Android Studio
2. **Tools** → **Device Manager**
3. Click **"Create Virtual Device"**
4. Select **Pixel 6** or similar
5. Download system image (API 33 or 34)
6. Click **Finish**
7. Start the emulator (click ▶️ button)

### Run on Emulator

```bash
# Wait for emulator to fully boot
flutter devices

# Run the app
flutter run
```

---

## 🔧 Development Tips

### Hot Reload (While App is Running)

While the app is running, press:
- **r** - Hot reload (fast, preserves state)
- **R** - Hot restart (full restart)
- **q** - Quit
- **c** - Clear console

### Common Commands

```bash
# Clean build artifacts
flutter clean

# Reinstall dependencies
flutter pub get

# Build APK for Android
flutter build apk

# Build release APK
flutter build apk --release

# Run in release mode
flutter run --release
```

---

## 📁 Project Structure

```
women_safety_app/
├── lib/                          # Main source code
│   ├── main.dart                 # App entry point
│   ├── flutter_flow/             # Shared utilities & theme
│   ├── pages/                    # All app pages
│   │   ├── welcome_page2/        # Landing page
│   │   ├── login/                # Login page
│   │   ├── sign_up/              # Signup page
│   │   ├── dashboard_main/       # Main dashboard
│   │   ├── contacts/             # Emergency contacts
│   │   ├── history/              # Safety history
│   │   ├── safety_tips/          # Safety tips
│   │   └── terms/                # Terms & conditions
│   |── services/                 # Business logic
│   |   └── auth_service.dart     # Authentication
│   └── Python Backend/           # Python backend logic for login, signup
├── android/                      # Android native files
├── ios/                          # iOS native files (Mac only)
├── pubspec.yaml                  # Dependencies
└── README.md                     # This file
```

---

## ✨ Features

### Current Features
- ✅ User registration and login
- ✅ Emergency SOS buttons (1091, 112)
- ✅ Emergency contact management
- ✅ Safety history tracking
- ✅ Safety tips and resources
- ✅ Beautiful purple-themed UI
- ✅ Complete navigation flow

### Planned Features
- 🔄 Real-time location sharing
- 🔄 Backend API integration
- 🔄 Push notifications
- 🔄 Voice-activated SOS
- 🔄 Geofencing alerts

---

## 🐛 Troubleshooting

### "Phone not detected"
```bash
# Check ADB connection
adb devices

# Restart ADB
adb kill-server
adb start-server

# Try different USB cable/port
```

### "Flutter command not found"
- Verify Flutter is in your PATH
- Restart terminal/command prompt
- Re-run flutter installation

### "Gradle build failed"
```bash
# Clean and rebuild
flutter clean
flutter pub get
flutter run
```

### "Google Fonts errors" (on phone)
- These are warnings, not errors
- App uses fallback fonts
- Doesn't affect functionality

### "SDK license not accepted"
```bash
flutter doctor --android-licenses
# Accept all licenses
```

---

## 📞 Support & Resources

- **Flutter Documentation**: https://docs.flutter.dev/
- **Flutter Community**: https://flutter.dev/community
- **Stack Overflow**: https://stackoverflow.com/questions/tagged/flutter
- **YouTube**: Flutter Developer channel

---

## 🎯 Quick Start Checklist

- [ ] Install Flutter SDK
- [ ] Run `flutter doctor`
- [ ] Extract project zip
- [ ] Run `flutter pub get`
- [ ] Enable USB debugging on phone
- [ ] Connect phone via USB
- [ ] Run `flutter run`
- [ ] App should launch on your phone!

---

## 📝 Notes

- **Debug vs Release**: Debug mode has a banner and is slower. Release mode is optimized.
- **First Build**: Takes 2-5 minutes. Be patient!
- **Network**: Needs internet for initial package download
- **Phone Storage**: App takes ~50-100MB on phone

---

## 🔐 Security Note

This app currently uses **local storage** for authentication (SharedPreferences). For production:
- Implement proper backend authentication
- Use HTTPS for all API calls
- Encrypt sensitive data
- Implement proper session management

---

## 👥 Contributors

Created by: [Your Name]
Contact: [Your Email]

---

**Enjoy building with Flutter!** 🚀
