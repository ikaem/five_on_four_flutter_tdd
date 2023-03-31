import 'package:five_on_four_flutter_tdd/features/matches/data/dtos/match_remote/dto.dart';

abstract class MatchesRemoteDataSource {
  Future<List<MatchRemoteDTO>> getPlayerJoinedMatches(
    String playerId,
  );

  Future<List<MatchRemoteDTO>> getPlayerInvitedMatches(
    String playerId,
  );

  Future<MatchRemoteDTO> getPlayerNextMatch(
    String playerId,
  );
}
