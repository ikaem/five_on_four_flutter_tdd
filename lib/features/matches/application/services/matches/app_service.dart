import 'package:five_on_four_flutter_tdd/features/auth/domain/models/auth/model.dart';
import 'package:five_on_four_flutter_tdd/features/auth/domain/repository_interfaces/auth_status_repository.dart';
import 'package:five_on_four_flutter_tdd/features/matches/application/services/matches/service.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/models/match/model.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/models/match_info/model.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/repositories_interfaces/matches_repository.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/values/match_participantion/value.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/values/new_match/value.dart';
import 'package:five_on_four_flutter_tdd/features/weather/domain/models/weather/model.dart';

class MatchesAppService implements MatchesService {
  MatchesAppService({
    required this.matchesRepository,
    required this.authStatusRepository,
    // TODO probably get some network status service or repository here
  });

  final MatchesRepository matchesRepository;
  final AuthStatusRepository authStatusRepository;
  // TODO will eventually need weather repository too

  @override
  Future<MatchInfoModel> getMatchInfo(String matchId) async {
    final MatchModel match = await matchesRepository.getMatch(matchId);
    final WeatherModel weather = WeatherModel.random();

    final MatchInfoModel matchInfo = MatchInfoModel.fromWeatherAndMatchModels(
      match: match,
      weather: weather,
    );

    return matchInfo;
  }

  @override
  Future<String> createMatch(NewMatchValue matchData) async {
    // TOOD i could get sync value from this, if I used value or null or subject
    final AuthModel? currentPlayer = await authStatusRepository.getAuthStatus();
    if (currentPlayer == null) {
      // TODO this needs maybe to logout
      throw "Something";
    }

    final String id = await matchesRepository.createMatch(
        matchData: matchData, currentPlayer: currentPlayer.player);

    return id;
  }

  Future<void> joinMatch(String matchId) async {
    final AuthModel? currentPlayer = await authStatusRepository.getAuthStatus();
    if (currentPlayer == null) {
      // TODO this needs maybe to logout
      throw "Something";
    }

    final MatchParticipationValue participation =
        MatchParticipationValue.fromPlayerModel(currentPlayer.player);

    await matchesRepository.joinMatch(
      matchId: matchId,
      matchParticipation: participation,
    );
  }

  // TODO this will have access to network status info
}
