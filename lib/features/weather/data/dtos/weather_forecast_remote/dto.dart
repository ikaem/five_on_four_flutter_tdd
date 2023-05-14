// WeatherForecastDTO
// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part "dto.freezed.dart";
part "dto.g.dart";

@freezed
class WeatherForecastRemoteDTO with _$WeatherForecastRemoteDTO {
  const factory WeatherForecastRemoteDTO({
    required WeatherLocationRemoteDTO location,
    required WeatherCurrentRemoteDTO current,
    required WeatherForecastDayListRemoteDTO forecast,
  }) = _WeatherForecastRemoteDTO;

  factory WeatherForecastRemoteDTO.fromJson(Map<String, dynamic> json) =>
      _$WeatherForecastRemoteDTOFromJson(json);
}

// WeatherLocationRemoteDTO
@freezed
class WeatherLocationRemoteDTO with _$WeatherLocationRemoteDTO {
  const factory WeatherLocationRemoteDTO({
    required String name,
    required String region,
    required String country,
    required double lat,
    required double lon,
    @JsonKey(name: 'tz_id') required String tzId,
    @JsonKey(name: 'localtime_epoch') required int localTimeEpoch,
    @JsonKey(name: 'localtime') required String localTime,
  }) = _WeatherLocationRemoteDTO;

  factory WeatherLocationRemoteDTO.fromJson(Map<String, dynamic> json) =>
      _$WeatherLocationRemoteDTOFromJson(json);
}

// WeatherCurrentRemoteDTO
@freezed
class WeatherCurrentRemoteDTO with _$WeatherCurrentRemoteDTO {
  const factory WeatherCurrentRemoteDTO({
    @JsonKey(name: 'last_updated_epoch') required int lastUpdatedEpoch,
    @JsonKey(name: 'last_updated') required String lastUpdated,
    @JsonKey(name: 'temp_c') required double tempC,
    @JsonKey(name: 'temp_f') required double tempF,
    @JsonKey(name: 'is_day') required int isDay,
    required WeatherCurrentConditionRemoteDTO condition,
    @JsonKey(name: 'wind_mph') required double windMph,
    @JsonKey(name: 'wind_kph') required double windKph,
    @JsonKey(name: 'wind_degree') required int windDegree,
    @JsonKey(name: 'wind_dir') required String windDir,
    @JsonKey(name: 'pressure_mb') required double pressureMb,
    @JsonKey(name: 'pressure_in') required double pressureIn,
    @JsonKey(name: 'precip_mm') required double precipMm,
    @JsonKey(name: 'precip_in') required double precipIn,
    required int humidity,
    required int cloud,
    @JsonKey(name: 'feelslike_c') required double feelsLikeC,
    @JsonKey(name: 'feelslike_f') required double feelsLikeF,
    @JsonKey(name: 'vis_km') required double visKm,
    @JsonKey(name: 'vis_miles') required double visMiles,
    required double uv,
    @JsonKey(name: 'gust_mph') required double gustMph,
    @JsonKey(name: 'gust_kph') required double gustKph,
  }) = _WeatherCurrentRemoteDTO;

  factory WeatherCurrentRemoteDTO.fromJson(Map<String, dynamic> json) =>
      _$WeatherCurrentRemoteDTOFromJson(json);
}

// WeatherCurrentConditionRemoteDTO
@freezed
class WeatherCurrentConditionRemoteDTO with _$WeatherCurrentConditionRemoteDTO {
  const factory WeatherCurrentConditionRemoteDTO({
    required String text,
    required String icon,
    required int code,
  }) = _WeatherCurrentConditionRemoteDTO;

  factory WeatherCurrentConditionRemoteDTO.fromJson(
          Map<String, dynamic> json) =>
      _$WeatherCurrentConditionRemoteDTOFromJson(json);
}

// WeatherForecastDayListRemoteDTO
@freezed
class WeatherForecastDayListRemoteDTO with _$WeatherForecastDayListRemoteDTO {
  const factory WeatherForecastDayListRemoteDTO({
    required List<WeatherForecastDayRemoteDTO> forecastday,
  }) = _WeatherForecastDayListRemoteDTO;

  factory WeatherForecastDayListRemoteDTO.fromJson(Map<String, dynamic> json) =>
      _$WeatherForecastDayListRemoteDTOFromJson(json);
}

// WeatherForecastDayRemoteDTO
@freezed
class WeatherForecastDayRemoteDTO with _$WeatherForecastDayRemoteDTO {
  const factory WeatherForecastDayRemoteDTO({
    required String date,
    @JsonKey(name: 'date_epoch') required int dateEpoch,
    required WeatherDayRemoteDTO day,
    required WeatherAstroRemoteDTO astro,
    required List<WeatherHourRemoteDTO> hour,
  }) = _WeatherForecastDayRemoteDTO;

  factory WeatherForecastDayRemoteDTO.fromJson(Map<String, dynamic> json) =>
      _$WeatherForecastDayRemoteDTOFromJson(json);
}

// WeatherDayRemoteDTO
@freezed
class WeatherDayRemoteDTO with _$WeatherDayRemoteDTO {
  const factory WeatherDayRemoteDTO({
    @JsonKey(name: 'maxtemp_c') required double maxTempC,
    @JsonKey(name: 'maxtemp_f') required double maxTempF,
    @JsonKey(name: 'mintemp_c') required double minTempC,
    @JsonKey(name: 'mintemp_f') required double minTempF,
    @JsonKey(name: 'avgtemp_c') required double avgTempC,
    @JsonKey(name: 'avgtemp_f') required double avgTempF,
    @JsonKey(name: 'maxwind_mph') required double maxWindMph,
    @JsonKey(name: 'maxwind_kph') required double maxWindKph,
    @JsonKey(name: 'totalprecip_mm') required double totalPrecipMm,
    @JsonKey(name: 'totalprecip_in') required double totalPrecipIn,
    @JsonKey(name: 'totalsnow_cm') required double totalSnowCm,
    @JsonKey(name: 'avgvis_km') required double avgVisKm,
    @JsonKey(name: 'avgvis_miles') required double avgVisMiles,
    @JsonKey(name: 'avghumidity') required double avgHumidity,
    @JsonKey(name: 'daily_will_it_rain') required int dailyWillItRain,
    @JsonKey(name: 'daily_chance_of_rain') required int dailyChanceOfRain,
    @JsonKey(name: 'daily_will_it_snow') required int dailyWillItSnow,
    @JsonKey(name: 'daily_chance_of_snow') required int dailyChanceOfSnow,
    required WeatherCurrentConditionRemoteDTO condition,
    required double uv,
  }) = _WeatherDayRemoteDTO;

  factory WeatherDayRemoteDTO.fromJson(Map<String, dynamic> json) =>
      _$WeatherDayRemoteDTOFromJson(json);
}

// WeatherAstroRemoteDTO
@freezed
class WeatherAstroRemoteDTO with _$WeatherAstroRemoteDTO {
  const factory WeatherAstroRemoteDTO({
    required String sunrise,
    required String sunset,
    required String moonrise,
    required String moonset,
    @JsonKey(name: 'moon_phase') required String moonPhase,
    @JsonKey(name: 'moon_illumination') required String moonIllumination,
    @JsonKey(name: 'is_moon_up') required int isMoonUp,
    @JsonKey(name: 'is_sun_up') required int isSunUp,
  }) = _WeatherAstroRemoteDTO;

  factory WeatherAstroRemoteDTO.fromJson(Map<String, dynamic> json) =>
      _$WeatherAstroRemoteDTOFromJson(json);
}

// WeatherHourRemoteDTO
// WeatherHourRemoteDTO
@freezed
class WeatherHourRemoteDTO with _$WeatherHourRemoteDTO {
  const factory WeatherHourRemoteDTO({
    required String time,
    @JsonKey(name: 'time_epoch') required int timeEpoch,
    @JsonKey(name: 'temp_c') required double tempC,
    @JsonKey(name: 'temp_f') required double tempF,
    @JsonKey(name: 'is_day') required int isDay,
    required WeatherCurrentConditionRemoteDTO condition,
    @JsonKey(name: 'wind_mph') required double windMph,
    @JsonKey(name: 'wind_kph') required double windKph,
    @JsonKey(name: 'wind_degree') required int windDegree,
    @JsonKey(name: 'wind_dir') required String windDir,
    @JsonKey(name: 'pressure_mb') required double pressureMb,
    @JsonKey(name: 'pressure_in') required double pressureIn,
    @JsonKey(name: 'precip_mm') required double precipMm,
    @JsonKey(name: 'precip_in') required double precipIn,
    required int humidity,
    required int cloud,
    @JsonKey(name: 'feelslike_c') required double feelsLikeC,
    @JsonKey(name: 'feelslike_f') required double feelsLikeF,
    @JsonKey(name: 'windchill_c') required double windChillC,
    @JsonKey(name: 'windchill_f') required double windChillF,
    @JsonKey(name: 'heatindex_c') required double heatIndexC,
    @JsonKey(name: 'heatindex_f') required double heatIndexF,
    @JsonKey(name: 'dewpoint_c') required double dewPointC,
    @JsonKey(name: 'dewpoint_f') required double dewPointF,
    @JsonKey(name: 'will_it_rain') required int willItRain,
    @JsonKey(name: 'chance_of_rain') required double chanceOfRain,
    @JsonKey(name: 'will_it_snow') required int willItSnow,
    @JsonKey(name: 'chance_of_snow') required double chanceOfSnow,
    @JsonKey(name: 'vis_km') required double visKm,
    @JsonKey(name: 'vis_miles') required double visMiles,
    required double? gustMph,
    required double? gustKph,
  }) = _WeatherHourRemoteDTO;

  factory WeatherHourRemoteDTO.fromJson(Map<String, dynamic> json) =>
      _$WeatherHourRemoteDTOFromJson(json);
}
