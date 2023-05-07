import 'package:five_on_four_flutter_tdd/features/players/domain/models/player/model.dart';
import 'package:five_on_four_flutter_tdd/features/players/domain/values/players_search_filters/value.dart';

abstract class PlayersRepository {
  // TODO in future, this might even be a stream - so that we initially get local data, while loading, and then we would get actual remote data
  Future<List<PlayerModel>> getSearchedPlayers(
    PlayersSearchFiltersValue filters,
  );

  Future<PlayerModel> getPlayer(String playerId);
}
