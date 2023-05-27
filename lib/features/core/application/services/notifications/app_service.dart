import 'package:five_on_four_flutter_tdd/features/core/application/services/notifications/service.dart';
import 'package:five_on_four_flutter_tdd/features/core/presentation/state/controllers/notifications_listener/providers/provider.dart';
import 'package:five_on_four_flutter_tdd/libraries/firebase/firebase_messaging/firebase_messaging_wrapper.dart';

class NotificationsAppService extends NotificationsService {
  const NotificationsAppService({
    required FirebaseMessagingWrapper firebaseMessagingWrapper,
  }) : _firebaseMessagingWrapper = firebaseMessagingWrapper;

  final FirebaseMessagingWrapper _firebaseMessagingWrapper;

  @override
  Stream<NotificationEntity> get receivedNotificationsStream =>
      _firebaseMessagingWrapper.getReceivedNotificationsStream();
}
