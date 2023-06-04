import 'package:five_on_four_flutter_tdd/features/matches/data/dtos/match_remote/dto.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/values/match_participantion/value.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/values/matches_search_filters/value.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/values/new_match/value.dart';
import 'package:five_on_four_flutter_tdd/features/matches/presentation/state/controllers/matches_in_region/providers/provider.dart';

abstract class MatchesRemoteDataSource {
  const MatchesRemoteDataSource();

  Future<List<MatchRemoteDTO>> getJoinedMatchesForPlayer(
    String playerId,
  );

  Future<List<MatchRemoteDTO>> getInvitedMatchesForPlayer(
    String playerId,
  );

// TODO inneficient query
  // Future<MatchRemoteDTO?> getNextMatchForPlayer(
  //   String playerId,
  // );

  Future<MatchRemoteDTO> getMatch(String matchId);

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

  Future<List<MatchRemoteDTO>> getSearchedMatches(
    MatchesSearchFiltersValue filters,
    RegionCoordinatesBoundariesValue coordinatesBoundaries,
  );

  Future<List<MatchRemoteDTO>> getAllMatches(
    RegionCoordinatesBoundariesValue coordinatesBoundaries,
  );

// TODO not needed
  // Future<List<MatchRemoteDTO>> getMatchesInRegion(
  //   RegionCoordinatesBoundariesValue coordinatesBoundaries,
  // );
}
