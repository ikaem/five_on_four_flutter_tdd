import 'package:five_on_four_flutter_tdd/features/players/application/services/players_get/app_service.dart';
import 'package:five_on_four_flutter_tdd/features/players/application/services/players_get/service.dart';
import 'package:five_on_four_flutter_tdd/features/players/data/repositories/players/providers/app_repository/provider.dart';
import 'package:five_on_four_flutter_tdd/features/players/domain/repository_interfaces/players_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "provider.g.dart";

@riverpod
PlayersGetService playersGetAppService(PlayersGetAppServiceRef ref) {
  final PlayersRepository playersRepository =
      ref.read(playersAppRepositoryProvider);

  final PlayersGetService playersGetService =
      PlayersGetAppService(playersRepository: playersRepository);

  return playersGetService;
}
