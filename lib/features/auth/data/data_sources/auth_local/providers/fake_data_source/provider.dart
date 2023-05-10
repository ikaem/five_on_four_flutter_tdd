import 'package:five_on_four_flutter_tdd/features/auth/data/data_sources/auth_local/data_source.dart';
import 'package:five_on_four_flutter_tdd/features/auth/data/data_sources/auth_local/fake_data_source.dart';
import 'package:five_on_four_flutter_tdd/libraries/flutter_secure_storage/providers/provider.dart';
import 'package:five_on_four_flutter_tdd/libraries/flutter_secure_storage/secure_storage_wrapper.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "provider.g.dart";

@riverpod
AuthLocalDataSource authLocalFakeDataSource(AuthLocalFakeDataSourceRef ref) {
  final SecureStorageWrapper secureStorageWrapper =
      ref.read(secureStorageWrapperProvider);
  final AuthLocalDataSource fakeDataSource = AuthLocalFakeDataSource(
    secureStorageWrapper: secureStorageWrapper,
  );

  return fakeDataSource;
}
