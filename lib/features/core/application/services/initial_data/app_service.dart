import 'package:five_on_four_flutter_tdd/features/auth/domain/exceptions/auth_exceptions.dart';
import 'package:five_on_four_flutter_tdd/features/auth/domain/models/auth/model.dart';
import 'package:five_on_four_flutter_tdd/features/auth/domain/repository_interfaces/auth_status_repository.dart';
import 'package:five_on_four_flutter_tdd/features/core/application/services/initial_data/service.dart';
import 'package:five_on_four_flutter_tdd/features/core/domain/values/initial_data/value.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/models/match/model.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/models/match_info/model.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/repositories_interfaces/matches_repository.dart';
import 'package:five_on_four_flutter_tdd/features/weather/domain/models/weather/model.dart';
import 'package:five_on_four_flutter_tdd/features/weather/domain/repositories_interfaces/weather_repository.dart';

class InitialDataAppService implements InitialDataService {
  InitialDataAppService({
    required WeatherRepository weatherRepository,
    required MatchesRepository matchesRepository,
    required AuthStatusRepository authStatusRepository,
  })  : _weatherRepository = weatherRepository,
        _matchesRepository = matchesRepository,
        _authStatusRepository = authStatusRepository;

  final MatchesRepository _matchesRepository;
  final AuthStatusRepository _authStatusRepository;
  final WeatherRepository _weatherRepository;

  @override
  Future<InitialDataValue> handleGetInitialData() async {
    final Future<List<MatchModel>> invitedMatchesFuture =
        _getCurrentPlayerInvitedMatches();
    final Future<List<MatchModel>> joinedMatchesFuture =
        _getCurrentPlayerJoinedMatches();

    final List<Object> responses = await Future.wait([
      invitedMatchesFuture,
      joinedMatchesFuture,
    ]);

    final List<MatchModel> invitedMatches = responses[0] as List<MatchModel>;
    final List<MatchModel> joinedMatches = responses[1] as List<MatchModel>;
    final MatchInfoModel? nextMatch =
        await _getCurrentPlayerNextMatch(joinedMatches: joinedMatches);

    final InitialDataValue initialDataValue = InitialDataValue(
      invitedMatches: invitedMatches,
      joinedMatches: joinedMatches,
      nextMatch: nextMatch,
    );

    return initialDataValue;
  }

  Future<List<MatchModel>> _getCurrentPlayerJoinedMatches() async {
    final AuthModel? authModel = await _authStatusRepository.getAuthStatus();
    if (authModel == null) {
      throw AuthExceptionUnauthorized(
          message: "There is no player currently signed in");
    }

    final String playerId = authModel.id;
    final List<MatchModel> joinedMatches =
        await _matchesRepository.getPlayerJoinedMatches(playerId);
    return joinedMatches;
  }

// TODO move all this below
  Future<MatchInfoModel?> _getCurrentPlayerNextMatch({
    required List<MatchModel> joinedMatches,
  }) async {
    if (joinedMatches.isEmpty) return null;

    final List<MatchModel> sortedMatches = [...joinedMatches]
      ..sort((previous, current) {
        final DateTime previousDate = previous.date;
        final DateTime currentDate = current.date;

        // sort by date, so that closest match is first
        return previousDate.compareTo(currentDate);
      });

    final MatchModel nextMatch = sortedMatches.first;

    final bool shouldWeatherBeRetrieved = _checkShouldWeatherBeRetrieved(
      matchDate: nextMatch.date,
      location: nextMatch.location,
    );

    final WeatherModel? weather = shouldWeatherBeRetrieved
        ? await _weatherRepository.getWeatherForCoordinates(
            // TODO make this non-nullable
            latitude: nextMatch.location.cityLatitude,
            longitude: nextMatch.location.cityLongitude,
          )
        : null;

    final MatchInfoModel matchInfo = MatchInfoModel.fromWeatherAndMatchModels(
      match: nextMatch,
      weather: weather,
    );

    return matchInfo;
  }

  Future<List<MatchModel>> _getCurrentPlayerInvitedMatches() async {
    final AuthModel? authModel = await _authStatusRepository.getAuthStatus();
    if (authModel == null) {
      throw AuthExceptionUnauthorized(
          message: "There is no player currently signed in");
    }

    final String playerId = authModel.id;

    final List<MatchModel> invitedMatches =
        await _matchesRepository.getPlayerInvitedMatches(playerId);
    return invitedMatches;
  }

  // TODO same funciton existsin in matches service - should unify it somewhere in helpers for weather possibly
  // make it in weather feature, some kind of helper - for now it can be a mixin
  bool _checkShouldWeatherBeRetrieved({
    required DateTime matchDate,
    required MatchLocationModel location,
  }) {
    final bool isLocationWithCoordinates =
        location.cityLatitude != null && location.cityLongitude != null;
    if (!isLocationWithCoordinates) return false;

    final DateTime now = DateTime.now();
    final DateTime nowPlus14Days = now.add(const Duration(days: 14));

    if (matchDate.isAfter(nowPlus14Days)) {
      return false;
    }

    return true;
  }
}
