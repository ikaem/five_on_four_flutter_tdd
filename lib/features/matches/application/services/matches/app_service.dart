import 'package:five_on_four_flutter_tdd/features/auth/domain/models/auth/model.dart';
import 'package:five_on_four_flutter_tdd/features/auth/domain/repository_interfaces/auth_status_repository.dart';
import 'package:five_on_four_flutter_tdd/features/core/domain/models/coordinates/model.dart';
import 'package:five_on_four_flutter_tdd/features/core/domain/repository_interfaces/player_preferences_repository.dart';
import 'package:five_on_four_flutter_tdd/features/core/domain/values/location/value.dart';
import 'package:five_on_four_flutter_tdd/features/matches/application/services/matches/service.dart';
import 'package:five_on_four_flutter_tdd/features/matches/application/services/matches/service_mixin.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/enums/match_participant_status.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/models/match/model.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/models/match_info/model.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/repositories_interfaces/matches_repository.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/values/match_participantion/value.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/values/matches_search_filters/value.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/values/new_match/value.dart';
import 'package:five_on_four_flutter_tdd/features/matches/presentation/state/controllers/matches_all/providers/provider.dart';

import 'package:five_on_four_flutter_tdd/features/matches/utils/extensions/match_model_extension.dart';
import 'package:five_on_four_flutter_tdd/features/players/domain/models/player/model.dart';
import 'package:five_on_four_flutter_tdd/features/weather/domain/models/weather/model.dart';
import 'package:five_on_four_flutter_tdd/features/weather/domain/repositories_interfaces/weather_repository.dart';
import 'package:five_on_four_flutter_tdd/features/weather/utils/mixins/weather_mixin.dart';
import 'package:five_on_four_flutter_tdd/libraries/firebase/cloud_functions/cloud_functions_wrapper.dart';
import 'package:five_on_four_flutter_tdd/libraries/geocoding/geocoding_wrapper.dart';

class MatchesAppService extends MatchesService
    with WeatherMixin, MatchesServiceMixin {
  const MatchesAppService({
    required MatchesRepository matchesRepository,
    required AuthStatusRepository authStatusRepository,
    required WeatherRepository weatherRepository,
    required GeocodingWrapper locationWrapper,
    required FirebaseFunctionsWrapper firebaseFunctionsWrapper,
    required PlayerPreferencesRepository playerPreferencesRepository,
  })  : _weatherRepository = weatherRepository,
        _matchesRepository = matchesRepository,
        _authStatusRepository = authStatusRepository,
        _firebaseFunctionsWrapper = firebaseFunctionsWrapper,
        _playerPreferencesRepository = playerPreferencesRepository,
        _locationWrapper = locationWrapper;

  final MatchesRepository _matchesRepository;
  final AuthStatusRepository _authStatusRepository;
  final GeocodingWrapper _locationWrapper;
  final WeatherRepository _weatherRepository;
  final FirebaseFunctionsWrapper _firebaseFunctionsWrapper;
  final PlayerPreferencesRepository _playerPreferencesRepository;

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

    final PlayerModel? player = _playerPreferencesRepository.currentPlayer;
    if (player == null) {
      // FUTURE: throw proper exception
      // FUTURE: maybe logout, but maybe is not needed
      throw "Something";
    }

    // final AuthModel? auth = _authStatusRepository.getAuthStatus();
    // if (auth == null) {
    //   // FUTURE: throw proper exception
    //   // FUTURE: maybe logout, but maybe is not needed
    //   throw "Something";
    // }

    if (data.isOrganizerJoined) {
      final MatchParticipationValue participation = MatchParticipationValue(
        playerId: player.id,
        nickname: player.nickname,
        status: MatchParticipantStatus.joined,
      );

// TODO this is not good i think
      matchData = data.addParticipation(participation);
    }

    final String id = await _matchesRepository.createMatch(
      matchData: matchData,
      playerId: player.id,
      playerNickname: player.nickname,
    );

    final List<MatchParticipationValue> matchInvitations = data.invitedPlayers;
    final String matchName = data.name;

// TODO test this later - fails again
    // await sendMatchInvitationNotifications(
    //   matchId: id,
    //   matchInvitations: matchInvitations,
    //   functionName: FirebaseConstants.functionSendMatchInvitationNotifications,
    //   matchName: matchName,
    //   firebaseFunctionsWrapper: _firebaseFunctionsWrapper,
    // );

    return id;
  }

  Future<void> handleJoinMatch(MatchModel match) async {
    final PlayerModel? player = _playerPreferencesRepository.currentPlayer;
    if (player == null) {
      // FUTURE: throw proper exception
      // FUTURE: maybe logout, but maybe is not needed
      throw "Something";
    }
    // final AuthModel? auth = await _authStatusRepository.getAuthStatus();
    // if (auth == null) {
    //   // FUTURE: throw proper exception
    //   // FUTURE: maybe logout, but maybe is not needed
    //   throw "Something";
    // }

    final bool hasPlayerJoinedMatch = checkHasPlayerJoinedMatch(match);
    final MatchParticipationValue participation = MatchParticipationValue(
      playerId: player.id,
      nickname: player.nickname,
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
    final allParticipants = match.allParticipants;

    final bool isCurrentPlayerParticipating =
        allParticipants.any((participant) {
      final bool isParticipating = participant.playerId == auth.id &&
          participant.status == MatchParticipantStatus.joined;

      return isParticipating;
    });

    return isCurrentPlayerParticipating;
  }

  @override
  Future<List<MatchModel>> handleSearchMatches(
    MatchesSearchFiltersValue filters,
  ) async {
    final LocationValue? currentUserLocation =
        _playerPreferencesRepository.playerCurrentLocation;
    final int? regionSize = _playerPreferencesRepository.playerRegionSize;

    final bool isSearchInRegionPossible =
        currentUserLocation != null && regionSize != null;

// TODO this might need to throw, to iunform user that there is nowhere to search from, because no location has been set
    if (!isSearchInRegionPossible) return [];

    final CoordinatesModel locationCoordinates =
        currentUserLocation.coordinates;

    final RegionCoordinatesBoundariesValue regionCoordinatesBoundaries =
        locationCoordinates
            .toRegionCoordinatesBoundaries(regionSize.toDouble());

    final List<MatchModel> matches =
        await _matchesRepository.getSearchedMatches(
      filters,
      regionCoordinatesBoundaries,
    );

    return matches;
  }

  @override
  Future<CoordinatesModel?> handleGetLocationForMatchCity({
    required String address,
    required String city,
  }) async {
    final CoordinatesModel? location =
        await _locationWrapper.getCoordinatesForPlace(
      address: address,
      city: city,
    );

    return location;
  }

// TODO this will go away
  @override
  Future<List<MatchModel>> handleGetAllMatches(
      // TODO potentially, add sorting
      // RegionCoordinatesBoundariesValue boundaries,
      ) async {
// TOOD here we will calculate boundaties
// so get location for current user
    final LocationValue? currentUserLocation =
        _playerPreferencesRepository.playerCurrentLocation;
    final int? regionSize = _playerPreferencesRepository.playerRegionSize;

    final bool isSearchInRegionPossible =
        currentUserLocation != null && regionSize != null;

// TODO this might need to throw, to iunform user that there is nowhere to search from, because no location has been set
    if (!isSearchInRegionPossible) return [];

    final CoordinatesModel locationCoordinates =
        currentUserLocation.coordinates;

    final RegionCoordinatesBoundariesValue regionCoordinatesBoundaries =
        locationCoordinates
            .toRegionCoordinatesBoundaries(regionSize.toDouble());

    final List<MatchModel> allMatches = await _matchesRepository.getAllMatches(
      regionCoordinatesBoundaries,
    );

    return allMatches;
  }
}

// TODO move to some preferences mixin, or something like that
// TOOD or make it an exension on coordinates model, and pass it region size?
