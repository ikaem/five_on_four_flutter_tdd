import 'package:five_on_four_flutter_tdd/features/core/domain/models/coordinates/model.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/models/match/model.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/models/match_info/model.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/values/matches_search_filters/value.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/values/new_match/value.dart';
import 'package:five_on_four_flutter_tdd/features/matches/presentation/state/controllers/matches_in_region/providers/provider.dart';

abstract class MatchesService {
  const MatchesService();

  Future<MatchInfoModel> handleGetMatchInfo(String matchId);
  Future<String> handleCreateMatch(NewMatchValue matchData);
  Future<void> handleJoinMatch(MatchModel match);
  bool checkHasPlayerJoinedMatch(MatchModel match);
  Future<List<MatchModel>> handleSearchMatches(
    MatchesSearchFiltersValue filters,
  );

  Future<List<MatchModel>> handleGetMatchesInRegion(
    RegionCoordinatesBoundariesValue boundaries,
  );

  // TODO not sure if this should be here
  Future<CoordinatesModel?> handleGetLocationForMatchCity({
    required String address,
    required String city,
  });
}
