# KisanSaathi Mobile - Quick Start Guide

## 🚀 Quick Setup (5 minutes)

### Step 1: Install Dependencies
```bash
cd mobile
flutter pub get
```

### Step 2: Run Code Generation (Important!)
The app uses Freezed for models. Generate the required files:
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

### Step 3: Configure Firebase (Required for full functionality)

**Option A: Use Demo Mode (Skip Firebase for now)**
- The app will work in limited mode without Firebase
- Some features like authentication will not work

**Option B: Setup Firebase (Recommended)**
1. Create a Firebase project at https://console.firebase.google.com/
2. Add Android app with package: `com.kisansaathi.kisan_saathi`
3. Download `google-services.json` and place in `android/app/`
4. Add iOS app with bundle ID: `com.kisansaathi.kisanSaathi`
5. Download `GoogleService-Info.plist` and place in `ios/Runner/`

See `FIREBASE_SETUP.md` for detailed instructions.

### Step 4: Run the App
```bash
flutter run
```

---

## 📱 First Launch Experience

When you run the app for the first time:

1. **Splash Screen** (3 seconds)
   - Shows app logo and name

2. **Language Selection**
   - Choose from English, Hindi, or Punjabi

3. **Authentication**
   - Enter phone number for OTP
   - OR continue as Guest

4. **Onboarding**
   - Select your region
   - Choose typical crops you grow

5. **Home Screen**
   - Dashboard with stats
   - Empty state for crops
   - Bottom navigation

---

## 🎯 Testing the App Without Firebase

If you haven't setup Firebase yet, you can still test:

1. **Comment out Firebase initialization** in `lib/main.dart`:
```dart
// await FirebaseService.instance.init();
```

2. **Use Guest Mode**:
   - On auth screen, tap "Continue as Guest"
   - This will bypass phone authentication

3. **Navigate the UI**:
   - Explore the dashboard
   - Check alerts screen
   - View journal
   - Open settings

---

## 🔧 Development Commands

### Run with hot reload
```bash
flutter run
```

### Build for Android
```bash
flutter build apk --debug
```

### Build for iOS (Mac only)
```bash
flutter build ios --debug
```

### Clean and rebuild
```bash
flutter clean
flutter pub get
flutter run
```

### Generate code (watch mode)
```bash
flutter pub run build_runner watch
```

### Run tests
```bash
flutter test
```

---

## 📂 Key Files to Check

- `lib/main.dart` - App entry point
- `lib/core/theme/app_theme.dart` - Theme configuration
- `lib/core/constants/app_colors.dart` - Color scheme
- `assets/translations/*.json` - Language files
- `lib/features/*/presentation/screens/` - UI screens

---

## 🐛 Common Issues & Fixes

### Issue: Build runner fails
```bash
flutter clean
flutter pub get
flutter pub run build_runner clean
flutter pub run build_runner build --delete-conflicting-outputs
```

### Issue: Missing google-services.json
Either:
1. Add the file from Firebase Console
2. Or comment out Firebase initialization (demo mode)

### Issue: iOS build fails
```bash
cd ios
pod deintegrate
pod install
cd ..
flutter clean
flutter run
```

### Issue: Version conflicts
```bash
flutter pub upgrade --major-versions
```

---

## 🎨 Current Features Implemented

✅ Splash screen with animation
✅ Language selection (English, Hindi, Punjabi)
✅ Phone OTP authentication
✅ Guest mode
✅ User onboarding flow
✅ Home dashboard
✅ Bottom navigation
✅ Settings screen
✅ Empty states for future features

---

## 📚 Next Steps

1. **For Designers**: 
   - Add app logo to `assets/images/`
   - Customize colors in `app_colors.dart`

2. **For Developers**:
   - Complete Phase 2: Field & Crop Management
   - Implement Timeline & Phenology Engine
   - Add Alert System

3. **For Testers**:
   - Test on real devices
   - Check all screen flows
   - Report UI issues

---

## 💡 Tips

- Use **hot reload** (press 'r' in terminal) for quick changes
- Use **hot restart** (press 'R') for state reset
- Check `DEVELOPMENT_GUIDE.md` for detailed documentation
- Check `PROGRESS.md` for development status

---

## 🆘 Need Help?

- Read `DEVELOPMENT_GUIDE.md` for detailed setup
- Check `FIREBASE_SETUP.md` for Firebase configuration
- Review `PROGRESS.md` for project status
- Check Flutter docs: https://docs.flutter.dev

---

## ✨ You're Ready!

The foundation is complete. Start developing new features or explore the existing code!

Happy Coding! 🚀
