import 'package:five_on_four_flutter_tdd/features/core/application/services/notifications/app_service.dart';
import 'package:five_on_four_flutter_tdd/features/core/application/services/notifications/service.dart';
import 'package:five_on_four_flutter_tdd/libraries/firebase/firebase_messaging/firebase_messaging_wrapper.dart';
import 'package:five_on_four_flutter_tdd/libraries/firebase/firebase_messaging/providers/provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "provider.g.dart";

@riverpod
NotificationsService notificationsService(
  NotificationsServiceRef ref,
) {
  final FirebaseMessagingWrapper firebaseMessagingWrapper =
      ref.watch(firebaseMessagingWrapperProvider);

  final NotificationsService notificationsService = NotificationsAppService(
    firebaseMessagingWrapper: firebaseMessagingWrapper,
  );

  return notificationsService;
}
