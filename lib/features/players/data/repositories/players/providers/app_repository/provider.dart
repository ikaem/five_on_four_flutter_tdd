// TODO this is correct folder stucutre for providers - make sure it is everywhetre

import 'package:five_on_four_flutter_tdd/features/players/data/data_sources/players_remote/data_source.dart';
import 'package:five_on_four_flutter_tdd/features/players/data/data_sources/players_remote/providers/app_data_source/provider.dart';
import 'package:five_on_four_flutter_tdd/features/players/data/repositories/players/app_repository.dart';
import 'package:five_on_four_flutter_tdd/features/players/domain/repository_interfaces/players_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "provider.g.dart";

@riverpod
PlayersRepository playersAppRepository(PlayersAppRepositoryRef ref) {
  final PlayersRemoteDataSource playersRemoteDataSource =
      ref.read(playersRemoteAppDataSourceProvider);

  final PlayersRepository playersRepository =
      PlayersAppRepository(playersRemoteDataSource: playersRemoteDataSource);

  return playersRepository;
}
