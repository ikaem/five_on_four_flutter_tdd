import 'package:five_on_four_flutter_tdd/features/players/data/dtos/player_remote/dto.dart';
import 'package:five_on_four_flutter_tdd/features/players/domain/values/players_search_filters/value.dart';
import 'package:five_on_four_flutter_tdd/features/players/presentation/state/controllers/players_search/providers/provider.dart';

abstract class PlayersRemoteDataSource {
  Future<List<PlayerRemoteDTO>> getSearchedPlayers({
    required PlayersSearchFiltersValue filters,
    required PlayersSearchOptions options,
    required String currentPlayerId,
  });

  Future<PlayerRemoteDTO> getPlayer(String playerId);
}
