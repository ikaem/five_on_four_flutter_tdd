import 'package:five_on_four_flutter_tdd/features/auth/domain/args/login_credentials/args.dart';
import 'package:five_on_four_flutter_tdd/features/auth/domain/models/auth/model.dart';

abstract class AuthRepository {
  Future<AuthModel> login(LoginCredentialsArgs args);

  Future<AuthModel> register({
    required String email,
    required String password,
    required String nickname,
  });

  Future<void> logout();

  Future<AuthModel?> checkAuth();
}
