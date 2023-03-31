import 'package:five_on_four_flutter_tdd/features/matches/data/data_sources/matches_remote/data_source.dart';
import 'package:five_on_four_flutter_tdd/features/matches/data/dtos/match_remote/dto.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/models/match/model.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/repositories_interfaces/matches_repository.dart';

class MatchesAppRepository implements MatchesRepository {
  MatchesAppRepository({
    required this.remoteDataSource,
  });

  final MatchesRemoteDataSource remoteDataSource;

  @override
  Future<List<MatchModel>> getPlayerInvitedMatches(String playerId) async {
    final List<MatchRemoteDTO> remoteMatches =
        await remoteDataSource.getPlayerInvitedMatches(playerId);

    return remoteMatches.map((dto) => MatchModel.fromRemoteDto(dto)).toList();
  }

  @override
  Future<List<MatchModel>> getPlayerJoinedMatches(String playerId) async {
    final List<MatchRemoteDTO> remoteMatches =
        await remoteDataSource.getPlayerJoinedMatches(playerId);

    return remoteMatches.map((dto) => MatchModel.fromRemoteDto(dto)).toList();
  }

  @override
  Future<MatchModel> getPlayerNextMatch(String playerId) async {
    final MatchRemoteDTO remoteMatch =
        await remoteDataSource.getPlayerNextMatch(playerId);
    final MatchModel match = MatchModel.fromRemoteDto(remoteMatch);

    return match;
  }
}
