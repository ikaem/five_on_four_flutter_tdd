import 'package:five_on_four_flutter_tdd/features/core/presentation/state/controllers/notifications_listener/providers/provider.dart';

abstract class NotificationsService {
  const NotificationsService();

  Stream<NotificationEntity> get receivedNotificationsStream;
}
