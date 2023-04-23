import 'package:five_on_four_flutter_tdd/features/players/data/data_sources/players_remote/data_source.dart';
import 'package:five_on_four_flutter_tdd/features/players/domain/models/player/model.dart';

abstract class PlayersGetService {
  // TODO functions in service should be called handle
  // TODO functions in controller should be called on
  Future<List<PlayerModel>> handleSearchPlayers(
    PlayersSearchFilters filters,
  );
}
