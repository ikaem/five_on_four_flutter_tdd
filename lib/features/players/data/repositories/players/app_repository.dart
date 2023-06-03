import 'package:five_on_four_flutter_tdd/features/players/data/dtos/player_remote/dto.dart';
import 'package:five_on_four_flutter_tdd/features/players/domain/models/player/model.dart';
import 'package:five_on_four_flutter_tdd/features/players/data/data_sources/players_remote/data_source.dart';
import 'package:five_on_four_flutter_tdd/features/players/domain/repository_interfaces/players_repository.dart';
import 'package:five_on_four_flutter_tdd/features/players/domain/values/players_search_filters/value.dart';
import 'package:five_on_four_flutter_tdd/features/players/presentation/state/controllers/players_search/providers/provider.dart';
import 'package:five_on_four_flutter_tdd/features/players/utils/constants/players_firebase_constants.dart';

class PlayersAppRepository implements PlayersRepository {
  const PlayersAppRepository({
    required PlayersRemoteDataSource playersRemoteDataSource,
  }) : _playersRemoteDataSource = playersRemoteDataSource;

  final PlayersRemoteDataSource _playersRemoteDataSource;

  @override
  Future<List<PlayerModel>> getSearchedPlayers({
    required PlayersSearchFiltersValue filters,
    required PlayersSearchOptions options,
    required String currentPlayerId,
  }) async {
    final List<PlayerRemoteDTO> playerDTOs =
        await _playersRemoteDataSource.getSearchedPlayers(
      filters: filters,
      options: options,
      currentPlayerId: currentPlayerId,
    );

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

  @override
  Future<void> savePlayer({
    required Map<String, dynamic> playerData,
    required String playerId,
  }) async {
    await _playersRemoteDataSource.savePlayer(
      playerData: playerData,
      playerId: playerId,
    );
  }

  @override
  Future<void> updatePlayerDeviceToken({
    required String playerId,
    required String deviceToken,
  }) async {
    await _playersRemoteDataSource.updatePlayerField(
      playerId: playerId,
      fieldName: PlayersFirebaseConstants.fieldDeviceToken,
      fieldValue: deviceToken,
    );
  }

  @override
  Future<void> updatePlayerPreferencesRegionSize({
    required String playerId,
    required int regionSize,
  }) async {
    await _playersRemoteDataSource.updatePlayerField(
      playerId: playerId,
      fieldName: PlayersFirebaseConstants.fieldPreferencesRegionSize,
      fieldValue: regionSize,
    );
  }

// TODO not needed
  // @override
  // Future<void> updatePlayerField({
  //   required String playerId,
  //   required String fieldName,
  //   required fieldValue,
  // }) async {
  //   await _playersRemoteDataSource.updatePlayerField(
  //     playerId: playerId,
  //     fieldName: fieldName,
  //     fieldValue: fieldValue,
  //   );
  // }
}
