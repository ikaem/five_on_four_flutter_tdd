import 'package:five_on_four_flutter_tdd/features/core/presentation/state/controllers/notifications_listener/providers/provider.dart';

// TODO this is just test for now
abstract class NotificationsService {
  const NotificationsService();

// TODO notifications need some model for htis too
  Future<void> handleSendNotifications({
    required String functionName,
    required List<Map<String, dynamic>> notificationsData,
  });

// TODO need type
  Stream<NotificationEntity> get receivedNotificationsStream;
}


// TODO test 