import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:five_on_four_flutter_tdd/features/core/presentation/state/controllers/notifications_listener/providers/provider.dart';

class FirebaseMessagingWrapper {
  // FUTURE use permission handler later to request permission on initialization

  late final FirebaseMessaging _firebaseMessaging;
  FirebaseMessaging get firebaseMessaging => _firebaseMessaging;

  bool _isPermissionGranted = false;
  bool get isPermissionGranted => _isPermissionGranted;

  Future<void> initialize() async {
    _firebaseMessaging = FirebaseMessaging.instance;
    final NotificationSettings notificationSettings =
        await _firebaseMessaging.requestPermission(
      alert: true,
      badge: true,
      provisional: false,
      sound: true,
    );

    final bool isPermissionGranted = notificationSettings.authorizationStatus ==
        AuthorizationStatus.authorized;

    _isPermissionGranted = isPermissionGranted;
  }

  Future<String?> getDeviceToken() async {
    final String? token = await firebaseMessaging.getToken();

    return token;
  }

  Stream<NotificationEntity> getReceivedNotificationsStream() {
    // FUTURE make sure this is caught by the ui controller
    if (!_isPermissionGranted) {
      // FUTURE make better error
      throw Exception("Permission not granted");
    }

    final Stream<NotificationEntity> stream =
        FirebaseMessaging.onMessage.map((message) {
      final NotificationEntity notificationEntity = NotificationEntity(
        title: message.notification?.title ?? "",
        body: message.notification?.body ?? "",
      );

      return notificationEntity;
    });

    return stream;
  }
}
