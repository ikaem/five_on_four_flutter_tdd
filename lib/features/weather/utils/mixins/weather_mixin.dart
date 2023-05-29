import 'package:five_on_four_flutter_tdd/features/matches/domain/models/match/model.dart';

mixin WeatherMixin {
  bool checkShouldWeatherBeRetrieved({
    required DateTime matchDate,
    required MatchLocationModel location,
  }) {
    final bool isLocationWithCoordinates =
        location.cityLatitude != null && location.cityLongitude != null;
    if (!isLocationWithCoordinates) return false;

    final DateTime now = DateTime.now();
    final DateTime nowPlus14Days = now.add(const Duration(days: 14));

    if (matchDate.isAfter(nowPlus14Days)) {
      return false;
    }

    return true;
  }
}
