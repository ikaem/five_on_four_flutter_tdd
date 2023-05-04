import 'package:five_on_four_flutter_tdd/features/matches/data/data_sources/matches_remote/data_source.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/models/match/model.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/models/match_info/model.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/values/new_match/value.dart';

abstract class MatchesService {
  Future<MatchInfoModel> getMatchInfo(String matchId);
  Future<String> createMatch(NewMatchValue matchData);
  Future<void> handleJoinMatch(MatchModel match);
  bool checkHasPlayerJoinedMatch(MatchModel match);
  Future<List<MatchModel>> handleSearchMatches(MatchesSearchFilters filters);
}
