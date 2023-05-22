import 'package:five_on_four_flutter_tdd/features/auth/data/data_sources/auth_remote/app_data_source.dart';
import 'package:five_on_four_flutter_tdd/features/auth/data/data_sources/auth_remote/data_source.dart';
import 'package:five_on_four_flutter_tdd/libraries/firebase/cloud_firestore/firebase_firestore_wrapper.dart';
import 'package:five_on_four_flutter_tdd/libraries/firebase/cloud_firestore/providers/provider.dart';
import 'package:five_on_four_flutter_tdd/libraries/firebase/firebase_auth/firebase_auth_wrapper.dart';
import 'package:five_on_four_flutter_tdd/libraries/firebase/firebase_auth/providers/provider.dart';
import 'package:five_on_four_flutter_tdd/libraries/firebase/firebase_messaging/firebase_messaging_wrapper.dart';
import 'package:five_on_four_flutter_tdd/libraries/firebase/firebase_messaging/providers/provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "provider.g.dart";

@riverpod
AuthRemoteDataSource authRemoteAppDataSource(AuthRemoteAppDataSourceRef ref) {
  final FirebaseAuthWrapper firebaseAuthWrapper =
      ref.read(firebaseAuthWrapperProvider);
  final FirebaseFirestoreWrapper firebaseFirestoreWrapper =
      ref.read(firebaseFirestoreWrapperProvider);
  final FirebaseMessagingWrapper firebaseMessagingWrapper =
      ref.read(firebaseMessagingWrapperProvider);

  final AuthRemoteDataSource fakeDataSource = AuthRemoteAppDataSource(
    firebaseAuthWrapper: firebaseAuthWrapper,
    firebaseFirestoreWrapper: firebaseFirestoreWrapper,
    firebaseMessagingWrapper: firebaseMessagingWrapper,
  );

  return fakeDataSource;
}
