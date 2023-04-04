import 'package:five_on_four_flutter_tdd/features/matches/data/data_sources/matches_remote/data_source.dart';
import 'package:five_on_four_flutter_tdd/features/matches/data/data_sources/matches_remote/fake_data_source.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "provider.g.dart";

@riverpod
MatchesRemoteDataSource matchesRemoteFakeDataSource(
  MatchesRemoteFakeDataSourceRef ref,
) {
  final MatchesRemoteDataSource dataSource = MatchesRemoteFakeDataSource();

  return dataSource;
}
