import 'package:five_on_four_flutter_tdd/features/players/data/data_sources/players_remote/data_source.dart';
import 'package:five_on_four_flutter_tdd/features/players/domain/models/player/model.dart';

abstract class PlayersRepository {
  // TODO in future, this might even be a stream - so that we initially get local data, while loading, and then we would get actual remote data
  Future<List<PlayerModel>> getSearchedPlayers(
    PlayersSearchFilters filters,
  );
}
