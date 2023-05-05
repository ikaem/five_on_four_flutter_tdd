import 'package:five_on_four_flutter_tdd/features/players/domain/models/player/model.dart';
import 'package:five_on_four_flutter_tdd/features/players/domain/values/players_search_filters_value.dart';

abstract class PlayersService {
  Future<List<PlayerModel>> handleSearchPlayers(
    PlayersSearchFiltersValue filters,
  );

  Future<PlayerModel> handleGetPlayer(String playerId);
}
