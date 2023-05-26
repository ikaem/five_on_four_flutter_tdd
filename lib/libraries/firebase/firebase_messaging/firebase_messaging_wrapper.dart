import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:five_on_four_flutter_tdd/features/core/presentation/state/controllers/notifications_listener/providers/provider.dart';

class FirebaseMessagingWrapper {
  // TODO this should also request permission on initialization
  // for now, this is done by firebase_messaging package
  // later, do it with permissions_handler package

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

// TODO make sure for auth part, this is also consumed by service, not by provider
// TODO not sure if this should be here
  Future<String?> getDeviceToken() async {
    final String? token = await firebaseMessaging.getToken();

    return token;
  }

  // TODO we now want to expose the stream only if the user has granted permission

// TODO later, convert this to a new type that the app can use better
  Stream<NotificationEntity> getReceivedNotificationsStream() {
    // TODO lets just trow error, see what is up
    // TODO not sure if i should be throwing error here, isntead of in the service?
    if (!_isPermissionGranted) {
      // TODO make better error
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
