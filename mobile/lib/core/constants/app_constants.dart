class AppConstants {
  // App Info
  static const String appName = 'KisanSaathi';
  static const String appVersion = '1.0.0';
  
  // API & Backend
  static const String apiBaseUrl = 'https://api.kisansaathi.com';
  static const int apiTimeout = 30000; // milliseconds
  
  // Hive Boxes
  static const String userBoxName = 'user_box';
  static const String fieldsBoxName = 'fields_box';
  static const String cropsBoxName = 'crops_box';
  static const String alertsBoxName = 'alerts_box';
  static const String settingsBoxName = 'settings_box';
  
  // SharedPreferences Keys
  static const String languageKey = 'language';
  static const String themeKey = 'theme';
  static const String isFirstLaunchKey = 'is_first_launch';
  static const String fcmTokenKey = 'fcm_token';
  static const String userIdKey = 'user_id';
  static const String isGuestKey = 'is_guest';
  
  // Notification Channels
  static const String alertChannelId = 'kisan_saathi_alerts';
  static const String alertChannelName = 'Crop Alerts';
  static const String alertChannelDescription = 'Notifications for crop care and management';
  
  // Date Formats
  static const String dateFormat = 'dd MMM yyyy';
  static const String dateTimeFormat = 'dd MMM yyyy, hh:mm a';
  static const String timeFormat = 'hh:mm a';
  
  // Pagination
  static const int pageSize = 20;
  
  // Location
  static const double defaultLatitude = 28.7041; // Delhi
  static const double defaultLongitude = 77.1025;
  
  // Image
  static const int maxImageSize = 5 * 1024 * 1024; // 5MB
  static const int imageQuality = 85;
}
