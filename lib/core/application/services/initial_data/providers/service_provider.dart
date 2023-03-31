import 'package:five_on_four_flutter_tdd/core/application/services/initial_data/service.dart';
import 'package:five_on_four_flutter_tdd/features/auth/data/repositories/auth_status/providers/app_repository_provider.dart';
import 'package:five_on_four_flutter_tdd/features/auth/domain/repository_interfaces/auth_status_repository.dart';
import 'package:five_on_four_flutter_tdd/features/matches/data/repositories/matches/providers/app_repository_provider.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/repositories_interfaces/matches_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final Provider<InitialDataService> initialDataServiceProvider =
    Provider<InitialDataService>((ref) {
  final MatchesRepository matchesRepository =
      ref.read(matchesRepositoryProvider);

  final AuthStatusRepository authStatusRepository =
      ref.read(authStatusRepositoryProvider);

  final InitialDataService initialDataService = InitialDataService(
    matchesRepository: matchesRepository,
    authStatusRepository: authStatusRepository,
  );

  return initialDataService;
});
