import 'package:five_on_four_flutter_tdd/features/auth/data/repositories/auth_status/app_repository.dart';
import 'package:five_on_four_flutter_tdd/features/auth/domain/repository_interfaces/auth_status_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final Provider<AuthStatusRepository> authStatusRepositoryProvider =
    Provider<AuthStatusRepository>((ref) => AuthStatusAppRepository());
