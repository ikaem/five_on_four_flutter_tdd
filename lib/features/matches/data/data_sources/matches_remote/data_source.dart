import 'package:five_on_four_flutter_tdd/features/matches/data/dtos/match_remote/dto.dart';

abstract class MatchesRemoteDataSource {
  Future<List<MatchRemoteDTO>> getJoinedMatchesForPlayer(
    String playerId,
  );

  Future<List<MatchRemoteDTO>> getInvitedMatchesForPlayer(
    String playerId,
  );

  Future<MatchRemoteDTO> getNextMatchForPlayer(
    String playerId,
  );

  Future<MatchRemoteDTO> getMatch(String matchId);
}
