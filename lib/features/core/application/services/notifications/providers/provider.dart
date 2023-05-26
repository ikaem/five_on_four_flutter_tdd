import 'package:five_on_four_flutter_tdd/features/core/application/services/notifications/app_service.dart';
import 'package:five_on_four_flutter_tdd/features/core/application/services/notifications/service.dart';
import 'package:five_on_four_flutter_tdd/libraries/firebase/cloud_functions/cloud_functions_wrapper.dart';
import 'package:five_on_four_flutter_tdd/libraries/firebase/cloud_functions/providers/provider.dart';
import 'package:five_on_four_flutter_tdd/libraries/firebase/firebase_messaging/firebase_messaging_wrapper.dart';
import 'package:five_on_four_flutter_tdd/libraries/firebase/firebase_messaging/providers/provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "provider.g.dart";

// TODO this service might not be needed at all
@riverpod
NotificationsService notificationsService(
  NotificationsServiceRef ref,
) {
  final FirebaseMessagingWrapper firebaseMessagingWrapper =
      ref.watch(firebaseMessagingWrapperProvider);

  final FirebaseFunctionsWrapper firebaseFunctionsWrapper =
      ref.watch(firebaseFunctionsWrapperProvider);

  final NotificationsService notificationsService = NotificationsAppService(
    firebaseMessagingWrapper: firebaseMessagingWrapper,
    firebaseFunctionsWrapper: firebaseFunctionsWrapper,
  );

  return notificationsService;
}
