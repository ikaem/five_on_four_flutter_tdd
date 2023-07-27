import 'dart:async';

import 'package:five_on_four_flutter_tdd/features/auth/application/services/auth/providers/app_service/provider.dart';
import 'package:five_on_four_flutter_tdd/features/auth/application/services/auth/service.dart';
import 'package:five_on_four_flutter_tdd/features/auth/domain/models/auth/model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "controller.g.dart";

abstract class AuthStatusController {
  bool get isAuthenticated;
  // AuthModel? get auth;
  // bool get isLoading;
  void dispose();
}

// TODO move to other file later
@Riverpod(keepAlive: true)
class AuthStatusControllerImpl extends _$AuthStatusControllerImpl
    implements AuthStatusController {
  late final AuthService authService = ref.read(authServiceProvider);
  late final StreamSubscription<AuthModel?> _authStatusStreamSubscription;

  @override
  Future<AuthModel?> build() async {
    _initializeController();
    final auth = _checkAuth();

    return auth;
  }

  // @override
  // TODO: implement auth
  // AuthModel? get auth => throw UnimplementedError();

  @override
  // TODO: implement isAuthenticated
  bool get isAuthenticated => state.maybeWhen(
        orElse: () => false,
        data: (auth) => auth != null,
      );

  // TODO: implement isLoading
  // bool get isLoading => throw UnimplementedError();

  // @override
  Future<void> _initializeController() async {
    // state = AsyncValue.loading();

    dispose();
    // _checkAuth();

    _authStatusStreamSubscription = authService.authStatusStream.listen((auth) {
      state = AsyncValue.data(auth);
    }, onError: (Object e, StackTrace s) {
      state = AsyncValue.error(e, s);
    });
  }

  Future<AuthModel?> _checkAuth() async {
    try {
      final auth = await authService.checkAuth();
      return auth;
    } catch (e) {
      // state = AsyncValue.error(e, s);
      // log error
      // for now just retur null
      return null;
    }
    // return null;
  }

  @override
  void dispose() {
    ref.onDispose(() {
      _authStatusStreamSubscription.cancel();
    });
  }
}
