import 'package:five_on_four_flutter_tdd/features/matches/domain/models/match/model.dart';
import 'package:five_on_four_flutter_tdd/features/weather/domain/models/weather/model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'model.freezed.dart';

@freezed
class MatchInfoModel with _$MatchInfoModel {
  const factory MatchInfoModel({
    required MatchModel match,
    required WeatherModel weather,
  }) = _MatchInfoModel;

  factory MatchInfoModel.fromWeatherAndMatchModels({
    required MatchModel match,
    required WeatherModel weather,
  }) {
    return MatchInfoModel(match: match, weather: weather);
  }
}
