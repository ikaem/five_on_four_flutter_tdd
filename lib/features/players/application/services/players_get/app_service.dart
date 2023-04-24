import 'package:five_on_four_flutter_tdd/features/players/application/services/players_get/service.dart';
import 'package:five_on_four_flutter_tdd/features/players/domain/models/player/model.dart';
import 'package:five_on_four_flutter_tdd/features/players/data/data_sources/players_remote/data_source.dart';
import 'package:five_on_four_flutter_tdd/features/players/domain/repository_interfaces/players_repository.dart';

class PlayersGetAppService implements PlayersGetService {
  PlayersGetAppService({
    required PlayersRepository playersRepository,
  }) : _playersRepository = playersRepository;

  final PlayersRepository _playersRepository;

  @override
  Future<List<PlayerModel>> handleSearchPlayers(
    PlayersSearchFilters filters,
  ) async {
    final List<PlayerModel> players =
        await _playersRepository.getSearchedPlayers(filters);

    return players;
  }
}
