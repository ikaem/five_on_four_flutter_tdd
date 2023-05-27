import 'package:five_on_four_flutter_tdd/features/core/presentation/state/controllers/notifications_listener/providers/provider.dart';

abstract class NotificationsService {
  const NotificationsService();

  // TODO this is not needed, because each service will get firebaseFunctionsWrapper
  // Future<void> handleSendNotifications({
  //   required String functionName,
  //   required List<Map<String, dynamic>> notificationsData,
  // });

  Stream<NotificationEntity> get receivedNotificationsStream;
}
