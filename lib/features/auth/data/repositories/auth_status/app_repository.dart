import 'dart:async';

import 'package:five_on_four_flutter_tdd/features/auth/domain/models/auth/model.dart';
import 'package:five_on_four_flutter_tdd/features/auth/domain/repository_interfaces/auth_status_repository.dart';
import 'package:rxdart/rxdart.dart';

class AuthStatusAppRepository implements AuthStatusRepository {
  final BehaviorSubject<AuthModel?> _authBehaviorSubject =
      BehaviorSubject<AuthModel?>();

  StreamSink<AuthModel?> get _authSink => _authBehaviorSubject.sink;
  Stream<AuthModel?> get authStream => _authBehaviorSubject.distinct();

  @override
  Stream<AuthModel?> observeAuthStatus() {
    return authStream;
  }

  @override
  Future<void> setAuth(AuthModel? auth) async {
    _authSink.add(auth);
    // _authSink.add(null);
  }

  @override
  AuthModel? getAuthStatus() {
    final AuthModel? authStatus = _authBehaviorSubject.valueOrNull;

    return authStatus;
  }
}
