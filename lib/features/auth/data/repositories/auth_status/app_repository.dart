import 'dart:async';

import 'package:five_on_four_flutter_tdd/features/auth/domain/models/auth/model.dart';
import 'package:five_on_four_flutter_tdd/features/auth/domain/repository_interfaces/auth_status_repository.dart';
import 'package:rxdart/rxdart.dart';

class AuthStatusAppRepository implements AuthStatusRepository {
  final BehaviorSubject<AuthModel?> _authBehaviorSubject =
      BehaviorSubject<AuthModel?>();

  StreamSink<AuthModel?> get _authSink => _authBehaviorSubject.sink;
  Stream<AuthModel?> get authStream => _authBehaviorSubject.distinct();
  // Stream<AuthModel?> get authStream => _authBehaviorSubject.stream;

  @override
  Stream<AuthModel?> observeAuthStatus() {
    return authStream;
  }

  @override
  void setAuth(AuthModel? auth) {
    _authSink.add(auth);
    // TODO test
    print("THIS IS SETTING AUTH!!!!!!!!!: $auth");
    // _authBehaviorSubject.add(auth);
    // _authSink.add(null);
  }

// TODO no need for this to be async
  @override
  Future<AuthModel?> getAuthStatus() async {
    // authStream.first.then((value) {
    //   // TODO test
    // });
    final AuthModel? authStatus = _authBehaviorSubject.valueOrNull;
    print("THIS IS GETTING AUTH!!!!!!!!: $authStatus");
    // final AuthModel? authStatus = await authStream.first;

    // TOOD t

    return authStatus;
  }
}
