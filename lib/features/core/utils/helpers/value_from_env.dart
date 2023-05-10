abstract class ValueFromEnv {
  // weather
  static const _envVarWeatherApiKey = 'WEATHER_API_KEY';

  // firebase
  static const _firebaseAndroidApiKey = 'FIREBASE_ANDROID_API_KEY';
  static const _firebaseAndroidAppId = 'FIREBASE_ANDROID_APP_ID';
  static const _firebaseAndroidMessagingSenderId =
      'FIREBASE_ANDROID_MESSAGING_SENDER_ID';
  static const _firebaseAndroidProjectId = 'FIREBASE_ANDROID_PROJECT_ID';
  static const _firebaseAndroidStorageBucket =
      'FIREBASE_ANDROID_STORAGE_BUCKET';

  static const _firebaseIOSApiKey = 'FIREBASE_IOS_API_KEY';
  static const _firebaseIOSAppId = 'FIREBASE_IOS_APP_ID';
  static const _firebaseIOSMessagingSenderId =
      'FIREBASE_IOS_MESSAGING_SENDER_ID';
  static const _firebaseIOSProjectId = 'FIREBASE_IOS_PROJECT_ID';
  static const _firebaseIOSStorageBucket = 'FIREBASE_IOS_STORAGE_BUCKET';
  static const _firebaseIOSClientId = 'FIREBASE_IOS_CLIENT_ID';
  static const _firebaseIOSBundleId = 'FIREBASE_IOS_BUNDLE_ID';

  // weather
  static String get weatherApiKey =>
      const String.fromEnvironment(_envVarWeatherApiKey);

  // firebase
  static String get firebaseAndroidApiKey =>
      const String.fromEnvironment(_firebaseAndroidApiKey);
  static String get firebaseAndroidAppId =>
      const String.fromEnvironment(_firebaseAndroidAppId);
  static String get firebaseAndroidMessagingSenderId =>
      const String.fromEnvironment(_firebaseAndroidMessagingSenderId);
  static String get firebaseAndroidProjectId =>
      const String.fromEnvironment(_firebaseAndroidProjectId);
  static String get firebaseAndroidStorageBucket =>
      const String.fromEnvironment(_firebaseAndroidStorageBucket);

  static String get firebaseIOSApiKey =>
      const String.fromEnvironment(_firebaseIOSApiKey);
  static String get firebaseIOSAppId =>
      const String.fromEnvironment(_firebaseIOSAppId);
  static String get firebaseIOSMessagingSenderId =>
      const String.fromEnvironment(_firebaseIOSMessagingSenderId);
  static String get firebaseIOSProjectId =>
      const String.fromEnvironment(_firebaseIOSProjectId);
  static String get firebaseIOSStorageBucket =>
      const String.fromEnvironment(_firebaseIOSStorageBucket);
  static String get firebaseIOSClientId =>
      const String.fromEnvironment(_firebaseIOSClientId);
  static String get firebaseIOSBundleId =>
      const String.fromEnvironment(_firebaseIOSBundleId);
}
