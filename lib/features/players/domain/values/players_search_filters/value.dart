import 'package:freezed_annotation/freezed_annotation.dart';

part 'value.freezed.dart';

@freezed
class PlayersSearchFiltersValue with _$PlayersSearchFiltersValue {
  const factory PlayersSearchFiltersValue({
    required String searchTerm,
  }) = _PlayersSearchFiltersValue;
}
