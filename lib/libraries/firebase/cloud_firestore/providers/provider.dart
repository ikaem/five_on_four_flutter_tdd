import 'package:five_on_four_flutter_tdd/libraries/firebase/cloud_firestore/firebase_firestore_wrapper.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "provider.g.dart";

@riverpod
FirebaseFirestoreWrapper firebaseFirestoreWrapper(
    FirebaseFirestoreWrapperRef ref) {
  final FirebaseFirestoreWrapper firebaseFirestoreWrapper =
      FirebaseFirestoreWrapper();

  return firebaseFirestoreWrapper;
}
