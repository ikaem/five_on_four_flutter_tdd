// lib/features/auth/data/data_sources/auth/data_source.dart
import 'package:five_on_four_flutter_tdd/features/auth/data/dtos/auth_remote/dto.dart';
import 'package:five_on_four_flutter_tdd/features/auth/domain/args/login_credentials/args.dart';
import 'package:five_on_four_flutter_tdd/features/auth/domain/args/register_credentials/args.dart';

abstract class AuthRemoteDataSource {
  Future<AuthRemoteDTO> login(LoginCredentialsArgs credentials);
  Future<AuthRemoteDTO> register(RegisterCredentialsArgs credentials);
  // Future<void> registerUserDevice(String userId);
  // TODO this will potentally send some token to logout
  Future<void> logout();
}
