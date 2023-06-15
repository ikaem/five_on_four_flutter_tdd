import 'package:five_on_four_flutter_tdd/features/auth/data/data_sources/auth_remote/data_source.dart';
import 'package:five_on_four_flutter_tdd/features/auth/data/dtos/auth_remote/dto.dart';
import 'package:five_on_four_flutter_tdd/features/auth/domain/args/login_credentials/args.dart';
import 'package:five_on_four_flutter_tdd/features/auth/domain/args/register_credentials/args.dart';
import 'package:five_on_four_flutter_tdd/libraries/firebase/firebase_auth/firebase_auth_wrapper.dart';

class AuthRemoteAppDataSource implements AuthRemoteDataSource {
  const AuthRemoteAppDataSource({
    required FirebaseAuthWrapper firebaseAuthWrapper,
  }) : _firebaseAuthWrapper = firebaseAuthWrapper;

  final FirebaseAuthWrapper _firebaseAuthWrapper;

  @override
  Future<AuthRemoteDTO> login(LoginCredentialsArgs credentials) async {
    final AuthRemoteDTO auth =
        await _firebaseAuthWrapper.loginWithUsernameAndPassword(credentials);

    return auth;
  }

  @override
  Future<void> logout() async {
    await _firebaseAuthWrapper.logout();
  }

  @override
  Future<AuthRemoteDTO> register(RegisterCredentialsArgs credentials) async {
    // FUTURE make sure to somehow check if this username is already taken
    final AuthRemoteDTO authRemoteDTO =
        await _firebaseAuthWrapper.registerWithUsernameAndPassword(credentials);

    return authRemoteDTO;
  }

  @override
  Future<void> deleteCurrentUser() async {
    await _firebaseAuthWrapper.deleteUser();
  }
}
