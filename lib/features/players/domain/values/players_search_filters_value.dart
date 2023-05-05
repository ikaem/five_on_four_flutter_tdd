import 'package:freezed_annotation/freezed_annotation.dart';

part "players_search_filters_value.freezed.dart";

@freezed
class PlayersSearchFiltersValue with _$PlayersSearchFiltersValue {
  const factory PlayersSearchFiltersValue({required String searchTermm}) =
      _PlayersSearchFiltersValue;
}
