import 'package:five_on_four_flutter_tdd/features/matches/domain/models/match/model.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/models/match_info/model.dart';

// lib/core/application/services/initial_data/service.dart

abstract class InitialDataService {
  Future<List<MatchModel>> getCurrentPlayerInvitedMatches();

  Future<List<MatchModel>> getCurrentPlayerJoinedMatches();

  Future<MatchInfoModel> getCurrentPlayerNextMatch();
}
