import 'package:five_on_four_flutter_tdd/libraries/firebase/firebase_core/firebase_core_wrapper.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "provider.g.dart";

@riverpod
FirebaseCoreWrapper firebaseCoreWrapper(FirebaseCoreWrapperRef ref) {
  final FirebaseCoreWrapper firebaseCoreWrapper = FirebaseCoreWrapper();

  return firebaseCoreWrapper;
}
