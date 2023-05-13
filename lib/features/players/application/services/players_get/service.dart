import 'package:five_on_four_flutter_tdd/features/players/domain/models/player/model.dart';
import 'package:five_on_four_flutter_tdd/features/players/domain/values/players_search_filters/value.dart';
import 'package:five_on_four_flutter_tdd/features/players/presentation/state/controllers/players_search/providers/provider.dart';

abstract class PlayersService {
  Future<List<PlayerModel>> handleSearchPlayers({
    required PlayersSearchFiltersValue filters,
    required PlayersSearchOptions options,
  });

  Future<PlayerModel> handleGetPlayer(String playerId);
}
