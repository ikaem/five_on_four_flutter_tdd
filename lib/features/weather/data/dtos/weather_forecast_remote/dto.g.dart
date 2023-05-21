// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_WeatherForecastRemoteDTO _$$_WeatherForecastRemoteDTOFromJson(
        Map<String, dynamic> json) =>
    _$_WeatherForecastRemoteDTO(
      location: WeatherLocationRemoteDTO.fromJson(
          json['location'] as Map<String, dynamic>),
      current: WeatherCurrentRemoteDTO.fromJson(
          json['current'] as Map<String, dynamic>),
      forecast: WeatherForecastDayListRemoteDTO.fromJson(
          json['forecast'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_WeatherForecastRemoteDTOToJson(
        _$_WeatherForecastRemoteDTO instance) =>
    <String, dynamic>{
      'location': instance.location,
      'current': instance.current,
      'forecast': instance.forecast,
    };

_$_WeatherLocationRemoteDTO _$$_WeatherLocationRemoteDTOFromJson(
        Map<String, dynamic> json) =>
    _$_WeatherLocationRemoteDTO(
      name: json['name'] as String,
      region: json['region'] as String,
      country: json['country'] as String,
      lat: (json['lat'] as num).toDouble(),
      lon: (json['lon'] as num).toDouble(),
      tzId: json['tz_id'] as String,
      localTimeEpoch: json['localtime_epoch'] as int,
      localTime: json['localtime'] as String,
    );

Map<String, dynamic> _$$_WeatherLocationRemoteDTOToJson(
        _$_WeatherLocationRemoteDTO instance) =>
    <String, dynamic>{
      'name': instance.name,
      'region': instance.region,
      'country': instance.country,
      'lat': instance.lat,
      'lon': instance.lon,
      'tz_id': instance.tzId,
      'localtime_epoch': instance.localTimeEpoch,
      'localtime': instance.localTime,
    };

_$_WeatherCurrentRemoteDTO _$$_WeatherCurrentRemoteDTOFromJson(
        Map<String, dynamic> json) =>
    _$_WeatherCurrentRemoteDTO(
      lastUpdatedEpoch: json['last_updated_epoch'] as int,
      lastUpdated: json['last_updated'] as String,
      tempC: (json['temp_c'] as num).toDouble(),
      tempF: (json['temp_f'] as num).toDouble(),
      isDay: json['is_day'] as int,
      condition: WeatherCurrentConditionRemoteDTO.fromJson(
          json['condition'] as Map<String, dynamic>),
      windMph: (json['wind_mph'] as num).toDouble(),
      windKph: (json['wind_kph'] as num).toDouble(),
      windDegree: json['wind_degree'] as int,
      windDir: json['wind_dir'] as String,
      pressureMb: (json['pressure_mb'] as num).toDouble(),
      pressureIn: (json['pressure_in'] as num).toDouble(),
      precipMm: (json['precip_mm'] as num).toDouble(),
      precipIn: (json['precip_in'] as num).toDouble(),
      humidity: json['humidity'] as int,
      cloud: json['cloud'] as int,
      feelsLikeC: (json['feelslike_c'] as num).toDouble(),
      feelsLikeF: (json['feelslike_f'] as num).toDouble(),
      visKm: (json['vis_km'] as num).toDouble(),
      visMiles: (json['vis_miles'] as num).toDouble(),
      uv: (json['uv'] as num).toDouble(),
      gustMph: (json['gust_mph'] as num).toDouble(),
      gustKph: (json['gust_kph'] as num).toDouble(),
    );

Map<String, dynamic> _$$_WeatherCurrentRemoteDTOToJson(
        _$_WeatherCurrentRemoteDTO instance) =>
    <String, dynamic>{
      'last_updated_epoch': instance.lastUpdatedEpoch,
      'last_updated': instance.lastUpdated,
      'temp_c': instance.tempC,
      'temp_f': instance.tempF,
      'is_day': instance.isDay,
      'condition': instance.condition,
      'wind_mph': instance.windMph,
      'wind_kph': instance.windKph,
      'wind_degree': instance.windDegree,
      'wind_dir': instance.windDir,
      'pressure_mb': instance.pressureMb,
      'pressure_in': instance.pressureIn,
      'precip_mm': instance.precipMm,
      'precip_in': instance.precipIn,
      'humidity': instance.humidity,
      'cloud': instance.cloud,
      'feelslike_c': instance.feelsLikeC,
      'feelslike_f': instance.feelsLikeF,
      'vis_km': instance.visKm,
      'vis_miles': instance.visMiles,
      'uv': instance.uv,
      'gust_mph': instance.gustMph,
      'gust_kph': instance.gustKph,
    };

_$_WeatherCurrentConditionRemoteDTO
    _$$_WeatherCurrentConditionRemoteDTOFromJson(Map<String, dynamic> json) =>
        _$_WeatherCurrentConditionRemoteDTO(
          text: json['text'] as String,
          icon: json['icon'] as String,
          code: json['code'] as int,
        );

Map<String, dynamic> _$$_WeatherCurrentConditionRemoteDTOToJson(
        _$_WeatherCurrentConditionRemoteDTO instance) =>
    <String, dynamic>{
      'text': instance.text,
      'icon': instance.icon,
      'code': instance.code,
    };

_$_WeatherForecastDayListRemoteDTO _$$_WeatherForecastDayListRemoteDTOFromJson(
        Map<String, dynamic> json) =>
    _$_WeatherForecastDayListRemoteDTO(
      forecastday: (json['forecastday'] as List<dynamic>)
          .map((e) =>
              WeatherForecastDayRemoteDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_WeatherForecastDayListRemoteDTOToJson(
        _$_WeatherForecastDayListRemoteDTO instance) =>
    <String, dynamic>{
      'forecastday': instance.forecastday,
    };

_$_WeatherForecastDayRemoteDTO _$$_WeatherForecastDayRemoteDTOFromJson(
        Map<String, dynamic> json) =>
    _$_WeatherForecastDayRemoteDTO(
      date: json['date'] as String,
      dateEpoch: json['date_epoch'] as int,
      day: WeatherDayRemoteDTO.fromJson(json['day'] as Map<String, dynamic>),
      astro:
          WeatherAstroRemoteDTO.fromJson(json['astro'] as Map<String, dynamic>),
      hour: (json['hour'] as List<dynamic>)
          .map((e) => WeatherHourRemoteDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_WeatherForecastDayRemoteDTOToJson(
        _$_WeatherForecastDayRemoteDTO instance) =>
    <String, dynamic>{
      'date': instance.date,
      'date_epoch': instance.dateEpoch,
      'day': instance.day,
      'astro': instance.astro,
      'hour': instance.hour,
    };

_$_WeatherDayRemoteDTO _$$_WeatherDayRemoteDTOFromJson(
        Map<String, dynamic> json) =>
    _$_WeatherDayRemoteDTO(
      maxTempC: (json['maxtemp_c'] as num).toDouble(),
      maxTempF: (json['maxtemp_f'] as num).toDouble(),
      minTempC: (json['mintemp_c'] as num).toDouble(),
      minTempF: (json['mintemp_f'] as num).toDouble(),
      avgTempC: (json['avgtemp_c'] as num).toDouble(),
      avgTempF: (json['avgtemp_f'] as num).toDouble(),
      maxWindMph: (json['maxwind_mph'] as num).toDouble(),
      maxWindKph: (json['maxwind_kph'] as num).toDouble(),
      totalPrecipMm: (json['totalprecip_mm'] as num).toDouble(),
      totalPrecipIn: (json['totalprecip_in'] as num).toDouble(),
      totalSnowCm: (json['totalsnow_cm'] as num).toDouble(),
      avgVisKm: (json['avgvis_km'] as num).toDouble(),
      avgVisMiles: (json['avgvis_miles'] as num).toDouble(),
      avgHumidity: (json['avghumidity'] as num).toDouble(),
      dailyWillItRain: json['daily_will_it_rain'] as int,
      dailyChanceOfRain: json['daily_chance_of_rain'] as int,
      dailyWillItSnow: json['daily_will_it_snow'] as int,
      dailyChanceOfSnow: json['daily_chance_of_snow'] as int,
      condition: WeatherCurrentConditionRemoteDTO.fromJson(
          json['condition'] as Map<String, dynamic>),
      uv: (json['uv'] as num).toDouble(),
    );

Map<String, dynamic> _$$_WeatherDayRemoteDTOToJson(
        _$_WeatherDayRemoteDTO instance) =>
    <String, dynamic>{
      'maxtemp_c': instance.maxTempC,
      'maxtemp_f': instance.maxTempF,
      'mintemp_c': instance.minTempC,
      'mintemp_f': instance.minTempF,
      'avgtemp_c': instance.avgTempC,
      'avgtemp_f': instance.avgTempF,
      'maxwind_mph': instance.maxWindMph,
      'maxwind_kph': instance.maxWindKph,
      'totalprecip_mm': instance.totalPrecipMm,
      'totalprecip_in': instance.totalPrecipIn,
      'totalsnow_cm': instance.totalSnowCm,
      'avgvis_km': instance.avgVisKm,
      'avgvis_miles': instance.avgVisMiles,
      'avghumidity': instance.avgHumidity,
      'daily_will_it_rain': instance.dailyWillItRain,
      'daily_chance_of_rain': instance.dailyChanceOfRain,
      'daily_will_it_snow': instance.dailyWillItSnow,
      'daily_chance_of_snow': instance.dailyChanceOfSnow,
      'condition': instance.condition,
      'uv': instance.uv,
    };

_$_WeatherAstroRemoteDTO _$$_WeatherAstroRemoteDTOFromJson(
        Map<String, dynamic> json) =>
    _$_WeatherAstroRemoteDTO(
      sunrise: json['sunrise'] as String,
      sunset: json['sunset'] as String,
      moonrise: json['moonrise'] as String,
      moonset: json['moonset'] as String,
      moonPhase: json['moon_phase'] as String,
      moonIllumination: json['moon_illumination'] as String,
      isMoonUp: json['is_moon_up'] as int,
      isSunUp: json['is_sun_up'] as int,
    );

Map<String, dynamic> _$$_WeatherAstroRemoteDTOToJson(
        _$_WeatherAstroRemoteDTO instance) =>
    <String, dynamic>{
      'sunrise': instance.sunrise,
      'sunset': instance.sunset,
      'moonrise': instance.moonrise,
      'moonset': instance.moonset,
      'moon_phase': instance.moonPhase,
      'moon_illumination': instance.moonIllumination,
      'is_moon_up': instance.isMoonUp,
      'is_sun_up': instance.isSunUp,
    };

_$_WeatherHourRemoteDTO _$$_WeatherHourRemoteDTOFromJson(
        Map<String, dynamic> json) =>
    _$_WeatherHourRemoteDTO(
      time: json['time'] as String,
      timeEpoch: json['time_epoch'] as int,
      tempC: (json['temp_c'] as num).toDouble(),
      tempF: (json['temp_f'] as num).toDouble(),
      isDay: json['is_day'] as int,
      condition: WeatherCurrentConditionRemoteDTO.fromJson(
          json['condition'] as Map<String, dynamic>),
      windMph: (json['wind_mph'] as num).toDouble(),
      windKph: (json['wind_kph'] as num).toDouble(),
      windDegree: json['wind_degree'] as int,
      windDir: json['wind_dir'] as String,
      pressureMb: (json['pressure_mb'] as num).toDouble(),
      pressureIn: (json['pressure_in'] as num).toDouble(),
      precipMm: (json['precip_mm'] as num).toDouble(),
      precipIn: (json['precip_in'] as num).toDouble(),
      humidity: json['humidity'] as int,
      cloud: json['cloud'] as int,
      feelsLikeC: (json['feelslike_c'] as num).toDouble(),
      feelsLikeF: (json['feelslike_f'] as num).toDouble(),
      windChillC: (json['windchill_c'] as num).toDouble(),
      windChillF: (json['windchill_f'] as num).toDouble(),
      heatIndexC: (json['heatindex_c'] as num).toDouble(),
      heatIndexF: (json['heatindex_f'] as num).toDouble(),
      dewPointC: (json['dewpoint_c'] as num).toDouble(),
      dewPointF: (json['dewpoint_f'] as num).toDouble(),
      willItRain: json['will_it_rain'] as int,
      chanceOfRain: (json['chance_of_rain'] as num).toDouble(),
      willItSnow: json['will_it_snow'] as int,
      chanceOfSnow: (json['chance_of_snow'] as num).toDouble(),
      visKm: (json['vis_km'] as num).toDouble(),
      visMiles: (json['vis_miles'] as num).toDouble(),
      gustMph: (json['gustMph'] as num?)?.toDouble(),
      gustKph: (json['gustKph'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$_WeatherHourRemoteDTOToJson(
        _$_WeatherHourRemoteDTO instance) =>
    <String, dynamic>{
      'time': instance.time,
      'time_epoch': instance.timeEpoch,
      'temp_c': instance.tempC,
      'temp_f': instance.tempF,
      'is_day': instance.isDay,
      'condition': instance.condition,
      'wind_mph': instance.windMph,
      'wind_kph': instance.windKph,
      'wind_degree': instance.windDegree,
      'wind_dir': instance.windDir,
      'pressure_mb': instance.pressureMb,
      'pressure_in': instance.pressureIn,
      'precip_mm': instance.precipMm,
      'precip_in': instance.precipIn,
      'humidity': instance.humidity,
      'cloud': instance.cloud,
      'feelslike_c': instance.feelsLikeC,
      'feelslike_f': instance.feelsLikeF,
      'windchill_c': instance.windChillC,
      'windchill_f': instance.windChillF,
      'heatindex_c': instance.heatIndexC,
      'heatindex_f': instance.heatIndexF,
      'dewpoint_c': instance.dewPointC,
      'dewpoint_f': instance.dewPointF,
      'will_it_rain': instance.willItRain,
      'chance_of_rain': instance.chanceOfRain,
      'will_it_snow': instance.willItSnow,
      'chance_of_snow': instance.chanceOfSnow,
      'vis_km': instance.visKm,
      'vis_miles': instance.visMiles,
      'gustMph': instance.gustMph,
      'gustKph': instance.gustKph,
    };
