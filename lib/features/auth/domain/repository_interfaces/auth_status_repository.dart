import 'package:five_on_four_flutter_tdd/features/auth/domain/models/auth/model.dart';

abstract class AuthStatusRepository {
  Future<void> setAuth(AuthModel? auth);
  Stream<AuthModel?> observeAuthStatus();
  AuthModel? getAuthStatus();
}
