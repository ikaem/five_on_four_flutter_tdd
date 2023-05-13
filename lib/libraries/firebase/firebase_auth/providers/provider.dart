import 'package:five_on_four_flutter_tdd/libraries/firebase/firebase_auth/firebase_auth_wrapper.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "provider.g.dart";

@riverpod
FirebaseAuthWrapper firebaseAuthWrapper(FirebaseAuthWrapperRef ref) {
  final FirebaseAuthWrapper firebaseAuthWrapper = FirebaseAuthWrapper();

  return firebaseAuthWrapper;
}
