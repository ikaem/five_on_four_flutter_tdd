import 'dart:async';

import 'package:five_on_four_flutter_tdd/features/auth/application/services/auth/providers/app_service/provider.dart';
import 'package:five_on_four_flutter_tdd/features/auth/application/services/auth/service.dart';
import 'package:five_on_four_flutter_tdd/features/auth/domain/models/auth/model.dart';
import 'package:five_on_four_flutter_tdd/features/auth/presentation/state/controllers/auth_status/controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "provider.g.dart";

@Riverpod(keepAlive: true)
class AuthStatusAppController extends _$AuthStatusAppController
    implements AuthStatusController {
  late final AuthService authService = ref.read(authServiceProvider);
  late final StreamSubscription<AuthModel?> _authStatusStreamSubscription;

  @override
  Future<AuthModel?> build() async {
    final AuthModel? auth = await _initializeController();
    print("MAKE THIS WORK!!!!: ${auth.toString()}");
    return auth;

    // ok, so i could get first value for the stream, and return it
    // then i can setup the subscription
  }

  @override
  Future<void> dispose() async {
    await _authStatusStreamSubscription.cancel();
  }

  Future<AuthModel?> _initializeController() async {
    await _checkAuth();

    final AuthModel? currentAuth = await authService.authStatusStream.first;

    _authStatusStreamSubscription = authService.authStatusStream.listen((auth) {
      state = AsyncValue.data(auth);
    });

    return currentAuth;
  }

  Future<void> _checkAuth() async {
    await authService.checkAuth();
  }
}
