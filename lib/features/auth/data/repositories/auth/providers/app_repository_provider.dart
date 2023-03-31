import 'package:five_on_four_flutter_tdd/features/auth/data/data_sources/auth_local/providers/fake_data_source_provider.dart';
import 'package:five_on_four_flutter_tdd/features/auth/data/data_sources/auth_remote/providers/fake_data_source_provider.dart';
import 'package:five_on_four_flutter_tdd/features/auth/data/repositories/auth/app_repository.dart';
import 'package:five_on_four_flutter_tdd/features/auth/domain/repository_interfaces/auth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final Provider<AuthRepository> authAppRepositoryProvider =
    Provider<AuthRepository>(
  (ref) => AuthAppRepository(
    remoteDataSource: ref.watch(authRemoteFakeDataSourceProvider),
    localDataSource: ref.watch(authLocalFakeDataSourceProvider),
  ),
);
