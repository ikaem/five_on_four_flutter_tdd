import 'package:five_on_four_flutter_tdd/libraries/firebase/firebase_messaging/firebase_messaging_wrapper.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "provider.g.dart";

@riverpod
FirebaseMessagingWrapper firebaseMessagingWrapper(
  FirebaseMessagingWrapperRef ref,
) {
  final FirebaseMessagingWrapper firebaseMessagingWrapper =
      FirebaseMessagingWrapper();

  return firebaseMessagingWrapper;
}
