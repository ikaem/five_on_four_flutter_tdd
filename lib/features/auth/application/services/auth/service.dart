
import 'package:five_on_four_flutter_tdd/features/auth/domain/args/login_credentials/args.dart';
import 'package:five_on_four_flutter_tdd/features/auth/domain/args/register_credentials/args.dart';
import 'package:five_on_four_flutter_tdd/features/auth/domain/models/auth/model.dart';

abstract class AuthService {
  Future<void> checkAuth();
  Future<void> login(LoginCredentialsArgs args);
  Future<void> register(RegisterCredentialsArgs args);
  Future<void> logout();
  Stream<AuthModel?> get authStatusStream;
}
