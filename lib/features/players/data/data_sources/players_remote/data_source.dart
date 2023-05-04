import 'package:five_on_four_flutter_tdd/features/players/data/dtos/player_remote/dto.dart';
import 'package:flutter/material.dart';

abstract class PlayersRemoteDataSource {
  // TODO eventually, we will have to create some filters here later
  Future<List<PlayerRemoteDTO>> getSearchedPlayers(
    PlayersSearchFilters filters,
  );

  Future<PlayerRemoteDTO> getPlayer(String playerId);
}

// TODO create this with freezed, so we have copy with
// TODO move this to values
@immutable
class PlayersSearchFilters {
  const PlayersSearchFilters({
    required this.searchTerm,
  });
  final String searchTerm;

  // PlayersSearchFilters.copyWith({
  //   String? newSearchTerm,
  // }) {
  //   searchTerm = newSearchTerm ?? searchTerm;
  // }

  PlayersSearchFilters copyWith({
    String? searchTerm,
  }) {
    return PlayersSearchFilters(
      searchTerm: searchTerm ?? this.searchTerm,
    );
  }
}
