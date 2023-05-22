import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseMessagingWrapper {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  Future<String?> getDeviceToken() async {
    final String? token = await _firebaseMessaging.getToken();

    return token;
  }
}
