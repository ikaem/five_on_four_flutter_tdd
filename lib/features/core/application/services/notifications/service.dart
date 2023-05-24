abstract class NotificationsService {
  const NotificationsService();

  Future<void> handleSendMatchInvitationNotifications();
  Stream<String> get receivedNotificationsStream;
}
