import 'package:five_on_four_flutter_tdd/features/core/application/services/notifications/service.dart';
import 'package:five_on_four_flutter_tdd/libraries/firebase/firebase_messaging/firebase_messaging_wrapper.dart';

class NotificationsAppService extends NotificationsService {
  const NotificationsAppService({
    required FirebaseMessagingWrapper firebaseMessagingWrapper,
  }) : _firebaseMessagingWrapper = firebaseMessagingWrapper;

  final FirebaseMessagingWrapper _firebaseMessagingWrapper;

  @override
  Future<void> handleSendMatchInvitationNotifications() async {}

  @override
  Stream<String> get receivedNotificationsStream =>
      // TODO not sure if this call, in case of an error, will be caught by UI
      _firebaseMessagingWrapper.getReceivedNotificationsStream();
}
