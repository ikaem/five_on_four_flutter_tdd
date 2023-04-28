import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/models/match_info/model.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/models/match/model.dart';

part 'value.freezed.dart';

@freezed
class InitialDataValue with _$InitialDataValue {
  const factory InitialDataValue({
    required List<MatchModel> invitedMatches,
    required List<MatchModel> joinedMatches,
    required MatchInfoModel nextMatch,
  }) = _InitialDataValue;
}
