import 'package:five_on_four_flutter_tdd/features/matches/data/data_sources/matches_remote/data_source.dart';
import 'package:five_on_four_flutter_tdd/features/matches/data/data_sources/matches_remote/providers/fake_data_source_provider.dart';
import 'package:five_on_four_flutter_tdd/features/matches/data/repositories/matches/app_repository.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/repositories_interfaces/matches_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final matchesRepositoryProvider = Provider<MatchesRepository>(
  (ref) {
    final MatchesRemoteDataSource remoteDataSource =
        ref.read(matchesRemoteFakeDataSourceProvider);

    return MatchesAppRepository(
      remoteDataSource: remoteDataSource,
    );
  },
);
