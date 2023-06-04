import 'package:five_on_four_flutter_tdd/features/matches/data/data_sources/matches_remote/data_source.dart';
import 'package:five_on_four_flutter_tdd/features/matches/data/dtos/match_remote/dto.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/models/match/model.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/repositories_interfaces/matches_repository.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/values/match_participantion/value.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/values/matches_search_filters/value.dart';
import 'package:five_on_four_flutter_tdd/features/matches/presentation/state/controllers/matches_in_region/providers/provider.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/values/new_match/value.dart';

class MatchesAppRepository implements MatchesRepository {
  const MatchesAppRepository({
    required this.remoteDataSource,
  });

  final MatchesRemoteDataSource remoteDataSource;

  @override
  Future<List<MatchModel>> getPlayerInvitedMatches(String playerId) async {
    final List<MatchRemoteDTO> remoteMatches =
        await remoteDataSource.getInvitedMatchesForPlayer(playerId);

    return remoteMatches.map((dto) => MatchModel.fromRemoteDto(dto)).toList();
  }

  @override
  Future<List<MatchModel>> getPlayerJoinedMatches(String playerId) async {
    final List<MatchRemoteDTO> remoteMatches =
        await remoteDataSource.getJoinedMatchesForPlayer(playerId);

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
    final MatchRemoteDTO remoteDTO = await remoteDataSource.getMatch(matchId);

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
    final String id = await remoteDataSource.createMatch(
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
    await remoteDataSource.joinMatch(
      matchId: matchId,
      matchParticipation: matchParticipation,
    );
  }

  Future<void> unjoinMatch({
    required String matchId,
    required MatchParticipationValue matchParticipation,
  }) async {
    await remoteDataSource.unjoinMatch(
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
        await remoteDataSource.getSearchedMatches(
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
  ) {}

  // TODO not needed

  // @override
  // Future<List<MatchModel>> getMatchesInRegion(
  //     RegionCoordinatesBoundariesValue boundaries) async {
  //   final List<MatchRemoteDTO> dtoResults =
  //       await remoteDataSource.getMatchesInRegion(boundaries);

  //   final List<MatchModel> matches =
  //       dtoResults.map((e) => MatchModel.fromRemoteDto(e)).toList();

  //   return matches;
  // }
}
