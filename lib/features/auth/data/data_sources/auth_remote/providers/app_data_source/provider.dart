import 'package:five_on_four_flutter_tdd/features/auth/data/data_sources/auth_remote/app_data_source.dart';
import 'package:five_on_four_flutter_tdd/features/auth/data/data_sources/auth_remote/data_source.dart';
import 'package:five_on_four_flutter_tdd/libraries/firebase/firebase_auth/firebase_auth_wrapper.dart';
import 'package:five_on_four_flutter_tdd/libraries/firebase/firebase_auth/providers/provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "provider.g.dart";

@riverpod
AuthRemoteDataSource authRemoteAppDataSource(AuthRemoteAppDataSourceRef ref) {
  final FirebaseAuthWrapper firebaseAuthWrapper =
      ref.read(firebaseAuthWrapperProvider);

  final AuthRemoteDataSource fakeDataSource = AuthRemoteAppDataSource(
    firebaseAuthWrapper: firebaseAuthWrapper,
  );

  return fakeDataSource;
}
