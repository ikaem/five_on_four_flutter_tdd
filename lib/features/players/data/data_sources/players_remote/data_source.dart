import 'package:five_on_four_flutter_tdd/features/players/data/dtos/player_remote/dto.dart';
import 'package:flutter/material.dart';

abstract class PlayersRemoteDataSource {
  // TODO eventually, we will have to create some filters here later
  Future<List<PlayerRemoteDTO>> getSearchedPlayers(
      PlayersSearchFilters filters);
}

// TODO move this to values
@immutable
class PlayersSearchFilters {}
