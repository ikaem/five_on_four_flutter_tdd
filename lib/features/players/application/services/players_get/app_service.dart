import 'package:five_on_four_flutter_tdd/features/players/application/services/players_get/service.dart';
import 'package:five_on_four_flutter_tdd/features/players/domain/models/player/model.dart';
import 'package:five_on_four_flutter_tdd/features/players/domain/repository_interfaces/players_repository.dart';
import 'package:five_on_four_flutter_tdd/features/players/domain/values/players_search_filters_value.dart';

class PlayersAppService implements PlayersService {
  PlayersAppService({
    required PlayersRepository playersRepository,
  }) : _playersRepository = playersRepository;

  final PlayersRepository _playersRepository;

  @override
  Future<List<PlayerModel>> handleSearchPlayers(
    PlayersSearchFiltersValue filters,
  ) async {
    final List<PlayerModel> players =
        await _playersRepository.getSearchedPlayers(filters);

    return players;
  }

  @override
  Future<PlayerModel> handleGetPlayer(String playerId) async {
    // TODO with time, this will decide whether it will search for data from local or from remote

    final PlayerModel playerModel =
        await _playersRepository.getPlayer(playerId);

    return playerModel;
  }
}
