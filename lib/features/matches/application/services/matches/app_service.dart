import 'package:five_on_four_flutter_tdd/features/auth/domain/repository_interfaces/auth_status_repository.dart';
import 'package:five_on_four_flutter_tdd/features/matches/application/services/matches/service.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/models/match/model.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/models/match_info/model.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/repositories_interfaces/matches_repository.dart';
import 'package:five_on_four_flutter_tdd/features/weather/domain/models/weather/model.dart';

class MatchesAppService implements MatchesService {
  MatchesAppService({
    required this.matchesRepository,
    required this.authStatusRepository,
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
}
