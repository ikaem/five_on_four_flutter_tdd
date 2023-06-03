import 'package:five_on_four_flutter_tdd/features/core/data/repositories/player_preferences/app_repository.dart';
import 'package:five_on_four_flutter_tdd/features/core/domain/repository_interfaces/player_preferences_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "provider.g.dart";

@Riverpod(keepAlive: true)
PlayerPreferencesRepository playerPreferencesRepository(
  PlayerPreferencesRepositoryRef ref,
) {
  final PlayerPreferencesRepository playerPreferencesRepository =
      PlayerPreferencesAppRepository();

  return playerPreferencesRepository;
}
