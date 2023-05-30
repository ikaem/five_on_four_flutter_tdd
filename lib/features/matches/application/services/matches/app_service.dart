import 'package:five_on_four_flutter_tdd/features/auth/domain/models/auth/model.dart';
import 'package:five_on_four_flutter_tdd/features/auth/domain/repository_interfaces/auth_status_repository.dart';
import 'package:five_on_four_flutter_tdd/features/core/domain/models/coordinates/model.dart';
import 'package:five_on_four_flutter_tdd/features/core/utils/constants/firebase_functions_constants.dart';
import 'package:five_on_four_flutter_tdd/features/matches/application/services/matches/service.dart';
import 'package:five_on_four_flutter_tdd/features/matches/application/services/matches/service_mixin.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/enums/match_participant_status.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/models/match/model.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/models/match_info/model.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/repositories_interfaces/matches_repository.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/values/match_participantion/value.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/values/matches_search_filters/value.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/values/new_match/value.dart';
import 'package:five_on_four_flutter_tdd/features/matches/presentation/state/controllers/matches_in_region/providers/provider.dart';
import 'package:five_on_four_flutter_tdd/features/matches/utils/extensions/match_model_extension.dart';
import 'package:five_on_four_flutter_tdd/features/players/domain/models/player/model.dart';
import 'package:five_on_four_flutter_tdd/features/weather/domain/models/weather/model.dart';
import 'package:five_on_four_flutter_tdd/features/weather/domain/repositories_interfaces/weather_repository.dart';
import 'package:five_on_four_flutter_tdd/features/weather/utils/mixins/weather_mixin.dart';
import 'package:five_on_four_flutter_tdd/libraries/firebase/cloud_functions/cloud_functions_wrapper.dart';
import 'package:five_on_four_flutter_tdd/libraries/geocoding/location_wrapper.dart';

class MatchesAppService extends MatchesService
    with WeatherMixin, MatchesServiceMixin {
  const MatchesAppService({
    required MatchesRepository matchesRepository,
    required AuthStatusRepository authStatusRepository,
    required WeatherRepository weatherRepository,
    required LocationWrapper locationWrapper,
    required FirebaseFunctionsWrapper firebaseFunctionsWrapper,
  })  : _weatherRepository = weatherRepository,
        _matchesRepository = matchesRepository,
        _authStatusRepository = authStatusRepository,
        _firebaseFunctionsWrapper = firebaseFunctionsWrapper,
        _locationWrapper = locationWrapper;

  final MatchesRepository _matchesRepository;
  final AuthStatusRepository _authStatusRepository;
  final LocationWrapper _locationWrapper;
  final WeatherRepository _weatherRepository;
  final FirebaseFunctionsWrapper _firebaseFunctionsWrapper;

  @override
  Future<MatchInfoModel> handleGetMatchInfo(String matchId) async {
    final MatchModel match = await _matchesRepository.getMatch(matchId);

    final bool shouldWeatherBeRetrieved = checkShouldWeatherBeRetrieved(
      matchDate: match.date,
      location: match.location,
    );

    final WeatherModel? weather = shouldWeatherBeRetrieved
        ? await _weatherRepository.getWeatherForCoordinates(
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
    final AuthModel? currentPlayer = _authStatusRepository.getAuthStatus();
    if (currentPlayer == null) {
      // FUTURE: throw proper exception
      // FUTURE: maybe logout, but maybe is not needed
      throw "Something";
    }

    if (data.isOrganizerJoined) {
      final MatchParticipationValue participation =
          MatchParticipationValue.fromPlayerModel(
        player: currentPlayer.player,
        status: MatchParticipantStatus.joined,
      );

      matchData = data.addParticipation(participation);
    }

    final String id = await _matchesRepository.createMatch(
      matchData: matchData,
      currentPlayer: currentPlayer.player,
    );

    final List<MatchParticipationValue> matchInvitations = data.invitedPlayers;
    final String matchName = data.name;

    await sendMatchInvitationNotifications(
        matchId: id,
        matchInvitations: matchInvitations,
        functionName:
            FirebaseFunctionsConstants.functionSendMatchInvitationNotifications,
        matchName: matchName,
        firebaseFunctionsWrapper: _firebaseFunctionsWrapper);

    return id;
  }

  Future<void> handleJoinMatch(MatchModel match) async {
    final AuthModel? currentPlayer =
        await _authStatusRepository.getAuthStatus();
    if (currentPlayer == null) {
      // FUTURE: throw proper exception
      // FUTURE: maybe logout, but maybe is not needed
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

// FUUTURE: check if we can have only one function for both join and unjoin
    if (!hasPlayerJoinedMatch) {
      await _matchesRepository.joinMatch(
        matchId: match.id,
        matchParticipation: participation,
      );

      return;
    }

    await _matchesRepository.unjoinMatch(
      matchId: match.id,
      matchParticipation: participation,
    );
  }

// TODO not sure this should be here. maybe we can just pass current player to the controller
  @override
  bool checkHasPlayerJoinedMatch(MatchModel match) {
    final AuthModel? auth = _authStatusRepository.getAuthStatus();
    if (auth == null) {
      // FUTURE: throw proper exception
      // FUTURE: maybe logout, but maybe is not needed
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
    final List<MatchModel> matches =
        await _matchesRepository.getSearchedMatches(filters);

    return matches;
  }

  @override
  Future<CoordinatesModel?> handleGetLocationForMatchCity({
    required String address,
    required String city,
  }) async {
    final CoordinatesModel? location =
        await _locationWrapper.getLocationForPlace(
      address: address,
      city: city,
    );

    return location;
  }

  @override
  Future<List<MatchModel>> handleGetMatchesInRegion(
    RegionCoordinatesBoundariesValue boundaries,
  ) async {
    final List<MatchModel> matches =
        await _matchesRepository.getMatchesInRegion(boundaries);

    return matches;
  }
}
