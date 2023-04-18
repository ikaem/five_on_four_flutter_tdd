import 'dart:async';
import 'dart:developer';

import 'package:five_on_four_flutter_tdd/features/auth/application/services/auth/providers/app_service/provider.dart';
import 'package:five_on_four_flutter_tdd/features/auth/application/services/auth/service.dart';
import 'package:five_on_four_flutter_tdd/features/auth/domain/models/auth/model.dart';
import 'package:five_on_four_flutter_tdd/features/auth/presentation/state/controllers/auth_status_new/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// TODO replace new
class AuthStatusNewAppController extends ChangeNotifier
    implements AuthStatusNewController {
  AuthStatusNewAppController({
    required Ref ref,
  }) : _ref = ref {
    _initializeController();
  }

  final Ref _ref;

  late final AuthService authService = _ref.read(authServiceProvider);
  late final StreamSubscription<AuthModel?> _authStatusStreamSubscription;

  bool _isLoading = true;
  AuthModel? _auth;

  @override
  bool get isAuthenticated => _auth != null;
  @override
  AuthModel? get auth => _auth;
  bool get isLoading => _isLoading;

  //  TODO does anything call this dispose thing
  @override
  void dispose() {
    _authStatusStreamSubscription.cancel();
    super.dispose();
  }

  Future<AuthModel?> _initializeController() async {
    _checkAuth();

    _authStatusStreamSubscription = authService.authStatusStream.listen((auth) {
      // TODO new event
      log("thjis is new event again: $auth");
      _isLoading = false;
      _auth = auth;
      notifyListeners();
    });
    return null;
  }

  Future<void> _checkAuth() async {
    await authService.checkAuth();
  }
}