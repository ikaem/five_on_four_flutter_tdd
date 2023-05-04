import 'package:five_on_four_flutter_tdd/features/players/data/dtos/player_remote/dto.dart';
import 'package:five_on_four_flutter_tdd/features/players/domain/models/player/model.dart';
import 'package:five_on_four_flutter_tdd/features/players/data/data_sources/players_remote/data_source.dart';
import 'package:five_on_four_flutter_tdd/features/players/domain/repository_interfaces/players_repository.dart';

class PlayersAppRepository implements PlayersRepository {
  const PlayersAppRepository({
    required PlayersRemoteDataSource playersRemoteDataSource,
  }) : _playersRemoteDataSource = playersRemoteDataSource;

  final PlayersRemoteDataSource _playersRemoteDataSource;

  @override
  Future<List<PlayerModel>> getSearchedPlayers(
    PlayersSearchFilters filters,
  ) async {
    final List<PlayerRemoteDTO> playerDTOs =
        await _playersRemoteDataSource.getSearchedPlayers(filters);

    final List<PlayerModel> players =
        playerDTOs.map((e) => PlayerModel.fromRemoteDTO(e)).toList();

    return players;
  }

  @override
  Future<PlayerModel> getPlayer(String playerId) async {
    final PlayerRemoteDTO playerRemoteDTO =
        await _playersRemoteDataSource.getPlayer(playerId);

    final PlayerModel playerModel = PlayerModel.fromRemoteDTO(playerRemoteDTO);

    return playerModel;
  }
}
