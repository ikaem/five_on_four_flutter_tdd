import 'package:five_on_four_flutter_tdd/features/auth/data/dtos/auth_local/dto.dart';

abstract class AuthLocalDataSource {
  Future<AuthLocalDTO?> getAuth();
  Future<void> deleteAuth();
  Future<void> saveAuth(AuthLocalDTO auth);
}
