import 'package:five_on_four_flutter_tdd/features/matches/data/data_sources/matches_remote/data_source.dart';
import 'package:five_on_four_flutter_tdd/features/matches/data/data_sources/matches_remote/fake_data_source.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final Provider<MatchesRemoteDataSource> matchesRemoteFakeDataSourceProvider =
    Provider<MatchesRemoteDataSource>(
  (ref) => MatchesRemoteFakeDataSource(),
);
