import 'package:five_on_four_flutter_tdd/features/matches/data/dtos/match_remote/dto.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/values/match_participantion/value.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/values/new_match/value.dart';
import 'package:five_on_four_flutter_tdd/features/players/domain/models/player/model.dart';

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

  Future<String> createMatch({
    required NewMatchValue matchData,
    required PlayerModel currentPlayer,
  });

  Future<void> joinMatch({
    required String matchId,
    required MatchParticipationValue matchParticipation,
  });
}
