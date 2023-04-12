import 'package:five_on_four_flutter_tdd/features/matches/domain/models/match_info/model.dart';

abstract class MatchesService {
  Future<MatchInfoModel> getMatchInfo(String matchId);
}
