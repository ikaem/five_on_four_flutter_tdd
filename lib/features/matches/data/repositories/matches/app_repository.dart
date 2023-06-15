import 'package:five_on_four_flutter_tdd/features/matches/data/data_sources/matches_remote/data_source.dart';
import 'package:five_on_four_flutter_tdd/features/matches/data/dtos/match_remote/dto.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/models/match/model.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/repositories_interfaces/matches_repository.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/values/match_participantion/value.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/values/matches_search_filters/value.dart';

import 'package:five_on_four_flutter_tdd/features/matches/domain/values/new_match/value.dart';
import 'package:five_on_four_flutter_tdd/features/matches/presentation/state/controllers/matches_all/providers/provider.dart';

class MatchesAppRepository implements MatchesRepository {
  const MatchesAppRepository({
    required MatchesRemoteDataSource remoteDataSource,
  }) : _remoteDataSource = remoteDataSource;

  final MatchesRemoteDataSource _remoteDataSource;

  @override
  Future<List<MatchModel>> getPlayerInvitedMatches(String playerId) async {
    final List<MatchRemoteDTO> remoteMatches =
        await _remoteDataSource.getInvitedMatchesForPlayer(playerId);

    return remoteMatches.map((dto) => MatchModel.fromRemoteDto(dto)).toList();
  }

  @override
  Future<List<MatchModel>> getPlayerJoinedMatches(String playerId) async {
    final List<MatchRemoteDTO> remoteMatches =
        await _remoteDataSource.getJoinedMatchesForPlayer(playerId);

    return remoteMatches.map((dto) => MatchModel.fromRemoteDto(dto)).toList();
  }

// TODO not needed
  // @override
  // Future<MatchModel> getPlayerNextMatch(String playerId) async {
  //   final MatchRemoteDTO remoteMatch =
  //       await remoteDataSource.getNextMatchForPlayer(playerId);
  //   final MatchModel match = MatchModel.fromRemoteDto(remoteMatch);

  //   return match;
  // }

  @override
  Future<MatchModel> getMatch(String matchId) async {
    final MatchRemoteDTO remoteDTO = await _remoteDataSource.getMatch(matchId);

    final MatchModel match = MatchModel.fromRemoteDto(remoteDTO);

    return match;
  }

  @override
  Future<String> createMatch({
    required NewMatchValue matchData,
    // required PlayerModel currentPlayer,
    required String playerId,
    required String playerNickname,
  }) async {
    final String id = await _remoteDataSource.createMatch(
      matchData: matchData,
      // currentPlayer: currentPlayer,
      playerId: playerId,
      playerNickname: playerNickname,
    );

    return id;
  }

  @override
  Future<void> joinMatch({
    required String matchId,
    required MatchParticipationValue matchParticipation,
  }) async {
    await _remoteDataSource.joinMatch(
      matchId: matchId,
      matchParticipation: matchParticipation,
    );
  }

  Future<void> unjoinMatch({
    required String matchId,
    required MatchParticipationValue matchParticipation,
  }) async {
    await _remoteDataSource.unjoinMatch(
      matchId: matchId,
      matchParticipation: matchParticipation,
    );
  }

  @override
  Future<List<MatchModel>> getSearchedMatches(
    MatchesSearchFiltersValue filters,
    RegionCoordinatesBoundariesValue coordinatesBoundaries,
  ) async {
    final List<MatchRemoteDTO> dtoResults =
        await _remoteDataSource.getSearchedMatches(
      filters,
      coordinatesBoundaries,
    );

    final List<MatchModel> matches =
        dtoResults.map((e) => MatchModel.fromRemoteDto(e)).toList();

    return matches;
  }

  @override
  Future<List<MatchModel>> getAllMatches(
    RegionCoordinatesBoundariesValue coordinatesBoundaries,
  ) async {
    final List<MatchRemoteDTO> dtoResults =
        await _remoteDataSource.getAllMatches(
      coordinatesBoundaries,
    );

    final List<MatchModel> matches =
        dtoResults.map((e) => MatchModel.fromRemoteDto(e)).toList();

    return matches;
  }

  @override
  Future<void> deletePlayerMatchParticipations(String playerId) async {
    await _remoteDataSource.deletePlayerMatchParticipations(playerId);
  }

  // TODO add player organizer to matches

  @override
  Future<void> removePlayerAsMatchesOrganizer(String playerId) async {
    await _remoteDataSource.removePlayerAsMatchesOrganizer(playerId);
  }
}
