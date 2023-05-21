import 'package:flutter_dotenv/flutter_dotenv.dart';

// TODO move to dotenv wrapper. also, make that wrapper does this
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
  static String get weatherApiKey => dotenv.env[_envVarWeatherApiKey]!;

  // firebase
  static String get firebaseAndroidApiKey =>
      dotenv.env[_firebaseAndroidApiKey]!;
  static String get firebaseAndroidAppId => dotenv.env[_firebaseAndroidAppId]!;
  static String get firebaseAndroidMessagingSenderId =>
      dotenv.env[_firebaseAndroidMessagingSenderId]!;
  static String get firebaseAndroidProjectId =>
      dotenv.env[_firebaseAndroidProjectId]!;
  static String get firebaseAndroidStorageBucket =>
      dotenv.env[_firebaseAndroidStorageBucket]!;

  static String get firebaseIOSApiKey => dotenv.env[_firebaseIOSApiKey]!;
  static String get firebaseIOSAppId => dotenv.env[_firebaseIOSAppId]!;
  static String get firebaseIOSMessagingSenderId =>
      dotenv.env[_firebaseIOSMessagingSenderId]!;
  static String get firebaseIOSProjectId => dotenv.env[_firebaseIOSProjectId]!;
  static String get firebaseIOSStorageBucket =>
      dotenv.env[_firebaseIOSStorageBucket]!;
  static String get firebaseIOSClientId => dotenv.env[_firebaseIOSClientId]!;
  static String get firebaseIOSBundleId => dotenv.env[_firebaseIOSBundleId]!;
}
