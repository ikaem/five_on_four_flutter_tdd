import 'package:five_on_four_flutter_tdd/features/auth/domain/models/auth/model.dart';
import 'package:five_on_four_flutter_tdd/features/auth/domain/repository_interfaces/auth_status_repository.dart';
import 'package:five_on_four_flutter_tdd/features/players/application/services/players_get/service.dart';
import 'package:five_on_four_flutter_tdd/features/players/domain/models/player/model.dart';
import 'package:five_on_four_flutter_tdd/features/players/domain/repository_interfaces/players_repository.dart';
import 'package:five_on_four_flutter_tdd/features/players/domain/values/players_search_filters/value.dart';
import 'package:five_on_four_flutter_tdd/features/players/presentation/state/controllers/players_search/providers/provider.dart';

class PlayersAppService implements PlayersService {
  PlayersAppService({
    required PlayersRepository playersRepository,
    required AuthStatusRepository authStatusRepository,
  })  : _playersRepository = playersRepository,
        _authStatusAppRepository = authStatusRepository;

  final PlayersRepository _playersRepository;
  final AuthStatusRepository _authStatusAppRepository;

  @override
  Future<List<PlayerModel>> handleSearchPlayers({
    required PlayersSearchFiltersValue filters,
    required PlayersSearchOptions options,
  }) async {
    final AuthModel? auth = _authStatusAppRepository.getAuthStatus();

    if (auth == null) {
      /* TODO this should somehow elegantly logout */
      throw Exception("User is not authenticated");
    }

    final List<PlayerModel> players =
        await _playersRepository.getSearchedPlayers(
            filters: filters,
            options: options,
            currentPlayerId: auth.player.id);

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
