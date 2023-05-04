import 'package:five_on_four_flutter_tdd/features/auth/domain/models/auth/model.dart';
import 'package:five_on_four_flutter_tdd/features/auth/domain/repository_interfaces/auth_status_repository.dart';
import 'package:five_on_four_flutter_tdd/features/matches/application/services/matches/service.dart';
import 'package:five_on_four_flutter_tdd/features/matches/data/data_sources/matches_remote/data_source.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/enums/match_participant_status.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/models/match/model.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/models/match_info/model.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/repositories_interfaces/matches_repository.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/values/match_participantion/value.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/values/new_match/value.dart';
import 'package:five_on_four_flutter_tdd/features/matches/utils/extensions/match_model_extension.dart';
import 'package:five_on_four_flutter_tdd/features/players/domain/models/player/model.dart';
import 'package:five_on_four_flutter_tdd/features/weather/domain/models/weather/model.dart';

class MatchesAppService implements MatchesService {
  MatchesAppService({
    required this.matchesRepository,
    required this.authStatusRepository,
    // TODO probably get some network status service or repository here
  });

  // TODO functions here should be called handle

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

  Future<void> handleJoinMatch(MatchModel match) async {
    final AuthModel? currentPlayer = await authStatusRepository.getAuthStatus();
    if (currentPlayer == null) {
      // TODO this needs maybe to logout
      throw "Something";
    }

    final MatchParticipationValue participation =
        MatchParticipationValue.fromPlayerModel(currentPlayer.player);

    final bool hasPlayerJoinedMatch = checkHasPlayerJoinedMatch(match);

    if (!hasPlayerJoinedMatch) {
      // TODO join match needs adjusting now - no need to check if player has joined match in the function itself
      await matchesRepository.joinMatch(
        matchId: match.id,
        matchParticipation: participation,
      );

      return;
    }

    // now we unjoin
    await matchesRepository.unjoinMatch(
      matchId: match.id,
      matchParticipation: participation,
    );
  }

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
          // TODO there is an enum for this
          participant.status == MatchParticipantStatus.joined;

      return isParticipating;
    });

    return isCurrentPlayerParticipating;
  }

  @override
  Future<List<MatchModel>> handleSearchMatches(
      MatchesSearchFilters filters) async {
    // TODO this will decide where to search from - local or remote
    // TODO this could also be a stream generator
    // TODO: implement handleSearchMatches
    final List<MatchModel> matches =
        await matchesRepository.getSearchedMatches(filters);

    return matches;
  }

  // TODO this will have access to network status info
}
