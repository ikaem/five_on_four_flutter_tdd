import 'dart:async';

import 'package:five_on_four_flutter_tdd/features/core/application/services/notifications/providers/provider.dart';
import 'package:five_on_four_flutter_tdd/features/core/application/services/notifications/service.dart';
import 'package:five_on_four_flutter_tdd/features/core/presentation/state/controllers/notifications_listener/controller.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "provider.g.dart";

// TODO this is just temp - this would be change later - move to values
@immutable
class NotificationEntity {
  const NotificationEntity({
    required this.title,
    required this.body,
  });

// TODO might need more fields
  final String title;
  final String body;
}

@riverpod
class NotificationsListenerAppController
    extends _$NotificationsListenerAppController
    implements NotificationsListenerController {
  late final NotificationsService notificationsService =
      ref.read(notificationsServiceProvider);

  late final StreamSubscription<NotificationEntity>
      _receivedNotificationsStreamSubscription;

  @override
  AsyncValue<NotificationEntity?> build() {
    _onInitializeController();
    _onDisposeController();

    return AsyncValue.data(null);
  }

  // TODO
  @override
  Future<void> dispose() async {
    await _receivedNotificationsStreamSubscription.cancel();
  }

  void _onInitializeController() {
    try {
      _receivedNotificationsStreamSubscription =
          notificationsService.receivedNotificationsStream.listen(
        _handleReceivedNotification,
        onError: (Object error, StackTrace stackTrace) {
          state = AsyncValue.error(error, stackTrace);
        },
      );
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  void _onDisposeController() {
    ref.onDispose(() async {
      await dispose();
    });
  }

  void _handleReceivedNotification(NotificationEntity notification) {
    print("Message arrived: ${notification.title} ${notification.body}");
    state = AsyncValue.data(NotificationEntity(
      title: notification.title,
      body: notification.body,
    ));
  }
}
