import 'package:five_on_four_flutter_tdd/features/matches/domain/models/match/model.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/values/match_participantion/value.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/values/new_match/value.dart';
import 'package:five_on_four_flutter_tdd/features/players/domain/models/player/model.dart';

abstract class MatchesRepository {
  Future<MatchModel> getPlayerNextMatch(String playerId);

  Future<List<MatchModel>> getPlayerJoinedMatches(String playerId);

  Future<List<MatchModel>> getPlayerInvitedMatches(String playerId);

  Future<MatchModel> getMatch(String matchId);

  Future<String> createMatch({
    required NewMatchValue matchData,
    required PlayerModel currentPlayer,
  });

  Future<void> joinMatch({
    required String matchId,
    required MatchParticipationValue matchParticipation,
  });
}
