import 'package:five_on_four_flutter_tdd/features/core/application/services/notifications/service.dart';
import 'package:five_on_four_flutter_tdd/features/core/presentation/state/controllers/notifications_listener/providers/provider.dart';
import 'package:five_on_four_flutter_tdd/libraries/firebase/cloud_functions/cloud_functions_wrapper.dart';
import 'package:five_on_four_flutter_tdd/libraries/firebase/firebase_messaging/firebase_messaging_wrapper.dart';

class NotificationsAppService extends NotificationsService {
  const NotificationsAppService({
    required FirebaseMessagingWrapper firebaseMessagingWrapper,
    required FirebaseFunctionsWrapper firebaseFunctionsWrapper,
  })  : _firebaseMessagingWrapper = firebaseMessagingWrapper,
        _firebaseFunctionsWrapper = firebaseFunctionsWrapper;

  final FirebaseMessagingWrapper _firebaseMessagingWrapper;
  final FirebaseFunctionsWrapper _firebaseFunctionsWrapper;

  @override
  Future<void> handleSendNotifications({
    required String functionName,
    required List<Map<String, dynamic>> notificationsData,
  }) async {
    await _firebaseFunctionsWrapper.sendNotifications(
      functionName: functionName,
      data: notificationsData,
    );
  }

  @override
  Stream<NotificationEntity> get receivedNotificationsStream =>
      _firebaseMessagingWrapper.getReceivedNotificationsStream();
}
