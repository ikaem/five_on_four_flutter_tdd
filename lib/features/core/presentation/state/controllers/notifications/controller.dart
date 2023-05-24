abstract class NotificationsController {
  Stream<String> get receivedNotificationsStream;

  Future<void> onSendMatchInvitationNotifications();
}
