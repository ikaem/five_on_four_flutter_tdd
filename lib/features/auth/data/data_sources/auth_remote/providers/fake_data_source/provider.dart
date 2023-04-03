import 'package:five_on_four_flutter_tdd/features/auth/data/data_sources/auth_remote/data_source.dart';
import 'package:five_on_four_flutter_tdd/features/auth/data/data_sources/auth_remote/fake_data_source.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "provider.g.dart";

@riverpod
AuthRemoteDataSource authRemoteFakeDataSource(AuthRemoteFakeDataSourceRef ref) {
  final AuthRemoteDataSource fakeDataSource = AuthRemoteFakeDataSource();

  return fakeDataSource;
}
