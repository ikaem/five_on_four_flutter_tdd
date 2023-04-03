// import 'dart:async';
// import 'dart:developer';

// import 'package:five_on_four_flutter_tdd/features/auth/application/services/auth/service.dart';
// import 'package:five_on_four_flutter_tdd/features/auth/domain/models/auth/model.dart';
// import 'package:five_on_four_flutter_tdd/features/auth/presentation/state/controllers/auth_status/controller.dart';
// import 'package:flutter/material.dart';

// class AuthAppController extends ChangeNotifier implements AuthController {
//   AuthAppController({
//     required this.authService,
//   }) {
//     _initializeNotifier();
//   }

//   final AuthService authService;

//   late final StreamSubscription<AuthModel?> _authStatusStreamSubscription;

//   bool _isLoading = true;
//   AuthModel? _auth;

//   @override
//   bool get isAuthenticated => _auth != null;
//   @override
//   AuthModel? get auth => _auth;
//   bool get isLoading => _isLoading;

//   @override
//   void dispose() {
//     _authStatusStreamSubscription.cancel();
//     super.dispose();
//   }

//   Future<void> _initializeNotifier() async {
//     _checkAuth();
//     _authStatusStreamSubscription = authService.authStatusStream.listen((auth) {
//       // TODO new event
//       log("thjis is new event again: $auth");
//       _isLoading = false;
//       _auth = auth;
//       notifyListeners();
//     });
//   }

//   Future<void> _checkAuth() async {
//     await authService.checkAuth();
//   }
// }

import 'dart:async';

import 'package:five_on_four_flutter_tdd/features/auth/application/services/auth/service.dart';
import 'package:five_on_four_flutter_tdd/features/auth/domain/models/auth/model.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

class AuthStatusController extends AutoDisposeAsyncNotifier<AuthModel?> {
  AuthStatusController({
    required this.authService,
  });

  final AuthService authService;
  late final StreamSubscription<AuthModel?> _authStatusStreamSubscription;

  @override
  Future<AuthModel?> build() async {
    final AuthModel? auth = await _initializeController();
    return auth;

    // ok, so i could get first value for the stream, and return it
    // then i can setup the subscription
  }

// TODO this should be disposed on with ref dispose then in hte provisder
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

// part "app_"

// @riverpod
// class AuthStatusController extends _$AuthStatusController {
//   AuthStatusController({
//     required this.authService,
//   });

//   final AuthService authService;
//   late final StreamSubscription<AuthModel?> _authStatusStreamSubscription;

//   @override
//   Future<AuthStatusValue> build() async {}

//   Future<void> _initializeController() async {
//     await _checkAuth();
//     // _authStatusStreamSubscription =
//   }

//   Future<void> _checkAuth() async {
//     await authService.checkAuth();
//   }
// }

// TODO move to values - could be using freezed for this as well later
@immutable
class AuthStatusValue {
  const AuthStatusValue({
    required this.auth,
    required this.isAuthLoading,
  });

  final AuthModel auth;
  final bool isAuthLoading;
}
