import 'package:five_on_four_flutter_tdd/features/auth/data/data_sources/auth_local/data_source.dart';
import 'package:five_on_four_flutter_tdd/features/auth/data/data_sources/auth_local/fake_data_source.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "provider.g.dart";

@riverpod
AuthLocalDataSource authLocalFakeDataSource(AuthLocalFakeDataSourceRef ref) {
  final AuthLocalDataSource fakeDataSource = AuthLocalFakeDataSource();

  return fakeDataSource;
}
