import 'package:five_on_four_flutter_tdd/features/auth/application/services/auth/app_service.dart';
import 'package:five_on_four_flutter_tdd/features/auth/application/services/auth/service.dart';
import 'package:five_on_four_flutter_tdd/features/auth/data/repositories/auth/providers/app_repository/provider.dart';
import 'package:five_on_four_flutter_tdd/features/auth/data/repositories/auth_status/providers/app_repository/provider.dart';
import 'package:five_on_four_flutter_tdd/features/auth/domain/repository_interfaces/auth_repository.dart';
import 'package:five_on_four_flutter_tdd/features/auth/domain/repository_interfaces/auth_status_repository.dart';
import 'package:five_on_four_flutter_tdd/features/players/data/repositories/players/providers/app_repository/provider.dart';
import 'package:five_on_four_flutter_tdd/features/players/domain/repository_interfaces/players_repository.dart';
import 'package:five_on_four_flutter_tdd/libraries/firebase/firebase_messaging/firebase_messaging_wrapper.dart';
import 'package:five_on_four_flutter_tdd/libraries/firebase/firebase_messaging/providers/provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "provider.g.dart";

@riverpod
AuthService authService(AuthServiceRef ref) {
  final AuthRepository authRepository = ref.read(authRepositoryProvider);
  final AuthStatusRepository authStatusRepository =
      ref.watch(authStatusRepositoryProvider);
  final PlayersRepository playersRepository =
      ref.watch(playersAppRepositoryProvider);
  final FirebaseMessagingWrapper firebaseMessagingWrapper =
      ref.read(firebaseMessagingWrapperProvider);

  final AuthService service = AuthAppService(
    authRepository: authRepository,
    authStatusRepository: authStatusRepository,
    playersRepository: playersRepository,
    firebaseMessagingWrapper: firebaseMessagingWrapper,
  );

  return service;
}
