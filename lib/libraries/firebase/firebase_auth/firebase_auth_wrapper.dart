import 'package:firebase_auth/firebase_auth.dart';
import 'package:five_on_four_flutter_tdd/features/auth/data/dtos/auth_remote/dto.dart';
import 'package:five_on_four_flutter_tdd/features/auth/domain/args/login_credentials/args.dart';
import 'package:five_on_four_flutter_tdd/features/auth/domain/args/register_credentials/args.dart';
import 'package:five_on_four_flutter_tdd/features/auth/domain/exceptions/auth_exceptions.dart';

export 'package:firebase_auth/firebase_auth.dart'
    show User, FirebaseAuthException;

class FirebaseAuthWrapper {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<AuthRemoteDTO> registerWithUsernameAndPassword(
    RegisterCredentialsArgs credentialsArgs,
  ) async {
    final UserCredential userCredential =
        await _auth.createUserWithEmailAndPassword(
      email: credentialsArgs.email,
      password: credentialsArgs.password,
    );

    final User? user = userCredential.user;

    if (user == null)
      throw AuthExceptionRegisterFailure(
          message:
              "Failed to register user with email: ${credentialsArgs.email} and nickname: ${credentialsArgs.nickname}");

    await user.updateDisplayName(credentialsArgs.nickname);

    final AuthRemoteDTO authRemoteDTO = AuthRemoteDTO(
      id: user.uid,
      nickname: credentialsArgs.nickname,
      email: user.email ?? credentialsArgs.email,
      loggedInAt: DateTime.now().millisecondsSinceEpoch,
    );

    return authRemoteDTO;
  }

  Future<AuthRemoteDTO> loginWithUsernameAndPassword(
    LoginCredentialsArgs credentialsArgs,
  ) async {
    final UserCredential userCredential =
        await _auth.signInWithEmailAndPassword(
      email: credentialsArgs.email,
      password: credentialsArgs.password,
    );

    final User? user = userCredential.user;

    if (user == null)
      throw AuthExceptionUnauthorized(
          message:
              "Failed to register user with email: ${credentialsArgs.email}}");

    final AuthRemoteDTO authRemoteDTO = AuthRemoteDTO(
      id: user.uid,
      nickname: user.displayName!,
      email: user.email ?? credentialsArgs.email,
      loggedInAt: DateTime.now().millisecondsSinceEpoch,
    );

    return authRemoteDTO;
  }

  Future<void> deleteUser() async {
    final User? user = _auth.currentUser;

    if (user == null) {
      throw AuthExceptionUnauthorized(
          message: "Unable to delete unauthorized user");
    }

    await user.delete();
  }

  Future<void> logout() async {
    await _auth.signOut();
  }
}
