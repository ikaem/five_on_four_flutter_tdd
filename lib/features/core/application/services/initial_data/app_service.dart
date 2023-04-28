import 'package:five_on_four_flutter_tdd/features/auth/domain/exceptions/auth_exceptions.dart';
import 'package:five_on_four_flutter_tdd/features/auth/domain/models/auth/model.dart';
import 'package:five_on_four_flutter_tdd/features/auth/domain/repository_interfaces/auth_status_repository.dart';
import 'package:five_on_four_flutter_tdd/features/core/application/services/initial_data/service.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/models/match/model.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/models/match_info/model.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/repositories_interfaces/matches_repository.dart';
import 'package:five_on_four_flutter_tdd/features/weather/domain/models/weather/model.dart';

class InitialDataAppService implements InitialDataService {
  InitialDataAppService({
    required this.matchesRepository,
    required this.authStatusRepository,
  });

  final MatchesRepository matchesRepository;
  final AuthStatusRepository authStatusRepository;

  Future<List<MatchModel>> getCurrentPlayerInvitedMatches() async {
    final AuthModel? authModel = await authStatusRepository.getAuthStatus();
    if (authModel == null) {
      throw AuthExceptionUnauthorized(
          message: "There is no player currently signed in");
    }

    final String playerId = authModel.player.id;

    final List<MatchModel> invitedMatches =
        await matchesRepository.getPlayerInvitedMatches(playerId);
    return invitedMatches;
  }

  Future<List<MatchModel>> getCurrentPlayerJoinedMatches() async {
    final AuthModel? authModel = await authStatusRepository.getAuthStatus();
    if (authModel == null) {
      throw AuthExceptionUnauthorized(
          message: "There is no player currently signed in");
    }

    final String playerId = authModel.player.id;
    final List<MatchModel> joinedMatches =
        await matchesRepository.getPlayerJoinedMatches(playerId);
    return joinedMatches;
  }

  Future<MatchInfoModel> getCurrentPlayerNextMatch() async {
    final AuthModel? authModel = await authStatusRepository.getAuthStatus();
    if (authModel == null) {
      throw AuthExceptionUnauthorized(
          message: "There is no player currently signed in");
    }

    final String playerId = authModel.player.id;

    final MatchModel nextMatch =
        await matchesRepository.getPlayerNextMatch(playerId);
    final WeatherModel weather = WeatherModel.random();
    return MatchInfoModel.fromWeatherAndMatchModels(
        match: nextMatch, weather: weather);
  }
}
