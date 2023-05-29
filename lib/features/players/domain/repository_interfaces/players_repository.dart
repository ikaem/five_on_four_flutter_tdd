import 'package:five_on_four_flutter_tdd/features/players/domain/models/player/model.dart';
import 'package:five_on_four_flutter_tdd/features/players/domain/values/players_search_filters/value.dart';
import 'package:five_on_four_flutter_tdd/features/players/presentation/state/controllers/players_search/providers/provider.dart';

abstract class PlayersRepository {
  Future<List<PlayerModel>> getSearchedPlayers({
    required PlayersSearchFiltersValue filters,
    required PlayersSearchOptions options,
    required String currentPlayerId,
  });

  Future<PlayerModel> getPlayer(String playerId);

  Future<void> savePlayer({
    required Map<String, dynamic> playerData,
    required String playerId,
  });

  Future<void> updatePlayerField({
    required String playerId,
    required String fieldName,
    required dynamic fieldValue,
  });
}
