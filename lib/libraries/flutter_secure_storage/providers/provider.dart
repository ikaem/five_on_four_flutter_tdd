import 'package:five_on_four_flutter_tdd/libraries/flutter_secure_storage/secure_storage_wrapper.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "provider.g.dart";

@riverpod
SecureStorageWrapper secureStorageWrapper(SecureStorageWrapperRef ref) {
  final SecureStorageWrapper secureStorageWrapper = SecureStorageWrapper();

  return secureStorageWrapper;
}
