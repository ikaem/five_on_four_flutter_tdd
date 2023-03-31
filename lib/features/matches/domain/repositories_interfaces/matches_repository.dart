import 'package:five_on_four_flutter_tdd/features/matches/domain/models/match/model.dart';

abstract class MatchesRepository {
  Future<MatchModel> getPlayerNextMatch(String playerId);

  Future<List<MatchModel>> getPlayerJoinedMatches(String playerId);

  Future<List<MatchModel>> getPlayerInvitedMatches(String playerId);
}
