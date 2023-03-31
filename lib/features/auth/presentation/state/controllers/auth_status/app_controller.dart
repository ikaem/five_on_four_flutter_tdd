import 'dart:async';
import 'dart:developer';

import 'package:five_on_four_flutter_tdd/features/auth/application/services/auth/service.dart';
import 'package:five_on_four_flutter_tdd/features/auth/domain/models/auth/model.dart';
import 'package:five_on_four_flutter_tdd/features/auth/presentation/state/controllers/auth_status/controller.dart';
import 'package:flutter/material.dart';

class AuthAppController extends ChangeNotifier implements AuthController {
  AuthAppController({
    required this.authService,
  }) {
    _initializeNotifier();
  }

  final AuthService authService;

  late final StreamSubscription<AuthModel?> _authStatusStreamSubscription;

  bool _isLoading = true;
  AuthModel? _auth;

  @override
  bool get isAuthenticated => _auth != null;
  @override
  AuthModel? get auth => _auth;
  bool get isLoading => _isLoading;

  @override
  void dispose() {
    _authStatusStreamSubscription.cancel();
    super.dispose();
  }

  Future<void> _initializeNotifier() async {
    _checkAuth();
    _authStatusStreamSubscription = authService.authStatusStream.listen((auth) {
      // TODO new event
      log("thjis is new event again: $auth");
      _isLoading = false;
      _auth = auth;
      notifyListeners();
    });
  }

  Future<void> _checkAuth() async {
    await authService.checkAuth();
  }
}
