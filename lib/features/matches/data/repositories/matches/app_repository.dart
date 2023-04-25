import 'package:five_on_four_flutter_tdd/features/matches/data/data_sources/matches_remote/data_source.dart';
import 'package:five_on_four_flutter_tdd/features/matches/data/dtos/match_remote/dto.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/models/match/model.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/repositories_interfaces/matches_repository.dart';
import 'package:five_on_four_flutter_tdd/features/players/domain/models/player/model.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/values/new_match/value.dart';

class MatchesAppRepository implements MatchesRepository {
  MatchesAppRepository({
    required this.remoteDataSource,
  });

  final MatchesRemoteDataSource remoteDataSource;

  @override
  Future<List<MatchModel>> getPlayerInvitedMatches(String playerId) async {
    final List<MatchRemoteDTO> remoteMatches =
        await remoteDataSource.getInvitedMatchesForPlayer(playerId);

    return remoteMatches.map((dto) => MatchModel.fromRemoteDto(dto)).toList();
  }

  @override
  Future<List<MatchModel>> getPlayerJoinedMatches(String playerId) async {
    final List<MatchRemoteDTO> remoteMatches =
        await remoteDataSource.getJoinedMatchesForPlayer(playerId);

    return remoteMatches.map((dto) => MatchModel.fromRemoteDto(dto)).toList();
  }

  @override
  Future<MatchModel> getPlayerNextMatch(String playerId) async {
    final MatchRemoteDTO remoteMatch =
        await remoteDataSource.getNextMatchForPlayer(playerId);
    final MatchModel match = MatchModel.fromRemoteDto(remoteMatch);

    return match;
  }

  @override
  Future<MatchModel> getMatch(String matchId) async {
    final MatchRemoteDTO remoteDTO = await remoteDataSource.getMatch(matchId);

    final MatchModel match = MatchModel.fromRemoteDto(remoteDTO);

    return match;

    // TODO later we will get data from database
  }

  @override
  Future<String> createMatch({
    required NewMatchValue matchData,
    required PlayerModel currentPlayer,
  }) async {
    final String id = await remoteDataSource.createMatch(
      matchData: matchData,
      currentPlayer: currentPlayer,
    );

    return id;
  }
}
