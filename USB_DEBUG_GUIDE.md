# Run App on Your Phone via USB Debugging

## Prerequisites
- Android phone
- USB cable
- Flutter SDK installed on your Linux machine

## Step-by-Step Instructions

### 1. Enable USB Debugging on Your Phone

**On your Android phone:**
1. Go to **Settings** → **About Phone**
2. Tap **Build Number** 7 times (you'll see "You are now a developer!")
3. Go back to **Settings** → **System** → **Developer Options**
4. Enable **USB Debugging**
5. Enable **Install via USB** (if available)

### 2. Connect Your Phone

1. Connect your phone to your Linux machine via USB cable
2. On your phone, you'll see a popup asking "Allow USB debugging?"
3. Tap **"Always allow from this computer"** and **"Allow"**

### 3. Verify Connection

Run this command to check if Flutter detects your phone:
```bash
cd /home/meerpi/curr_project/EPICS/women_safety_app
./flutter_tool/bin/flutter devices
```

You should see your phone listed (e.g., "SM-G998B" or similar).

### 4. Run the App on Your Phone

Simply run:
```bash
./flutter_tool/bin/flutter run
```

Flutter will automatically:
- Detect your connected phone
- Build the APK
- Install it on your phone
- Launch the app

**First build takes 2-5 minutes.** Subsequent builds are much faster!

### 5. Hot Reload During Development

While the app is running on your phone:
- Press **`r`** in the terminal for hot reload (fast updates)
- Press **`R`** for hot restart (full restart)
- Press **`q`** to quit

## Troubleshooting

### Phone Not Detected?
```bash
# Check if adb detects your device
adb devices

# If no devices shown:
# 1. Try a different USB cable
# 2. Try a different USB port
# 3. Restart adb:
adb kill-server
adb start-server
```

### Permission Denied?
```bash
# Add udev rules for Android devices
sudo usermod -aG plugdev $USER
# Then log out and log back in
```

### Build Failed?
```bash
# Clean and rebuild
./flutter_tool/bin/flutter clean
./flutter_tool/bin/flutter pub get
./flutter_tool/bin/flutter run
```

## Advantages of USB Debugging

✅ **Real device testing** - See how it actually works on a phone  
✅ **Faster than emulator** - No heavy emulator overhead  
✅ **Test real sensors** - GPS, camera, accelerometer, etc.  
✅ **Hot reload works** - Make changes and see them instantly  
✅ **No Android Studio needed** - Just Flutter CLI

## Notes

- Your phone stays connected during development
- You can unplug and the app stays installed
- Each `flutter run` reinstalls the latest version
- The app is in debug mode (has debug banner)

Enjoy testing on your real device! 📱
