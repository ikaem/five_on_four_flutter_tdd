import 'package:five_on_four_flutter_tdd/features/core/presentation/state/controllers/notifications/controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "provider.g.dart";

@riverpod
class NotificationsAppController extends _$NotificationsAppController
    implements NotificationsController {
  @override
  Future<void> onSendMatchInvitationNotifications() {
    // TODO: implement onSendMatchInvitationNotifications
    throw UnimplementedError();
  }

  @override
  // TODO: implement receivedNotificationsStream
  Stream<String> get receivedNotificationsStream => throw UnimplementedError();
// needs notifications service

// needs to define functions

// needs to emit state changes
}
