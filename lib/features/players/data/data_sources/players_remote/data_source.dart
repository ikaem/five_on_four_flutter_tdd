import 'package:five_on_four_flutter_tdd/features/players/data/dtos/player_remote/dto.dart';
import 'package:five_on_four_flutter_tdd/features/players/domain/values/players_search_filters_value.dart';

abstract class PlayersRemoteDataSource {
  Future<List<PlayerRemoteDTO>> getSearchedPlayers(
    PlayersSearchFiltersValue filters,
  );

  Future<PlayerRemoteDTO> getPlayer(String playerId);
}
