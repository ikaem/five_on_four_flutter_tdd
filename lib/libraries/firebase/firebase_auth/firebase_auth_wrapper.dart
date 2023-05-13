import 'package:firebase_auth/firebase_auth.dart';
import 'package:five_on_four_flutter_tdd/features/auth/data/dtos/auth_remote/dto.dart';
import 'package:five_on_four_flutter_tdd/features/auth/domain/args/login_credentials/args.dart';
import 'package:five_on_four_flutter_tdd/features/auth/domain/args/register_credentials/args.dart';
import 'package:five_on_four_flutter_tdd/features/auth/domain/exceptions/auth_exceptions.dart';

export 'package:firebase_auth/firebase_auth.dart'
    show User, FirebaseAuthException;

class FirebaseAuthWrapper {
  final FirebaseAuth _auth = FirebaseAuth.instance;

// TODO i dont want this - i want to retrieve data from locally secure storage
  // Future<AuthRemoteDTO?> checkAuth() async {
  //   final User? auth = _auth.currentUser;

  //   if (auth == null) return null;

  //   final AuthRemoteDTO authRemoteDTO = AuthRemoteDTO(
  //     id: id,
  //     nickname: nickname,
  //     email: email,
  //     loggedInAt: loggedInAt,
  //   );
  //   return null;
  // }

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
      // TODO not sure what is this displayName
      nickname: user.displayName!,
      email: user.email ?? credentialsArgs.email,
      loggedInAt: DateTime.now().millisecondsSinceEpoch,
    );

    return authRemoteDTO;
  }

  Future<void> logout() async {
    await _auth.signOut();
  }
}
