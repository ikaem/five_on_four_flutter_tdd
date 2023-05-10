import 'package:five_on_four_flutter_tdd/features/auth/application/services/auth/service.dart';
import 'package:five_on_four_flutter_tdd/features/auth/domain/args/login_credentials/args.dart';
import 'package:five_on_four_flutter_tdd/features/auth/domain/args/register_credentials/args.dart';
import 'package:five_on_four_flutter_tdd/features/auth/domain/models/auth/model.dart';
import 'package:five_on_four_flutter_tdd/features/auth/domain/repository_interfaces/auth_repository.dart';
import 'package:five_on_four_flutter_tdd/features/auth/domain/repository_interfaces/auth_status_repository.dart';

class AuthAppService implements AuthService {
  AuthAppService({
    required this.authRepository,
    required this.authStatusRepository,
  });

  final AuthRepository authRepository;
  final AuthStatusRepository authStatusRepository;

  @override
  Stream<AuthModel?> get authStatusStream =>
      authStatusRepository.observeAuthStatus();

  @override
  Future<void> checkAuth() async {
    final AuthModel? auth = await authRepository.checkAuth();
    authStatusRepository.setAuth(auth);
  }

  @override
  Future<void> login(LoginCredentialsArgs args) async {
    final AuthModel auth = await authRepository.login(args);
    authStatusRepository.setAuth(auth);
  }

  @override
  Future<void> logout() async {
    await authRepository.logout();
    authStatusRepository.setAuth(null);
  }

  @override
  Future<void> register(RegisterCredentialsArgs args) async {
    final auth = await authRepository.register(args);
    authStatusRepository.setAuth(auth);
  }
}
