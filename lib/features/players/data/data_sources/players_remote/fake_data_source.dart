import 'package:collection/collection.dart';
import 'package:five_on_four_flutter_tdd/features/players/data/data_sources/players_remote/data_source.dart';
import 'package:five_on_four_flutter_tdd/features/players/data/dtos/player_remote/dto.dart';
import 'package:five_on_four_flutter_tdd/features/players/domain/exceptions/player_exceptions.dart';
import 'package:five_on_four_flutter_tdd/features/players/domain/values/players_search_filters/value.dart';
import 'package:five_on_four_flutter_tdd/features/players/presentation/state/controllers/players_search/providers/provider.dart';

class PlayersRemoteFakeDataSource implements PlayersRemoteDataSource {
  @override
  Future<List<PlayerRemoteDTO>> getSearchedPlayers({
    required PlayersSearchFiltersValue filters,
    required PlayersSearchOptions options,
    required String currentPlayerId,
  }) async {
    await Future<void>.delayed(Duration(milliseconds: 500));

    return _players;
  }

  @override
  Future<PlayerRemoteDTO> getPlayer(String playerId) async {
    final PlayerRemoteDTO? player =
        _players.firstWhereOrNull((element) => element.id == playerId);

    if (player == null)
      throw PlayerExceptionNotFoundRemote(message: "Player id: $playerId");

    return player;
  }

  @override
  Future<void> savePlayer(
      {required Map<String, dynamic> playerData, required String playerId}) {
    // TODO: implement savePlayer
    throw UnimplementedError();
  }

  @override
  Future<void> updatePlayerField(
      {required String playerId,
      required String fieldName,
      required fieldValue}) {
    // TODO: implement updatePlayerField
    throw UnimplementedError();
  }

  @override
  Future<void> deletePlayer(String playerId) {
    // TODO: implement deletePlayer
    throw UnimplementedError();
  }
}

final List<PlayerRemoteDTO> _players = [
  PlayerRemoteDTO(
      id: '1',
      nickname: 'Player1',
      email: 'player1@example.com',
      preferences: PlayerPreferencesRemoteDTO.empty()),
  PlayerRemoteDTO(
      id: '2',
      nickname: 'Player2',
      email: 'player2@example.com',
      preferences: PlayerPreferencesRemoteDTO.empty()),
  PlayerRemoteDTO(
      id: '3',
      nickname: 'Player3',
      email: 'player3@example.com',
      preferences: PlayerPreferencesRemoteDTO.empty()),
  PlayerRemoteDTO(
      id: '4',
      nickname: 'Player4',
      email: 'player4@example.com',
      preferences: PlayerPreferencesRemoteDTO.empty()),
  PlayerRemoteDTO(
      id: '5',
      nickname: 'Player5',
      email: 'player5@example.com',
      preferences: PlayerPreferencesRemoteDTO.empty()),
];
