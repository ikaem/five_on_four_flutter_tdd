import 'package:freezed_annotation/freezed_annotation.dart';

part "value.freezed.dart";

@freezed
class MatchesSearchFiltersValue with _$MatchesSearchFiltersValue {
  const factory MatchesSearchFiltersValue({
    required String searchTerm,
  }) = _MatchesSearchFiltersValue;
}
