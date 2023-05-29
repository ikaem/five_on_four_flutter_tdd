import 'package:five_on_four_flutter_tdd/libraries/firebase/cloud_functions/cloud_functions_wrapper.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "provider.g.dart";

@riverpod
FirebaseFunctionsWrapper firebaseFunctionsWrapper(
  FirebaseFunctionsWrapperRef ref,
) {
  final FirebaseFunctionsWrapper firebaseFunctionsWrapper =
      FirebaseFunctionsWrapper();

  return firebaseFunctionsWrapper;
}
