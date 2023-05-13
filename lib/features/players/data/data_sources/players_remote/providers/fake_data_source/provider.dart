import 'package:five_on_four_flutter_tdd/features/players/data/data_sources/players_remote/data_source.dart';
import 'package:five_on_four_flutter_tdd/features/players/data/data_sources/players_remote/fake_data_source.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "provider.g.dart";

@riverpod
PlayersRemoteDataSource playersRemoteFakeDataSource(
  PlayersRemoteFakeDataSourceRef ref,
) {
  final PlayersRemoteDataSource fakeDataSource = PlayersRemoteFakeDataSource();

  return fakeDataSource;
}
