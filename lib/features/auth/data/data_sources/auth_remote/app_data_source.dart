import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:five_on_four_flutter_tdd/features/auth/data/data_sources/auth_remote/data_source.dart';
import 'package:five_on_four_flutter_tdd/features/auth/data/dtos/auth_remote/dto.dart';
import 'package:five_on_four_flutter_tdd/features/auth/domain/args/login_credentials/args.dart';
import 'package:five_on_four_flutter_tdd/features/auth/domain/args/register_credentials/args.dart';
import 'package:five_on_four_flutter_tdd/features/auth/utils/constants/auth_firebase_constants.dart';
import 'package:five_on_four_flutter_tdd/libraries/firebase/cloud_firestore/firebase_firestore_wrapper.dart';
import 'package:five_on_four_flutter_tdd/libraries/firebase/firebase_auth/firebase_auth_wrapper.dart';
import 'package:five_on_four_flutter_tdd/libraries/firebase/firebase_messaging/firebase_messaging_wrapper.dart';

class AuthRemoteAppDataSource implements AuthRemoteDataSource {
  const AuthRemoteAppDataSource({
    required FirebaseAuthWrapper firebaseAuthWrapper,
    required FirebaseFirestoreWrapper firebaseFirestoreWrapper,
    required FirebaseMessagingWrapper firebaseMessagingWrapper,
  })  : _firebaseAuthWrapper = firebaseAuthWrapper,
        _firebaseMessagingWrapper = firebaseMessagingWrapper,
        _firebaseFirestoreWrapper = firebaseFirestoreWrapper;

  final FirebaseAuthWrapper _firebaseAuthWrapper;
  final FirebaseFirestoreWrapper _firebaseFirestoreWrapper;
  final FirebaseMessagingWrapper _firebaseMessagingWrapper;

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
// TODO this will also need to check somehow if this user exists

    final AuthRemoteDTO authRemoteDTO =
        await _firebaseAuthWrapper.registerWithUsernameAndPassword(credentials);

    final Map<String, dynamic> newPlayerData =
        credentials.toFirebasePlayerDataMap();
    final String authId = authRemoteDTO.id;

    final DocumentReference<Map<String, dynamic>> insertReference =
        await _firebaseFirestoreWrapper.db
            .collection(AuthFirebaseConstants.firestorePlayersCollection)
            .doc(authId);

    // TODO somehow this also needs to use actual transaction of some sort
    await insertReference.set(newPlayerData);

    return authRemoteDTO;
  }

  @override
  Future<void> registerUserDevice(String userId) async {
    final String? token = await _firebaseMessagingWrapper.getDeviceToken();

// TODO with this, i also have to check if this user is logged in
// so when send notification to cloud service, i want to send both the user id and the token?
    await _firebaseFirestoreWrapper.db
        .collection(AuthFirebaseConstants.firestorePlayersCollection)
        .doc(userId)
        .update({
      AuthFirebaseConstants.firestorePlayerDeviceTokenField: token,
    });

    log("this is token: $token");
  }
}
