import 'package:five_on_four_flutter_tdd/core/application/services/initial_data/app_service.dart';
import 'package:five_on_four_flutter_tdd/core/application/services/initial_data/service.dart';
import 'package:five_on_four_flutter_tdd/features/auth/data/repositories/auth_status/providers/app_repository/provider.dart';
import 'package:five_on_four_flutter_tdd/features/auth/domain/repository_interfaces/auth_status_repository.dart';
import 'package:five_on_four_flutter_tdd/features/matches/data/repositories/matches/providers/app_repository/provider.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/repositories_interfaces/matches_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "provider.g.dart";

@riverpod
InitialDataService initialDataService(InitialDataServiceRef ref) {
  final MatchesRepository matchesRepository =
      ref.read(matchesRepositoryProvider);

  final AuthStatusRepository authStatusRepository =
      ref.read(authStatusRepositoryProvider);

  final InitialDataService initialDataService = InitialDataAppService(
    matchesRepository: matchesRepository,
    authStatusRepository: authStatusRepository,
  );

  return initialDataService;
}
