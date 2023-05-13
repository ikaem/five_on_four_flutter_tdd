import 'package:five_on_four_flutter_tdd/features/auth/data/repositories/auth_status/providers/app_repository/provider.dart';
import 'package:five_on_four_flutter_tdd/features/auth/domain/repository_interfaces/auth_status_repository.dart';
import 'package:five_on_four_flutter_tdd/features/players/application/services/players_get/app_service.dart';
import 'package:five_on_four_flutter_tdd/features/players/application/services/players_get/service.dart';
import 'package:five_on_four_flutter_tdd/features/players/data/repositories/players/providers/app_repository/provider.dart';
import 'package:five_on_four_flutter_tdd/features/players/domain/repository_interfaces/players_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "provider.g.dart";

@riverpod
PlayersService playersAppService(PlayersAppServiceRef ref) {
  final PlayersRepository playersRepository =
      ref.read(playersAppRepositoryProvider);

  final AuthStatusRepository authStatusRepository =
      ref.read(authStatusRepositoryProvider);

  final PlayersService playersService = PlayersAppService(
    playersRepository: playersRepository,
    authStatusRepository: authStatusRepository,
  );

  return playersService;
}
