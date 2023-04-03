import 'package:five_on_four_flutter_tdd/features/auth/data/data_sources/auth_local/data_source.dart';
import 'package:five_on_four_flutter_tdd/features/auth/data/data_sources/auth_local/providers/fake_data_source/provider.dart';
import 'package:five_on_four_flutter_tdd/features/auth/data/data_sources/auth_remote/data_source.dart';
import 'package:five_on_four_flutter_tdd/features/auth/data/data_sources/auth_remote/providers/fake_data_source/provider.dart';
import 'package:five_on_four_flutter_tdd/features/auth/data/repositories/auth/app_repository.dart';
import 'package:five_on_four_flutter_tdd/features/auth/domain/repository_interfaces/auth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "provider.g.dart";

@riverpod
AuthRepository authRepository(AuthRepositoryRef ref) {
  final AuthLocalDataSource authLocalDataSource =
      ref.read(authLocalFakeDataSourceProvider);

  final AuthRemoteDataSource authRemoteDataSource =
      ref.read(authRemoteFakeDataSourceProvider);

  final AuthRepository authStatusRepository = AuthAppRepository(
    remoteDataSource: authRemoteDataSource,
    localDataSource: authLocalDataSource,
  );

  return authStatusRepository;
}
