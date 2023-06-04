import 'package:five_on_four_flutter_tdd/features/matches/domain/models/match/model.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/values/match_participantion/value.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/values/matches_search_filters/value.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/values/new_match/value.dart';
import 'package:five_on_four_flutter_tdd/features/matches/presentation/state/controllers/matches_in_region/providers/provider.dart';

abstract class MatchesRepository {
  // TODO not needed
  // Future<MatchModel> getPlayerNextMatch(String playerId);

  Future<List<MatchModel>> getPlayerJoinedMatches(String playerId);

  Future<List<MatchModel>> getPlayerInvitedMatches(String playerId);

  Future<MatchModel> getMatch(String matchId);

  Future<String> createMatch({
    required NewMatchValue matchData,
    // required PlayerModel currentPlayer,
    required String playerId,
    required String playerNickname,
  });

  Future<void> joinMatch({
    required String matchId,
    required MatchParticipationValue matchParticipation,
  });

  Future<void> unjoinMatch({
    required String matchId,
    required MatchParticipationValue matchParticipation,
  });

  Future<List<MatchModel>> getSearchedMatches(
    MatchesSearchFiltersValue filters,
    // TODO test
    RegionCoordinatesBoundariesValue coordinatesBoundaries,
  );

  Future<List<MatchModel>> getAllMatches(
    RegionCoordinatesBoundariesValue coordinatesBoundaries,
  );

// TODO not needed
  // Future<List<MatchModel>> getMatchesInRegion(
  //   RegionCoordinatesBoundariesValue boundaries,
  // );
}
