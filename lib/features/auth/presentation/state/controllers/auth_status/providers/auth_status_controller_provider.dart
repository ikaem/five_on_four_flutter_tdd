import 'package:five_on_four_flutter_tdd/features/auth/application/services/auth/app_service.dart';
import 'package:five_on_four_flutter_tdd/features/auth/application/services/auth/service.dart';
import 'package:five_on_four_flutter_tdd/features/auth/data/repositories/auth/providers/app_repository_provider.dart';
import 'package:five_on_four_flutter_tdd/features/auth/data/repositories/auth_status/providers/app_repository_provider.dart';
import 'package:five_on_four_flutter_tdd/features/auth/domain/repository_interfaces/auth_repository.dart';
import 'package:five_on_four_flutter_tdd/features/auth/domain/repository_interfaces/auth_status_repository.dart';
import 'package:five_on_four_flutter_tdd/features/auth/presentation/state/controllers/auth_status/app_controller.dart';
import 'package:five_on_four_flutter_tdd/features/auth/presentation/state/controllers/auth_status/controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final ChangeNotifierProvider<AuthController> authControllerProvider =
    ChangeNotifierProvider<AuthController>((ref) {
  final AuthRepository authRepository = ref.watch(
    authAppRepositoryProvider,
  );
  final AuthStatusRepository authStatusRepository = ref.watch(
    authStatusRepositoryProvider,
  );

// TODO this should be wrapped in a provider as well
  final AuthService authService = AuthAppService(
    authRepository: authRepository,
    authStatusRepository: authStatusRepository,
  );

  final AuthController authController = AuthAppController(
    authService: authService,
  );

  return authController;
});
