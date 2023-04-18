import 'package:five_on_four_flutter_tdd/features/auth/presentation/state/controllers/auth_status_new/app_controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "provider.g.dart";

@riverpod
AuthStatusNewAppController authStatusNewAppController(
  AuthStatusNewAppControllerRef ref,
) {
  final AuthStatusNewAppController controller =
      AuthStatusNewAppController(ref: ref);

  return controller;
}
