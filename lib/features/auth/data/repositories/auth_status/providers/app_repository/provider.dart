import 'package:five_on_four_flutter_tdd/features/auth/data/repositories/auth_status/app_repository.dart';
import 'package:five_on_four_flutter_tdd/features/auth/domain/repository_interfaces/auth_status_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "provider.g.dart";

// TODO if parent is kept alive, maybe no need to keep all alive
@Riverpod(keepAlive: true)
AuthStatusRepository authStatusRepository(AuthStatusRepositoryRef ref) {
  final AuthStatusRepository authStatusRepository = AuthStatusAppRepository();

  return authStatusRepository;
}
