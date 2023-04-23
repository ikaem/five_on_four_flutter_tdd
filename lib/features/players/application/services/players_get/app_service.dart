import 'package:five_on_four_flutter_tdd/features/players/application/services/players_get/service.dart';
import 'package:five_on_four_flutter_tdd/features/players/domain/models/player/model.dart';
import 'package:five_on_four_flutter_tdd/features/players/data/data_sources/players_remote/data_source.dart';

class PlayersGetAppService implements PlayersGetService {
  @override
  Future<List<PlayerModel>> handleSearchPlayers(
    PlayersSearchFilters filters,
  ) async {}
}
