import 'package:five_on_four_flutter_tdd/features/matches/data/data_sources/matches_remote/data_source.dart';
import 'package:five_on_four_flutter_tdd/features/matches/data/data_sources/matches_remote/providers/app_data_source/provider.dart';
import 'package:five_on_four_flutter_tdd/features/matches/data/repositories/matches/app_repository.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/repositories_interfaces/matches_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "provider.g.dart";

@riverpod
MatchesRepository matchesRepository(MatchesRepositoryRef ref) {
  final MatchesRemoteDataSource remoteDataSource =
      ref.read(matchesRemoteAppDataSourceProvider);

  final MatchesRepository repository =
      MatchesAppRepository(remoteDataSource: remoteDataSource);

  return repository;
}
