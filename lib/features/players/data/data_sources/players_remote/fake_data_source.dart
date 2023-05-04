import 'package:collection/collection.dart';
import 'package:five_on_four_flutter_tdd/features/players/data/data_sources/players_remote/data_source.dart';
import 'package:five_on_four_flutter_tdd/features/players/data/dtos/player_remote/dto.dart';
import 'package:five_on_four_flutter_tdd/features/players/domain/exceptions/player_exceptions.dart';

class PlayersRemoteFakeDataSource implements PlayersRemoteDataSource {
  @override
  Future<List<PlayerRemoteDTO>> getSearchedPlayers(
      PlayersSearchFilters filters) async {
    await Future<void>.delayed(Duration(milliseconds: 500));

    return _players;
  }

  @override
  Future<PlayerRemoteDTO> getPlayer(String playerId) async {
    final PlayerRemoteDTO? player =
        _players.firstWhereOrNull((element) => element.id == playerId);

    if (player == null)
      throw PlayerExceptionNotFoundRemotely(message: "Player id: $playerId");

    return player;
  }
}

// /* TODO remove eventually */
const List<PlayerRemoteDTO> _players = [
  PlayerRemoteDTO(
    id: '1',
    nickname: 'Player1',
    email: 'player1@example.com',
  ),
  PlayerRemoteDTO(
    id: '2',
    nickname: 'Player2',
    email: 'player2@example.com',
  ),
  PlayerRemoteDTO(
    id: '3',
    nickname: 'Player3',
    email: 'player3@example.com',
  ),
  PlayerRemoteDTO(
    id: '4',
    nickname: 'Player4',
    email: 'player4@example.com',
  ),
  PlayerRemoteDTO(
    id: '5',
    nickname: 'Player5',
    email: 'player5@example.com',
  ),
];
