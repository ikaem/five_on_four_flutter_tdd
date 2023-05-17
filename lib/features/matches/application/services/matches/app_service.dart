import 'package:five_on_four_flutter_tdd/features/auth/domain/models/auth/model.dart';
import 'package:five_on_four_flutter_tdd/features/auth/domain/repository_interfaces/auth_status_repository.dart';
import 'package:five_on_four_flutter_tdd/features/core/domain/models/location/model.dart';
import 'package:five_on_four_flutter_tdd/features/matches/application/services/matches/service.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/enums/match_participant_status.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/models/match/model.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/models/match_info/model.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/repositories_interfaces/matches_repository.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/values/match_participantion/value.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/values/matches_search_filters/value.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/values/new_match/value.dart';
import 'package:five_on_four_flutter_tdd/features/matches/utils/extensions/match_model_extension.dart';
import 'package:five_on_four_flutter_tdd/features/players/domain/models/player/model.dart';
import 'package:five_on_four_flutter_tdd/features/weather/domain/models/weather/model.dart';
import 'package:five_on_four_flutter_tdd/features/weather/domain/repositories_interfaces/weather_repository.dart';
import 'package:five_on_four_flutter_tdd/libraries/geocoding/location_wrapper.dart';

class MatchesAppService extends MatchesService with MatchesServiceMixin {
  const MatchesAppService({
    required MatchesRepository matchesRepository,
    required AuthStatusRepository authStatusRepository,
    required WeatherRepository weatherRepository,
    required LocationWrapper locationWrapper,
  })  : _weatherRepository = weatherRepository,
        matchesRepository = matchesRepository,
        authStatusRepository = authStatusRepository,
        locationWrapper = locationWrapper;

  final MatchesRepository matchesRepository;
  final AuthStatusRepository authStatusRepository;
  final LocationWrapper locationWrapper;
  final WeatherRepository _weatherRepository;
  // TODO probably get some network status service or repository here

  @override
  Future<MatchInfoModel> handleGetMatchInfo(String matchId) async {
    final MatchModel match = await matchesRepository.getMatch(matchId);

    final bool shouldWeatherBeRetrieved = checkShouldWeatherBeRetrieved(
      matchDate: match.date,
      location: match.location,
    );

    final WeatherModel? weather = shouldWeatherBeRetrieved
        ? await _weatherRepository.getWeatherForCoordinates(
            // TODO make this non-nullable
            latitude: match.location.cityLatitude,
            longitude: match.location.cityLongitude,
          )
        : null;

    final MatchInfoModel matchInfo = MatchInfoModel.fromWeatherAndMatchModels(
      match: match,
      weather: weather,
    );

    return matchInfo;
  }

  @override
  Future<String> handleCreateMatch(NewMatchValue data) async {
    NewMatchValue matchData = data;
    // TOOD i could get sync value from this, if I used value or null or subject
    final AuthModel? currentPlayer = await authStatusRepository.getAuthStatus();
    if (currentPlayer == null) {
      // TODO this needs maybe to logout
      throw "Something";
    }

    // join player if they are not already joined
    if (data.isOrganizerJoined) {
      final MatchParticipationValue participation =
          MatchParticipationValue.fromPlayerModel(
        player: currentPlayer.player,
        status: MatchParticipantStatus.joined,
      );

      matchData = data.addParticipation(participation);
    }

    final String id = await matchesRepository.createMatch(
        matchData: matchData, currentPlayer: currentPlayer.player);

    return id;
  }

  Future<void> handleJoinMatch(MatchModel match) async {
    final AuthModel? currentPlayer = await authStatusRepository.getAuthStatus();
    if (currentPlayer == null) {
      // TODO this needs maybe to logout
      throw "Something";
    }

    final bool hasPlayerJoinedMatch = checkHasPlayerJoinedMatch(match);
    final MatchParticipationValue participation =
        MatchParticipationValue.fromPlayerModel(
      player: currentPlayer.player,
      status: hasPlayerJoinedMatch
          ? MatchParticipantStatus.unjoined
          : MatchParticipantStatus.joined,
    );

// TODO maybe we dont need two functions if we have status on the participation
// TODO come back to this
    if (!hasPlayerJoinedMatch) {
      await matchesRepository.joinMatch(
        matchId: match.id,
        matchParticipation: participation,
      );

      return;
    }

    await matchesRepository.unjoinMatch(
      matchId: match.id,
      matchParticipation: participation,
    );
  }

// TODO not sure this should be here. maybe we can just pass current player to the controller
  @override
  bool checkHasPlayerJoinedMatch(MatchModel match) {
    final AuthModel? auth = authStatusRepository.getAuthStatus();
    if (auth == null) {
      // TODO this needs maybe to logout
      throw "Something";
    }

    final PlayerModel currentPlayer = auth.player;
    final allParticipants = match.allParticipants;

    final bool isCurrentPlayerParticipating =
        allParticipants.any((participant) {
      final bool isParticipating = participant.playerId == currentPlayer.id &&
          participant.status == MatchParticipantStatus.joined;

      return isParticipating;
    });

    return isCurrentPlayerParticipating;
  }

  @override
  Future<List<MatchModel>> handleSearchMatches(
    MatchesSearchFiltersValue filters,
  ) async {
    // TODO this will decide where to search from - local or remote
    // TODO this could also be a stream generator
    final List<MatchModel> matches =
        await matchesRepository.getSearchedMatches(filters);

    return matches;
  }

  @override
  Future<LocationModel?> handleGetLocationForMatchCity({
    required String address,
    required String city,
  }) async {
    final LocationModel? location = await locationWrapper.getLocationForPlace(
      address: address,
      city: city,
    );

    return location;
  }
}

// TODO move to mixins
mixin MatchesServiceMixin on MatchesService {
  bool checkShouldWeatherBeRetrieved({
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
