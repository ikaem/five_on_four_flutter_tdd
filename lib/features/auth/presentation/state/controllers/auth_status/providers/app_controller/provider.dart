import 'package:five_on_four_flutter_tdd/features/auth/application/services/auth/providers/app_service/provider.dart';
import 'package:five_on_four_flutter_tdd/features/auth/application/services/auth/service.dart';
import 'package:five_on_four_flutter_tdd/features/auth/presentation/state/controllers/auth_status/app_controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "provider.g.dart";

@riverpod
AuthStatusController authStatusController(AuthStatusControllerRef ref) {
  final AuthService authService = ref.read(authServiceProvider);

  final AuthStatusController controller = AuthStatusController(
    authService: authService,
  );

  ref.onDispose(() async {
    await controller.dispose();
  });

  return controller;
}
