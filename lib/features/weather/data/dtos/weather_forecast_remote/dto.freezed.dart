// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WeatherForecastRemoteDTO _$WeatherForecastRemoteDTOFromJson(
    Map<String, dynamic> json) {
  return _WeatherForecastRemoteDTO.fromJson(json);
}

/// @nodoc
mixin _$WeatherForecastRemoteDTO {
  WeatherLocationRemoteDTO get location => throw _privateConstructorUsedError;
  WeatherCurrentRemoteDTO get current => throw _privateConstructorUsedError;
  WeatherForecastDayListRemoteDTO get forecast =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WeatherForecastRemoteDTOCopyWith<WeatherForecastRemoteDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherForecastRemoteDTOCopyWith<$Res> {
  factory $WeatherForecastRemoteDTOCopyWith(WeatherForecastRemoteDTO value,
          $Res Function(WeatherForecastRemoteDTO) then) =
      _$WeatherForecastRemoteDTOCopyWithImpl<$Res, WeatherForecastRemoteDTO>;
  @useResult
  $Res call(
      {WeatherLocationRemoteDTO location,
      WeatherCurrentRemoteDTO current,
      WeatherForecastDayListRemoteDTO forecast});

  $WeatherLocationRemoteDTOCopyWith<$Res> get location;
  $WeatherCurrentRemoteDTOCopyWith<$Res> get current;
  $WeatherForecastDayListRemoteDTOCopyWith<$Res> get forecast;
}

/// @nodoc
class _$WeatherForecastRemoteDTOCopyWithImpl<$Res,
        $Val extends WeatherForecastRemoteDTO>
    implements $WeatherForecastRemoteDTOCopyWith<$Res> {
  _$WeatherForecastRemoteDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? location = null,
    Object? current = null,
    Object? forecast = null,
  }) {
    return _then(_value.copyWith(
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as WeatherLocationRemoteDTO,
      current: null == current
          ? _value.current
          : current // ignore: cast_nullable_to_non_nullable
              as WeatherCurrentRemoteDTO,
      forecast: null == forecast
          ? _value.forecast
          : forecast // ignore: cast_nullable_to_non_nullable
              as WeatherForecastDayListRemoteDTO,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $WeatherLocationRemoteDTOCopyWith<$Res> get location {
    return $WeatherLocationRemoteDTOCopyWith<$Res>(_value.location, (value) {
      return _then(_value.copyWith(location: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $WeatherCurrentRemoteDTOCopyWith<$Res> get current {
    return $WeatherCurrentRemoteDTOCopyWith<$Res>(_value.current, (value) {
      return _then(_value.copyWith(current: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $WeatherForecastDayListRemoteDTOCopyWith<$Res> get forecast {
    return $WeatherForecastDayListRemoteDTOCopyWith<$Res>(_value.forecast,
        (value) {
      return _then(_value.copyWith(forecast: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_WeatherForecastRemoteDTOCopyWith<$Res>
    implements $WeatherForecastRemoteDTOCopyWith<$Res> {
  factory _$$_WeatherForecastRemoteDTOCopyWith(
          _$_WeatherForecastRemoteDTO value,
          $Res Function(_$_WeatherForecastRemoteDTO) then) =
      __$$_WeatherForecastRemoteDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {WeatherLocationRemoteDTO location,
      WeatherCurrentRemoteDTO current,
      WeatherForecastDayListRemoteDTO forecast});

  @override
  $WeatherLocationRemoteDTOCopyWith<$Res> get location;
  @override
  $WeatherCurrentRemoteDTOCopyWith<$Res> get current;
  @override
  $WeatherForecastDayListRemoteDTOCopyWith<$Res> get forecast;
}

/// @nodoc
class __$$_WeatherForecastRemoteDTOCopyWithImpl<$Res>
    extends _$WeatherForecastRemoteDTOCopyWithImpl<$Res,
        _$_WeatherForecastRemoteDTO>
    implements _$$_WeatherForecastRemoteDTOCopyWith<$Res> {
  __$$_WeatherForecastRemoteDTOCopyWithImpl(_$_WeatherForecastRemoteDTO _value,
      $Res Function(_$_WeatherForecastRemoteDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? location = null,
    Object? current = null,
    Object? forecast = null,
  }) {
    return _then(_$_WeatherForecastRemoteDTO(
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as WeatherLocationRemoteDTO,
      current: null == current
          ? _value.current
          : current // ignore: cast_nullable_to_non_nullable
              as WeatherCurrentRemoteDTO,
      forecast: null == forecast
          ? _value.forecast
          : forecast // ignore: cast_nullable_to_non_nullable
              as WeatherForecastDayListRemoteDTO,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_WeatherForecastRemoteDTO implements _WeatherForecastRemoteDTO {
  const _$_WeatherForecastRemoteDTO(
      {required this.location, required this.current, required this.forecast});

  factory _$_WeatherForecastRemoteDTO.fromJson(Map<String, dynamic> json) =>
      _$$_WeatherForecastRemoteDTOFromJson(json);

  @override
  final WeatherLocationRemoteDTO location;
  @override
  final WeatherCurrentRemoteDTO current;
  @override
  final WeatherForecastDayListRemoteDTO forecast;

  @override
  String toString() {
    return 'WeatherForecastRemoteDTO(location: $location, current: $current, forecast: $forecast)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WeatherForecastRemoteDTO &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.current, current) || other.current == current) &&
            (identical(other.forecast, forecast) ||
                other.forecast == forecast));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, location, current, forecast);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WeatherForecastRemoteDTOCopyWith<_$_WeatherForecastRemoteDTO>
      get copyWith => __$$_WeatherForecastRemoteDTOCopyWithImpl<
          _$_WeatherForecastRemoteDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WeatherForecastRemoteDTOToJson(
      this,
    );
  }
}

abstract class _WeatherForecastRemoteDTO implements WeatherForecastRemoteDTO {
  const factory _WeatherForecastRemoteDTO(
          {required final WeatherLocationRemoteDTO location,
          required final WeatherCurrentRemoteDTO current,
          required final WeatherForecastDayListRemoteDTO forecast}) =
      _$_WeatherForecastRemoteDTO;

  factory _WeatherForecastRemoteDTO.fromJson(Map<String, dynamic> json) =
      _$_WeatherForecastRemoteDTO.fromJson;

  @override
  WeatherLocationRemoteDTO get location;
  @override
  WeatherCurrentRemoteDTO get current;
  @override
  WeatherForecastDayListRemoteDTO get forecast;
  @override
  @JsonKey(ignore: true)
  _$$_WeatherForecastRemoteDTOCopyWith<_$_WeatherForecastRemoteDTO>
      get copyWith => throw _privateConstructorUsedError;
}

WeatherLocationRemoteDTO _$WeatherLocationRemoteDTOFromJson(
    Map<String, dynamic> json) {
  return _WeatherLocationRemoteDTO.fromJson(json);
}

/// @nodoc
mixin _$WeatherLocationRemoteDTO {
  String get name => throw _privateConstructorUsedError;
  String get region => throw _privateConstructorUsedError;
  String get country => throw _privateConstructorUsedError;
  double get lat => throw _privateConstructorUsedError;
  double get lon => throw _privateConstructorUsedError;
  @JsonKey(name: 'tz_id')
  String get tzId => throw _privateConstructorUsedError;
  @JsonKey(name: 'localtime_epoch')
  int get localTimeEpoch => throw _privateConstructorUsedError;
  @JsonKey(name: 'localtime')
  String get localTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WeatherLocationRemoteDTOCopyWith<WeatherLocationRemoteDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherLocationRemoteDTOCopyWith<$Res> {
  factory $WeatherLocationRemoteDTOCopyWith(WeatherLocationRemoteDTO value,
          $Res Function(WeatherLocationRemoteDTO) then) =
      _$WeatherLocationRemoteDTOCopyWithImpl<$Res, WeatherLocationRemoteDTO>;
  @useResult
  $Res call(
      {String name,
      String region,
      String country,
      double lat,
      double lon,
      @JsonKey(name: 'tz_id') String tzId,
      @JsonKey(name: 'localtime_epoch') int localTimeEpoch,
      @JsonKey(name: 'localtime') String localTime});
}

/// @nodoc
class _$WeatherLocationRemoteDTOCopyWithImpl<$Res,
        $Val extends WeatherLocationRemoteDTO>
    implements $WeatherLocationRemoteDTOCopyWith<$Res> {
  _$WeatherLocationRemoteDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? region = null,
    Object? country = null,
    Object? lat = null,
    Object? lon = null,
    Object? tzId = null,
    Object? localTimeEpoch = null,
    Object? localTime = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      region: null == region
          ? _value.region
          : region // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lon: null == lon
          ? _value.lon
          : lon // ignore: cast_nullable_to_non_nullable
              as double,
      tzId: null == tzId
          ? _value.tzId
          : tzId // ignore: cast_nullable_to_non_nullable
              as String,
      localTimeEpoch: null == localTimeEpoch
          ? _value.localTimeEpoch
          : localTimeEpoch // ignore: cast_nullable_to_non_nullable
              as int,
      localTime: null == localTime
          ? _value.localTime
          : localTime // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_WeatherLocationRemoteDTOCopyWith<$Res>
    implements $WeatherLocationRemoteDTOCopyWith<$Res> {
  factory _$$_WeatherLocationRemoteDTOCopyWith(
          _$_WeatherLocationRemoteDTO value,
          $Res Function(_$_WeatherLocationRemoteDTO) then) =
      __$$_WeatherLocationRemoteDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String region,
      String country,
      double lat,
      double lon,
      @JsonKey(name: 'tz_id') String tzId,
      @JsonKey(name: 'localtime_epoch') int localTimeEpoch,
      @JsonKey(name: 'localtime') String localTime});
}

/// @nodoc
class __$$_WeatherLocationRemoteDTOCopyWithImpl<$Res>
    extends _$WeatherLocationRemoteDTOCopyWithImpl<$Res,
        _$_WeatherLocationRemoteDTO>
    implements _$$_WeatherLocationRemoteDTOCopyWith<$Res> {
  __$$_WeatherLocationRemoteDTOCopyWithImpl(_$_WeatherLocationRemoteDTO _value,
      $Res Function(_$_WeatherLocationRemoteDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? region = null,
    Object? country = null,
    Object? lat = null,
    Object? lon = null,
    Object? tzId = null,
    Object? localTimeEpoch = null,
    Object? localTime = null,
  }) {
    return _then(_$_WeatherLocationRemoteDTO(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      region: null == region
          ? _value.region
          : region // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lon: null == lon
          ? _value.lon
          : lon // ignore: cast_nullable_to_non_nullable
              as double,
      tzId: null == tzId
          ? _value.tzId
          : tzId // ignore: cast_nullable_to_non_nullable
              as String,
      localTimeEpoch: null == localTimeEpoch
          ? _value.localTimeEpoch
          : localTimeEpoch // ignore: cast_nullable_to_non_nullable
              as int,
      localTime: null == localTime
          ? _value.localTime
          : localTime // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_WeatherLocationRemoteDTO implements _WeatherLocationRemoteDTO {
  const _$_WeatherLocationRemoteDTO(
      {required this.name,
      required this.region,
      required this.country,
      required this.lat,
      required this.lon,
      @JsonKey(name: 'tz_id') required this.tzId,
      @JsonKey(name: 'localtime_epoch') required this.localTimeEpoch,
      @JsonKey(name: 'localtime') required this.localTime});

  factory _$_WeatherLocationRemoteDTO.fromJson(Map<String, dynamic> json) =>
      _$$_WeatherLocationRemoteDTOFromJson(json);

  @override
  final String name;
  @override
  final String region;
  @override
  final String country;
  @override
  final double lat;
  @override
  final double lon;
  @override
  @JsonKey(name: 'tz_id')
  final String tzId;
  @override
  @JsonKey(name: 'localtime_epoch')
  final int localTimeEpoch;
  @override
  @JsonKey(name: 'localtime')
  final String localTime;

  @override
  String toString() {
    return 'WeatherLocationRemoteDTO(name: $name, region: $region, country: $country, lat: $lat, lon: $lon, tzId: $tzId, localTimeEpoch: $localTimeEpoch, localTime: $localTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WeatherLocationRemoteDTO &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.region, region) || other.region == region) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lon, lon) || other.lon == lon) &&
            (identical(other.tzId, tzId) || other.tzId == tzId) &&
            (identical(other.localTimeEpoch, localTimeEpoch) ||
                other.localTimeEpoch == localTimeEpoch) &&
            (identical(other.localTime, localTime) ||
                other.localTime == localTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, region, country, lat, lon,
      tzId, localTimeEpoch, localTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WeatherLocationRemoteDTOCopyWith<_$_WeatherLocationRemoteDTO>
      get copyWith => __$$_WeatherLocationRemoteDTOCopyWithImpl<
          _$_WeatherLocationRemoteDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WeatherLocationRemoteDTOToJson(
      this,
    );
  }
}

abstract class _WeatherLocationRemoteDTO implements WeatherLocationRemoteDTO {
  const factory _WeatherLocationRemoteDTO(
          {required final String name,
          required final String region,
          required final String country,
          required final double lat,
          required final double lon,
          @JsonKey(name: 'tz_id') required final String tzId,
          @JsonKey(name: 'localtime_epoch') required final int localTimeEpoch,
          @JsonKey(name: 'localtime') required final String localTime}) =
      _$_WeatherLocationRemoteDTO;

  factory _WeatherLocationRemoteDTO.fromJson(Map<String, dynamic> json) =
      _$_WeatherLocationRemoteDTO.fromJson;

  @override
  String get name;
  @override
  String get region;
  @override
  String get country;
  @override
  double get lat;
  @override
  double get lon;
  @override
  @JsonKey(name: 'tz_id')
  String get tzId;
  @override
  @JsonKey(name: 'localtime_epoch')
  int get localTimeEpoch;
  @override
  @JsonKey(name: 'localtime')
  String get localTime;
  @override
  @JsonKey(ignore: true)
  _$$_WeatherLocationRemoteDTOCopyWith<_$_WeatherLocationRemoteDTO>
      get copyWith => throw _privateConstructorUsedError;
}

WeatherCurrentRemoteDTO _$WeatherCurrentRemoteDTOFromJson(
    Map<String, dynamic> json) {
  return _WeatherCurrentRemoteDTO.fromJson(json);
}

/// @nodoc
mixin _$WeatherCurrentRemoteDTO {
  @JsonKey(name: 'last_updated_epoch')
  int get lastUpdatedEpoch => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_updated')
  String get lastUpdated => throw _privateConstructorUsedError;
  @JsonKey(name: 'temp_c')
  double get tempC => throw _privateConstructorUsedError;
  @JsonKey(name: 'temp_f')
  double get tempF => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_day')
  int get isDay => throw _privateConstructorUsedError;
  WeatherCurrentConditionRemoteDTO get condition =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'wind_mph')
  double get windMph => throw _privateConstructorUsedError;
  @JsonKey(name: 'wind_kph')
  double get windKph => throw _privateConstructorUsedError;
  @JsonKey(name: 'wind_degree')
  int get windDegree => throw _privateConstructorUsedError;
  @JsonKey(name: 'wind_dir')
  String get windDir => throw _privateConstructorUsedError;
  @JsonKey(name: 'pressure_mb')
  double get pressureMb => throw _privateConstructorUsedError;
  @JsonKey(name: 'pressure_in')
  double get pressureIn => throw _privateConstructorUsedError;
  @JsonKey(name: 'precip_mm')
  double get precipMm => throw _privateConstructorUsedError;
  @JsonKey(name: 'precip_in')
  double get precipIn => throw _privateConstructorUsedError;
  int get humidity => throw _privateConstructorUsedError;
  int get cloud => throw _privateConstructorUsedError;
  @JsonKey(name: 'feelslike_c')
  double get feelsLikeC => throw _privateConstructorUsedError;
  @JsonKey(name: 'feelslike_f')
  double get feelsLikeF => throw _privateConstructorUsedError;
  @JsonKey(name: 'vis_km')
  double get visKm => throw _privateConstructorUsedError;
  @JsonKey(name: 'vis_miles')
  double get visMiles => throw _privateConstructorUsedError;
  double get uv => throw _privateConstructorUsedError;
  @JsonKey(name: 'gust_mph')
  double get gustMph => throw _privateConstructorUsedError;
  @JsonKey(name: 'gust_kph')
  double get gustKph => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WeatherCurrentRemoteDTOCopyWith<WeatherCurrentRemoteDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherCurrentRemoteDTOCopyWith<$Res> {
  factory $WeatherCurrentRemoteDTOCopyWith(WeatherCurrentRemoteDTO value,
          $Res Function(WeatherCurrentRemoteDTO) then) =
      _$WeatherCurrentRemoteDTOCopyWithImpl<$Res, WeatherCurrentRemoteDTO>;
  @useResult
  $Res call(
      {@JsonKey(name: 'last_updated_epoch') int lastUpdatedEpoch,
      @JsonKey(name: 'last_updated') String lastUpdated,
      @JsonKey(name: 'temp_c') double tempC,
      @JsonKey(name: 'temp_f') double tempF,
      @JsonKey(name: 'is_day') int isDay,
      WeatherCurrentConditionRemoteDTO condition,
      @JsonKey(name: 'wind_mph') double windMph,
      @JsonKey(name: 'wind_kph') double windKph,
      @JsonKey(name: 'wind_degree') int windDegree,
      @JsonKey(name: 'wind_dir') String windDir,
      @JsonKey(name: 'pressure_mb') double pressureMb,
      @JsonKey(name: 'pressure_in') double pressureIn,
      @JsonKey(name: 'precip_mm') double precipMm,
      @JsonKey(name: 'precip_in') double precipIn,
      int humidity,
      int cloud,
      @JsonKey(name: 'feelslike_c') double feelsLikeC,
      @JsonKey(name: 'feelslike_f') double feelsLikeF,
      @JsonKey(name: 'vis_km') double visKm,
      @JsonKey(name: 'vis_miles') double visMiles,
      double uv,
      @JsonKey(name: 'gust_mph') double gustMph,
      @JsonKey(name: 'gust_kph') double gustKph});

  $WeatherCurrentConditionRemoteDTOCopyWith<$Res> get condition;
}

/// @nodoc
class _$WeatherCurrentRemoteDTOCopyWithImpl<$Res,
        $Val extends WeatherCurrentRemoteDTO>
    implements $WeatherCurrentRemoteDTOCopyWith<$Res> {
  _$WeatherCurrentRemoteDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lastUpdatedEpoch = null,
    Object? lastUpdated = null,
    Object? tempC = null,
    Object? tempF = null,
    Object? isDay = null,
    Object? condition = null,
    Object? windMph = null,
    Object? windKph = null,
    Object? windDegree = null,
    Object? windDir = null,
    Object? pressureMb = null,
    Object? pressureIn = null,
    Object? precipMm = null,
    Object? precipIn = null,
    Object? humidity = null,
    Object? cloud = null,
    Object? feelsLikeC = null,
    Object? feelsLikeF = null,
    Object? visKm = null,
    Object? visMiles = null,
    Object? uv = null,
    Object? gustMph = null,
    Object? gustKph = null,
  }) {
    return _then(_value.copyWith(
      lastUpdatedEpoch: null == lastUpdatedEpoch
          ? _value.lastUpdatedEpoch
          : lastUpdatedEpoch // ignore: cast_nullable_to_non_nullable
              as int,
      lastUpdated: null == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as String,
      tempC: null == tempC
          ? _value.tempC
          : tempC // ignore: cast_nullable_to_non_nullable
              as double,
      tempF: null == tempF
          ? _value.tempF
          : tempF // ignore: cast_nullable_to_non_nullable
              as double,
      isDay: null == isDay
          ? _value.isDay
          : isDay // ignore: cast_nullable_to_non_nullable
              as int,
      condition: null == condition
          ? _value.condition
          : condition // ignore: cast_nullable_to_non_nullable
              as WeatherCurrentConditionRemoteDTO,
      windMph: null == windMph
          ? _value.windMph
          : windMph // ignore: cast_nullable_to_non_nullable
              as double,
      windKph: null == windKph
          ? _value.windKph
          : windKph // ignore: cast_nullable_to_non_nullable
              as double,
      windDegree: null == windDegree
          ? _value.windDegree
          : windDegree // ignore: cast_nullable_to_non_nullable
              as int,
      windDir: null == windDir
          ? _value.windDir
          : windDir // ignore: cast_nullable_to_non_nullable
              as String,
      pressureMb: null == pressureMb
          ? _value.pressureMb
          : pressureMb // ignore: cast_nullable_to_non_nullable
              as double,
      pressureIn: null == pressureIn
          ? _value.pressureIn
          : pressureIn // ignore: cast_nullable_to_non_nullable
              as double,
      precipMm: null == precipMm
          ? _value.precipMm
          : precipMm // ignore: cast_nullable_to_non_nullable
              as double,
      precipIn: null == precipIn
          ? _value.precipIn
          : precipIn // ignore: cast_nullable_to_non_nullable
              as double,
      humidity: null == humidity
          ? _value.humidity
          : humidity // ignore: cast_nullable_to_non_nullable
              as int,
      cloud: null == cloud
          ? _value.cloud
          : cloud // ignore: cast_nullable_to_non_nullable
              as int,
      feelsLikeC: null == feelsLikeC
          ? _value.feelsLikeC
          : feelsLikeC // ignore: cast_nullable_to_non_nullable
              as double,
      feelsLikeF: null == feelsLikeF
          ? _value.feelsLikeF
          : feelsLikeF // ignore: cast_nullable_to_non_nullable
              as double,
      visKm: null == visKm
          ? _value.visKm
          : visKm // ignore: cast_nullable_to_non_nullable
              as double,
      visMiles: null == visMiles
          ? _value.visMiles
          : visMiles // ignore: cast_nullable_to_non_nullable
              as double,
      uv: null == uv
          ? _value.uv
          : uv // ignore: cast_nullable_to_non_nullable
              as double,
      gustMph: null == gustMph
          ? _value.gustMph
          : gustMph // ignore: cast_nullable_to_non_nullable
              as double,
      gustKph: null == gustKph
          ? _value.gustKph
          : gustKph // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $WeatherCurrentConditionRemoteDTOCopyWith<$Res> get condition {
    return $WeatherCurrentConditionRemoteDTOCopyWith<$Res>(_value.condition,
        (value) {
      return _then(_value.copyWith(condition: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_WeatherCurrentRemoteDTOCopyWith<$Res>
    implements $WeatherCurrentRemoteDTOCopyWith<$Res> {
  factory _$$_WeatherCurrentRemoteDTOCopyWith(_$_WeatherCurrentRemoteDTO value,
          $Res Function(_$_WeatherCurrentRemoteDTO) then) =
      __$$_WeatherCurrentRemoteDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'last_updated_epoch') int lastUpdatedEpoch,
      @JsonKey(name: 'last_updated') String lastUpdated,
      @JsonKey(name: 'temp_c') double tempC,
      @JsonKey(name: 'temp_f') double tempF,
      @JsonKey(name: 'is_day') int isDay,
      WeatherCurrentConditionRemoteDTO condition,
      @JsonKey(name: 'wind_mph') double windMph,
      @JsonKey(name: 'wind_kph') double windKph,
      @JsonKey(name: 'wind_degree') int windDegree,
      @JsonKey(name: 'wind_dir') String windDir,
      @JsonKey(name: 'pressure_mb') double pressureMb,
      @JsonKey(name: 'pressure_in') double pressureIn,
      @JsonKey(name: 'precip_mm') double precipMm,
      @JsonKey(name: 'precip_in') double precipIn,
      int humidity,
      int cloud,
      @JsonKey(name: 'feelslike_c') double feelsLikeC,
      @JsonKey(name: 'feelslike_f') double feelsLikeF,
      @JsonKey(name: 'vis_km') double visKm,
      @JsonKey(name: 'vis_miles') double visMiles,
      double uv,
      @JsonKey(name: 'gust_mph') double gustMph,
      @JsonKey(name: 'gust_kph') double gustKph});

  @override
  $WeatherCurrentConditionRemoteDTOCopyWith<$Res> get condition;
}

/// @nodoc
class __$$_WeatherCurrentRemoteDTOCopyWithImpl<$Res>
    extends _$WeatherCurrentRemoteDTOCopyWithImpl<$Res,
        _$_WeatherCurrentRemoteDTO>
    implements _$$_WeatherCurrentRemoteDTOCopyWith<$Res> {
  __$$_WeatherCurrentRemoteDTOCopyWithImpl(_$_WeatherCurrentRemoteDTO _value,
      $Res Function(_$_WeatherCurrentRemoteDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lastUpdatedEpoch = null,
    Object? lastUpdated = null,
    Object? tempC = null,
    Object? tempF = null,
    Object? isDay = null,
    Object? condition = null,
    Object? windMph = null,
    Object? windKph = null,
    Object? windDegree = null,
    Object? windDir = null,
    Object? pressureMb = null,
    Object? pressureIn = null,
    Object? precipMm = null,
    Object? precipIn = null,
    Object? humidity = null,
    Object? cloud = null,
    Object? feelsLikeC = null,
    Object? feelsLikeF = null,
    Object? visKm = null,
    Object? visMiles = null,
    Object? uv = null,
    Object? gustMph = null,
    Object? gustKph = null,
  }) {
    return _then(_$_WeatherCurrentRemoteDTO(
      lastUpdatedEpoch: null == lastUpdatedEpoch
          ? _value.lastUpdatedEpoch
          : lastUpdatedEpoch // ignore: cast_nullable_to_non_nullable
              as int,
      lastUpdated: null == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as String,
      tempC: null == tempC
          ? _value.tempC
          : tempC // ignore: cast_nullable_to_non_nullable
              as double,
      tempF: null == tempF
          ? _value.tempF
          : tempF // ignore: cast_nullable_to_non_nullable
              as double,
      isDay: null == isDay
          ? _value.isDay
          : isDay // ignore: cast_nullable_to_non_nullable
              as int,
      condition: null == condition
          ? _value.condition
          : condition // ignore: cast_nullable_to_non_nullable
              as WeatherCurrentConditionRemoteDTO,
      windMph: null == windMph
          ? _value.windMph
          : windMph // ignore: cast_nullable_to_non_nullable
              as double,
      windKph: null == windKph
          ? _value.windKph
          : windKph // ignore: cast_nullable_to_non_nullable
              as double,
      windDegree: null == windDegree
          ? _value.windDegree
          : windDegree // ignore: cast_nullable_to_non_nullable
              as int,
      windDir: null == windDir
          ? _value.windDir
          : windDir // ignore: cast_nullable_to_non_nullable
              as String,
      pressureMb: null == pressureMb
          ? _value.pressureMb
          : pressureMb // ignore: cast_nullable_to_non_nullable
              as double,
      pressureIn: null == pressureIn
          ? _value.pressureIn
          : pressureIn // ignore: cast_nullable_to_non_nullable
              as double,
      precipMm: null == precipMm
          ? _value.precipMm
          : precipMm // ignore: cast_nullable_to_non_nullable
              as double,
      precipIn: null == precipIn
          ? _value.precipIn
          : precipIn // ignore: cast_nullable_to_non_nullable
              as double,
      humidity: null == humidity
          ? _value.humidity
          : humidity // ignore: cast_nullable_to_non_nullable
              as int,
      cloud: null == cloud
          ? _value.cloud
          : cloud // ignore: cast_nullable_to_non_nullable
              as int,
      feelsLikeC: null == feelsLikeC
          ? _value.feelsLikeC
          : feelsLikeC // ignore: cast_nullable_to_non_nullable
              as double,
      feelsLikeF: null == feelsLikeF
          ? _value.feelsLikeF
          : feelsLikeF // ignore: cast_nullable_to_non_nullable
              as double,
      visKm: null == visKm
          ? _value.visKm
          : visKm // ignore: cast_nullable_to_non_nullable
              as double,
      visMiles: null == visMiles
          ? _value.visMiles
          : visMiles // ignore: cast_nullable_to_non_nullable
              as double,
      uv: null == uv
          ? _value.uv
          : uv // ignore: cast_nullable_to_non_nullable
              as double,
      gustMph: null == gustMph
          ? _value.gustMph
          : gustMph // ignore: cast_nullable_to_non_nullable
              as double,
      gustKph: null == gustKph
          ? _value.gustKph
          : gustKph // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_WeatherCurrentRemoteDTO implements _WeatherCurrentRemoteDTO {
  const _$_WeatherCurrentRemoteDTO(
      {@JsonKey(name: 'last_updated_epoch') required this.lastUpdatedEpoch,
      @JsonKey(name: 'last_updated') required this.lastUpdated,
      @JsonKey(name: 'temp_c') required this.tempC,
      @JsonKey(name: 'temp_f') required this.tempF,
      @JsonKey(name: 'is_day') required this.isDay,
      required this.condition,
      @JsonKey(name: 'wind_mph') required this.windMph,
      @JsonKey(name: 'wind_kph') required this.windKph,
      @JsonKey(name: 'wind_degree') required this.windDegree,
      @JsonKey(name: 'wind_dir') required this.windDir,
      @JsonKey(name: 'pressure_mb') required this.pressureMb,
      @JsonKey(name: 'pressure_in') required this.pressureIn,
      @JsonKey(name: 'precip_mm') required this.precipMm,
      @JsonKey(name: 'precip_in') required this.precipIn,
      required this.humidity,
      required this.cloud,
      @JsonKey(name: 'feelslike_c') required this.feelsLikeC,
      @JsonKey(name: 'feelslike_f') required this.feelsLikeF,
      @JsonKey(name: 'vis_km') required this.visKm,
      @JsonKey(name: 'vis_miles') required this.visMiles,
      required this.uv,
      @JsonKey(name: 'gust_mph') required this.gustMph,
      @JsonKey(name: 'gust_kph') required this.gustKph});

  factory _$_WeatherCurrentRemoteDTO.fromJson(Map<String, dynamic> json) =>
      _$$_WeatherCurrentRemoteDTOFromJson(json);

  @override
  @JsonKey(name: 'last_updated_epoch')
  final int lastUpdatedEpoch;
  @override
  @JsonKey(name: 'last_updated')
  final String lastUpdated;
  @override
  @JsonKey(name: 'temp_c')
  final double tempC;
  @override
  @JsonKey(name: 'temp_f')
  final double tempF;
  @override
  @JsonKey(name: 'is_day')
  final int isDay;
  @override
  final WeatherCurrentConditionRemoteDTO condition;
  @override
  @JsonKey(name: 'wind_mph')
  final double windMph;
  @override
  @JsonKey(name: 'wind_kph')
  final double windKph;
  @override
  @JsonKey(name: 'wind_degree')
  final int windDegree;
  @override
  @JsonKey(name: 'wind_dir')
  final String windDir;
  @override
  @JsonKey(name: 'pressure_mb')
  final double pressureMb;
  @override
  @JsonKey(name: 'pressure_in')
  final double pressureIn;
  @override
  @JsonKey(name: 'precip_mm')
  final double precipMm;
  @override
  @JsonKey(name: 'precip_in')
  final double precipIn;
  @override
  final int humidity;
  @override
  final int cloud;
  @override
  @JsonKey(name: 'feelslike_c')
  final double feelsLikeC;
  @override
  @JsonKey(name: 'feelslike_f')
  final double feelsLikeF;
  @override
  @JsonKey(name: 'vis_km')
  final double visKm;
  @override
  @JsonKey(name: 'vis_miles')
  final double visMiles;
  @override
  final double uv;
  @override
  @JsonKey(name: 'gust_mph')
  final double gustMph;
  @override
  @JsonKey(name: 'gust_kph')
  final double gustKph;

  @override
  String toString() {
    return 'WeatherCurrentRemoteDTO(lastUpdatedEpoch: $lastUpdatedEpoch, lastUpdated: $lastUpdated, tempC: $tempC, tempF: $tempF, isDay: $isDay, condition: $condition, windMph: $windMph, windKph: $windKph, windDegree: $windDegree, windDir: $windDir, pressureMb: $pressureMb, pressureIn: $pressureIn, precipMm: $precipMm, precipIn: $precipIn, humidity: $humidity, cloud: $cloud, feelsLikeC: $feelsLikeC, feelsLikeF: $feelsLikeF, visKm: $visKm, visMiles: $visMiles, uv: $uv, gustMph: $gustMph, gustKph: $gustKph)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WeatherCurrentRemoteDTO &&
            (identical(other.lastUpdatedEpoch, lastUpdatedEpoch) ||
                other.lastUpdatedEpoch == lastUpdatedEpoch) &&
            (identical(other.lastUpdated, lastUpdated) ||
                other.lastUpdated == lastUpdated) &&
            (identical(other.tempC, tempC) || other.tempC == tempC) &&
            (identical(other.tempF, tempF) || other.tempF == tempF) &&
            (identical(other.isDay, isDay) || other.isDay == isDay) &&
            (identical(other.condition, condition) ||
                other.condition == condition) &&
            (identical(other.windMph, windMph) || other.windMph == windMph) &&
            (identical(other.windKph, windKph) || other.windKph == windKph) &&
            (identical(other.windDegree, windDegree) ||
                other.windDegree == windDegree) &&
            (identical(other.windDir, windDir) || other.windDir == windDir) &&
            (identical(other.pressureMb, pressureMb) ||
                other.pressureMb == pressureMb) &&
            (identical(other.pressureIn, pressureIn) ||
                other.pressureIn == pressureIn) &&
            (identical(other.precipMm, precipMm) ||
                other.precipMm == precipMm) &&
            (identical(other.precipIn, precipIn) ||
                other.precipIn == precipIn) &&
            (identical(other.humidity, humidity) ||
                other.humidity == humidity) &&
            (identical(other.cloud, cloud) || other.cloud == cloud) &&
            (identical(other.feelsLikeC, feelsLikeC) ||
                other.feelsLikeC == feelsLikeC) &&
            (identical(other.feelsLikeF, feelsLikeF) ||
                other.feelsLikeF == feelsLikeF) &&
            (identical(other.visKm, visKm) || other.visKm == visKm) &&
            (identical(other.visMiles, visMiles) ||
                other.visMiles == visMiles) &&
            (identical(other.uv, uv) || other.uv == uv) &&
            (identical(other.gustMph, gustMph) || other.gustMph == gustMph) &&
            (identical(other.gustKph, gustKph) || other.gustKph == gustKph));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        lastUpdatedEpoch,
        lastUpdated,
        tempC,
        tempF,
        isDay,
        condition,
        windMph,
        windKph,
        windDegree,
        windDir,
        pressureMb,
        pressureIn,
        precipMm,
        precipIn,
        humidity,
        cloud,
        feelsLikeC,
        feelsLikeF,
        visKm,
        visMiles,
        uv,
        gustMph,
        gustKph
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WeatherCurrentRemoteDTOCopyWith<_$_WeatherCurrentRemoteDTO>
      get copyWith =>
          __$$_WeatherCurrentRemoteDTOCopyWithImpl<_$_WeatherCurrentRemoteDTO>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WeatherCurrentRemoteDTOToJson(
      this,
    );
  }
}

abstract class _WeatherCurrentRemoteDTO implements WeatherCurrentRemoteDTO {
  const factory _WeatherCurrentRemoteDTO(
      {@JsonKey(name: 'last_updated_epoch')
          required final int lastUpdatedEpoch,
      @JsonKey(name: 'last_updated')
          required final String lastUpdated,
      @JsonKey(name: 'temp_c')
          required final double tempC,
      @JsonKey(name: 'temp_f')
          required final double tempF,
      @JsonKey(name: 'is_day')
          required final int isDay,
      required final WeatherCurrentConditionRemoteDTO condition,
      @JsonKey(name: 'wind_mph')
          required final double windMph,
      @JsonKey(name: 'wind_kph')
          required final double windKph,
      @JsonKey(name: 'wind_degree')
          required final int windDegree,
      @JsonKey(name: 'wind_dir')
          required final String windDir,
      @JsonKey(name: 'pressure_mb')
          required final double pressureMb,
      @JsonKey(name: 'pressure_in')
          required final double pressureIn,
      @JsonKey(name: 'precip_mm')
          required final double precipMm,
      @JsonKey(name: 'precip_in')
          required final double precipIn,
      required final int humidity,
      required final int cloud,
      @JsonKey(name: 'feelslike_c')
          required final double feelsLikeC,
      @JsonKey(name: 'feelslike_f')
          required final double feelsLikeF,
      @JsonKey(name: 'vis_km')
          required final double visKm,
      @JsonKey(name: 'vis_miles')
          required final double visMiles,
      required final double uv,
      @JsonKey(name: 'gust_mph')
          required final double gustMph,
      @JsonKey(name: 'gust_kph')
          required final double gustKph}) = _$_WeatherCurrentRemoteDTO;

  factory _WeatherCurrentRemoteDTO.fromJson(Map<String, dynamic> json) =
      _$_WeatherCurrentRemoteDTO.fromJson;

  @override
  @JsonKey(name: 'last_updated_epoch')
  int get lastUpdatedEpoch;
  @override
  @JsonKey(name: 'last_updated')
  String get lastUpdated;
  @override
  @JsonKey(name: 'temp_c')
  double get tempC;
  @override
  @JsonKey(name: 'temp_f')
  double get tempF;
  @override
  @JsonKey(name: 'is_day')
  int get isDay;
  @override
  WeatherCurrentConditionRemoteDTO get condition;
  @override
  @JsonKey(name: 'wind_mph')
  double get windMph;
  @override
  @JsonKey(name: 'wind_kph')
  double get windKph;
  @override
  @JsonKey(name: 'wind_degree')
  int get windDegree;
  @override
  @JsonKey(name: 'wind_dir')
  String get windDir;
  @override
  @JsonKey(name: 'pressure_mb')
  double get pressureMb;
  @override
  @JsonKey(name: 'pressure_in')
  double get pressureIn;
  @override
  @JsonKey(name: 'precip_mm')
  double get precipMm;
  @override
  @JsonKey(name: 'precip_in')
  double get precipIn;
  @override
  int get humidity;
  @override
  int get cloud;
  @override
  @JsonKey(name: 'feelslike_c')
  double get feelsLikeC;
  @override
  @JsonKey(name: 'feelslike_f')
  double get feelsLikeF;
  @override
  @JsonKey(name: 'vis_km')
  double get visKm;
  @override
  @JsonKey(name: 'vis_miles')
  double get visMiles;
  @override
  double get uv;
  @override
  @JsonKey(name: 'gust_mph')
  double get gustMph;
  @override
  @JsonKey(name: 'gust_kph')
  double get gustKph;
  @override
  @JsonKey(ignore: true)
  _$$_WeatherCurrentRemoteDTOCopyWith<_$_WeatherCurrentRemoteDTO>
      get copyWith => throw _privateConstructorUsedError;
}

WeatherCurrentConditionRemoteDTO _$WeatherCurrentConditionRemoteDTOFromJson(
    Map<String, dynamic> json) {
  return _WeatherCurrentConditionRemoteDTO.fromJson(json);
}

/// @nodoc
mixin _$WeatherCurrentConditionRemoteDTO {
  String get text => throw _privateConstructorUsedError;
  String get icon => throw _privateConstructorUsedError;
  int get code => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WeatherCurrentConditionRemoteDTOCopyWith<WeatherCurrentConditionRemoteDTO>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherCurrentConditionRemoteDTOCopyWith<$Res> {
  factory $WeatherCurrentConditionRemoteDTOCopyWith(
          WeatherCurrentConditionRemoteDTO value,
          $Res Function(WeatherCurrentConditionRemoteDTO) then) =
      _$WeatherCurrentConditionRemoteDTOCopyWithImpl<$Res,
          WeatherCurrentConditionRemoteDTO>;
  @useResult
  $Res call({String text, String icon, int code});
}

/// @nodoc
class _$WeatherCurrentConditionRemoteDTOCopyWithImpl<$Res,
        $Val extends WeatherCurrentConditionRemoteDTO>
    implements $WeatherCurrentConditionRemoteDTOCopyWith<$Res> {
  _$WeatherCurrentConditionRemoteDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? icon = null,
    Object? code = null,
  }) {
    return _then(_value.copyWith(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_WeatherCurrentConditionRemoteDTOCopyWith<$Res>
    implements $WeatherCurrentConditionRemoteDTOCopyWith<$Res> {
  factory _$$_WeatherCurrentConditionRemoteDTOCopyWith(
          _$_WeatherCurrentConditionRemoteDTO value,
          $Res Function(_$_WeatherCurrentConditionRemoteDTO) then) =
      __$$_WeatherCurrentConditionRemoteDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String text, String icon, int code});
}

/// @nodoc
class __$$_WeatherCurrentConditionRemoteDTOCopyWithImpl<$Res>
    extends _$WeatherCurrentConditionRemoteDTOCopyWithImpl<$Res,
        _$_WeatherCurrentConditionRemoteDTO>
    implements _$$_WeatherCurrentConditionRemoteDTOCopyWith<$Res> {
  __$$_WeatherCurrentConditionRemoteDTOCopyWithImpl(
      _$_WeatherCurrentConditionRemoteDTO _value,
      $Res Function(_$_WeatherCurrentConditionRemoteDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? icon = null,
    Object? code = null,
  }) {
    return _then(_$_WeatherCurrentConditionRemoteDTO(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_WeatherCurrentConditionRemoteDTO
    implements _WeatherCurrentConditionRemoteDTO {
  const _$_WeatherCurrentConditionRemoteDTO(
      {required this.text, required this.icon, required this.code});

  factory _$_WeatherCurrentConditionRemoteDTO.fromJson(
          Map<String, dynamic> json) =>
      _$$_WeatherCurrentConditionRemoteDTOFromJson(json);

  @override
  final String text;
  @override
  final String icon;
  @override
  final int code;

  @override
  String toString() {
    return 'WeatherCurrentConditionRemoteDTO(text: $text, icon: $icon, code: $code)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WeatherCurrentConditionRemoteDTO &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.code, code) || other.code == code));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, text, icon, code);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WeatherCurrentConditionRemoteDTOCopyWith<
          _$_WeatherCurrentConditionRemoteDTO>
      get copyWith => __$$_WeatherCurrentConditionRemoteDTOCopyWithImpl<
          _$_WeatherCurrentConditionRemoteDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WeatherCurrentConditionRemoteDTOToJson(
      this,
    );
  }
}

abstract class _WeatherCurrentConditionRemoteDTO
    implements WeatherCurrentConditionRemoteDTO {
  const factory _WeatherCurrentConditionRemoteDTO(
      {required final String text,
      required final String icon,
      required final int code}) = _$_WeatherCurrentConditionRemoteDTO;

  factory _WeatherCurrentConditionRemoteDTO.fromJson(
      Map<String, dynamic> json) = _$_WeatherCurrentConditionRemoteDTO.fromJson;

  @override
  String get text;
  @override
  String get icon;
  @override
  int get code;
  @override
  @JsonKey(ignore: true)
  _$$_WeatherCurrentConditionRemoteDTOCopyWith<
          _$_WeatherCurrentConditionRemoteDTO>
      get copyWith => throw _privateConstructorUsedError;
}

WeatherForecastDayListRemoteDTO _$WeatherForecastDayListRemoteDTOFromJson(
    Map<String, dynamic> json) {
  return _WeatherForecastDayListRemoteDTO.fromJson(json);
}

/// @nodoc
mixin _$WeatherForecastDayListRemoteDTO {
  List<WeatherForecastDayRemoteDTO> get forecastday =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WeatherForecastDayListRemoteDTOCopyWith<WeatherForecastDayListRemoteDTO>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherForecastDayListRemoteDTOCopyWith<$Res> {
  factory $WeatherForecastDayListRemoteDTOCopyWith(
          WeatherForecastDayListRemoteDTO value,
          $Res Function(WeatherForecastDayListRemoteDTO) then) =
      _$WeatherForecastDayListRemoteDTOCopyWithImpl<$Res,
          WeatherForecastDayListRemoteDTO>;
  @useResult
  $Res call({List<WeatherForecastDayRemoteDTO> forecastday});
}

/// @nodoc
class _$WeatherForecastDayListRemoteDTOCopyWithImpl<$Res,
        $Val extends WeatherForecastDayListRemoteDTO>
    implements $WeatherForecastDayListRemoteDTOCopyWith<$Res> {
  _$WeatherForecastDayListRemoteDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? forecastday = null,
  }) {
    return _then(_value.copyWith(
      forecastday: null == forecastday
          ? _value.forecastday
          : forecastday // ignore: cast_nullable_to_non_nullable
              as List<WeatherForecastDayRemoteDTO>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_WeatherForecastDayListRemoteDTOCopyWith<$Res>
    implements $WeatherForecastDayListRemoteDTOCopyWith<$Res> {
  factory _$$_WeatherForecastDayListRemoteDTOCopyWith(
          _$_WeatherForecastDayListRemoteDTO value,
          $Res Function(_$_WeatherForecastDayListRemoteDTO) then) =
      __$$_WeatherForecastDayListRemoteDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<WeatherForecastDayRemoteDTO> forecastday});
}

/// @nodoc
class __$$_WeatherForecastDayListRemoteDTOCopyWithImpl<$Res>
    extends _$WeatherForecastDayListRemoteDTOCopyWithImpl<$Res,
        _$_WeatherForecastDayListRemoteDTO>
    implements _$$_WeatherForecastDayListRemoteDTOCopyWith<$Res> {
  __$$_WeatherForecastDayListRemoteDTOCopyWithImpl(
      _$_WeatherForecastDayListRemoteDTO _value,
      $Res Function(_$_WeatherForecastDayListRemoteDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? forecastday = null,
  }) {
    return _then(_$_WeatherForecastDayListRemoteDTO(
      forecastday: null == forecastday
          ? _value._forecastday
          : forecastday // ignore: cast_nullable_to_non_nullable
              as List<WeatherForecastDayRemoteDTO>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_WeatherForecastDayListRemoteDTO
    implements _WeatherForecastDayListRemoteDTO {
  const _$_WeatherForecastDayListRemoteDTO(
      {required final List<WeatherForecastDayRemoteDTO> forecastday})
      : _forecastday = forecastday;

  factory _$_WeatherForecastDayListRemoteDTO.fromJson(
          Map<String, dynamic> json) =>
      _$$_WeatherForecastDayListRemoteDTOFromJson(json);

  final List<WeatherForecastDayRemoteDTO> _forecastday;
  @override
  List<WeatherForecastDayRemoteDTO> get forecastday {
    if (_forecastday is EqualUnmodifiableListView) return _forecastday;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_forecastday);
  }

  @override
  String toString() {
    return 'WeatherForecastDayListRemoteDTO(forecastday: $forecastday)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WeatherForecastDayListRemoteDTO &&
            const DeepCollectionEquality()
                .equals(other._forecastday, _forecastday));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_forecastday));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WeatherForecastDayListRemoteDTOCopyWith<
          _$_WeatherForecastDayListRemoteDTO>
      get copyWith => __$$_WeatherForecastDayListRemoteDTOCopyWithImpl<
          _$_WeatherForecastDayListRemoteDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WeatherForecastDayListRemoteDTOToJson(
      this,
    );
  }
}

abstract class _WeatherForecastDayListRemoteDTO
    implements WeatherForecastDayListRemoteDTO {
  const factory _WeatherForecastDayListRemoteDTO(
          {required final List<WeatherForecastDayRemoteDTO> forecastday}) =
      _$_WeatherForecastDayListRemoteDTO;

  factory _WeatherForecastDayListRemoteDTO.fromJson(Map<String, dynamic> json) =
      _$_WeatherForecastDayListRemoteDTO.fromJson;

  @override
  List<WeatherForecastDayRemoteDTO> get forecastday;
  @override
  @JsonKey(ignore: true)
  _$$_WeatherForecastDayListRemoteDTOCopyWith<
          _$_WeatherForecastDayListRemoteDTO>
      get copyWith => throw _privateConstructorUsedError;
}

WeatherForecastDayRemoteDTO _$WeatherForecastDayRemoteDTOFromJson(
    Map<String, dynamic> json) {
  return _WeatherForecastDayRemoteDTO.fromJson(json);
}

/// @nodoc
mixin _$WeatherForecastDayRemoteDTO {
  String get date => throw _privateConstructorUsedError;
  @JsonKey(name: 'date_epoch')
  int get dateEpoch => throw _privateConstructorUsedError;
  WeatherDayRemoteDTO get day => throw _privateConstructorUsedError;
  WeatherAstroRemoteDTO get astro => throw _privateConstructorUsedError;
  List<WeatherHourRemoteDTO> get hour => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WeatherForecastDayRemoteDTOCopyWith<WeatherForecastDayRemoteDTO>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherForecastDayRemoteDTOCopyWith<$Res> {
  factory $WeatherForecastDayRemoteDTOCopyWith(
          WeatherForecastDayRemoteDTO value,
          $Res Function(WeatherForecastDayRemoteDTO) then) =
      _$WeatherForecastDayRemoteDTOCopyWithImpl<$Res,
          WeatherForecastDayRemoteDTO>;
  @useResult
  $Res call(
      {String date,
      @JsonKey(name: 'date_epoch') int dateEpoch,
      WeatherDayRemoteDTO day,
      WeatherAstroRemoteDTO astro,
      List<WeatherHourRemoteDTO> hour});

  $WeatherDayRemoteDTOCopyWith<$Res> get day;
  $WeatherAstroRemoteDTOCopyWith<$Res> get astro;
}

/// @nodoc
class _$WeatherForecastDayRemoteDTOCopyWithImpl<$Res,
        $Val extends WeatherForecastDayRemoteDTO>
    implements $WeatherForecastDayRemoteDTOCopyWith<$Res> {
  _$WeatherForecastDayRemoteDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? dateEpoch = null,
    Object? day = null,
    Object? astro = null,
    Object? hour = null,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      dateEpoch: null == dateEpoch
          ? _value.dateEpoch
          : dateEpoch // ignore: cast_nullable_to_non_nullable
              as int,
      day: null == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as WeatherDayRemoteDTO,
      astro: null == astro
          ? _value.astro
          : astro // ignore: cast_nullable_to_non_nullable
              as WeatherAstroRemoteDTO,
      hour: null == hour
          ? _value.hour
          : hour // ignore: cast_nullable_to_non_nullable
              as List<WeatherHourRemoteDTO>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $WeatherDayRemoteDTOCopyWith<$Res> get day {
    return $WeatherDayRemoteDTOCopyWith<$Res>(_value.day, (value) {
      return _then(_value.copyWith(day: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $WeatherAstroRemoteDTOCopyWith<$Res> get astro {
    return $WeatherAstroRemoteDTOCopyWith<$Res>(_value.astro, (value) {
      return _then(_value.copyWith(astro: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_WeatherForecastDayRemoteDTOCopyWith<$Res>
    implements $WeatherForecastDayRemoteDTOCopyWith<$Res> {
  factory _$$_WeatherForecastDayRemoteDTOCopyWith(
          _$_WeatherForecastDayRemoteDTO value,
          $Res Function(_$_WeatherForecastDayRemoteDTO) then) =
      __$$_WeatherForecastDayRemoteDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String date,
      @JsonKey(name: 'date_epoch') int dateEpoch,
      WeatherDayRemoteDTO day,
      WeatherAstroRemoteDTO astro,
      List<WeatherHourRemoteDTO> hour});

  @override
  $WeatherDayRemoteDTOCopyWith<$Res> get day;
  @override
  $WeatherAstroRemoteDTOCopyWith<$Res> get astro;
}

/// @nodoc
class __$$_WeatherForecastDayRemoteDTOCopyWithImpl<$Res>
    extends _$WeatherForecastDayRemoteDTOCopyWithImpl<$Res,
        _$_WeatherForecastDayRemoteDTO>
    implements _$$_WeatherForecastDayRemoteDTOCopyWith<$Res> {
  __$$_WeatherForecastDayRemoteDTOCopyWithImpl(
      _$_WeatherForecastDayRemoteDTO _value,
      $Res Function(_$_WeatherForecastDayRemoteDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? dateEpoch = null,
    Object? day = null,
    Object? astro = null,
    Object? hour = null,
  }) {
    return _then(_$_WeatherForecastDayRemoteDTO(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      dateEpoch: null == dateEpoch
          ? _value.dateEpoch
          : dateEpoch // ignore: cast_nullable_to_non_nullable
              as int,
      day: null == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as WeatherDayRemoteDTO,
      astro: null == astro
          ? _value.astro
          : astro // ignore: cast_nullable_to_non_nullable
              as WeatherAstroRemoteDTO,
      hour: null == hour
          ? _value._hour
          : hour // ignore: cast_nullable_to_non_nullable
              as List<WeatherHourRemoteDTO>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_WeatherForecastDayRemoteDTO implements _WeatherForecastDayRemoteDTO {
  const _$_WeatherForecastDayRemoteDTO(
      {required this.date,
      @JsonKey(name: 'date_epoch') required this.dateEpoch,
      required this.day,
      required this.astro,
      required final List<WeatherHourRemoteDTO> hour})
      : _hour = hour;

  factory _$_WeatherForecastDayRemoteDTO.fromJson(Map<String, dynamic> json) =>
      _$$_WeatherForecastDayRemoteDTOFromJson(json);

  @override
  final String date;
  @override
  @JsonKey(name: 'date_epoch')
  final int dateEpoch;
  @override
  final WeatherDayRemoteDTO day;
  @override
  final WeatherAstroRemoteDTO astro;
  final List<WeatherHourRemoteDTO> _hour;
  @override
  List<WeatherHourRemoteDTO> get hour {
    if (_hour is EqualUnmodifiableListView) return _hour;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_hour);
  }

  @override
  String toString() {
    return 'WeatherForecastDayRemoteDTO(date: $date, dateEpoch: $dateEpoch, day: $day, astro: $astro, hour: $hour)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WeatherForecastDayRemoteDTO &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.dateEpoch, dateEpoch) ||
                other.dateEpoch == dateEpoch) &&
            (identical(other.day, day) || other.day == day) &&
            (identical(other.astro, astro) || other.astro == astro) &&
            const DeepCollectionEquality().equals(other._hour, _hour));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, date, dateEpoch, day, astro,
      const DeepCollectionEquality().hash(_hour));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WeatherForecastDayRemoteDTOCopyWith<_$_WeatherForecastDayRemoteDTO>
      get copyWith => __$$_WeatherForecastDayRemoteDTOCopyWithImpl<
          _$_WeatherForecastDayRemoteDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WeatherForecastDayRemoteDTOToJson(
      this,
    );
  }
}

abstract class _WeatherForecastDayRemoteDTO
    implements WeatherForecastDayRemoteDTO {
  const factory _WeatherForecastDayRemoteDTO(
          {required final String date,
          @JsonKey(name: 'date_epoch') required final int dateEpoch,
          required final WeatherDayRemoteDTO day,
          required final WeatherAstroRemoteDTO astro,
          required final List<WeatherHourRemoteDTO> hour}) =
      _$_WeatherForecastDayRemoteDTO;

  factory _WeatherForecastDayRemoteDTO.fromJson(Map<String, dynamic> json) =
      _$_WeatherForecastDayRemoteDTO.fromJson;

  @override
  String get date;
  @override
  @JsonKey(name: 'date_epoch')
  int get dateEpoch;
  @override
  WeatherDayRemoteDTO get day;
  @override
  WeatherAstroRemoteDTO get astro;
  @override
  List<WeatherHourRemoteDTO> get hour;
  @override
  @JsonKey(ignore: true)
  _$$_WeatherForecastDayRemoteDTOCopyWith<_$_WeatherForecastDayRemoteDTO>
      get copyWith => throw _privateConstructorUsedError;
}

WeatherDayRemoteDTO _$WeatherDayRemoteDTOFromJson(Map<String, dynamic> json) {
  return _WeatherDayRemoteDTO.fromJson(json);
}

/// @nodoc
mixin _$WeatherDayRemoteDTO {
  @JsonKey(name: 'maxtemp_c')
  double get maxTempC => throw _privateConstructorUsedError;
  @JsonKey(name: 'maxtemp_f')
  double get maxTempF => throw _privateConstructorUsedError;
  @JsonKey(name: 'mintemp_c')
  double get minTempC => throw _privateConstructorUsedError;
  @JsonKey(name: 'mintemp_f')
  double get minTempF => throw _privateConstructorUsedError;
  @JsonKey(name: 'avgtemp_c')
  double get avgTempC => throw _privateConstructorUsedError;
  @JsonKey(name: 'avgtemp_f')
  double get avgTempF => throw _privateConstructorUsedError;
  @JsonKey(name: 'maxwind_mph')
  double get maxWindMph => throw _privateConstructorUsedError;
  @JsonKey(name: 'maxwind_kph')
  double get maxWindKph => throw _privateConstructorUsedError;
  @JsonKey(name: 'totalprecip_mm')
  double get totalPrecipMm => throw _privateConstructorUsedError;
  @JsonKey(name: 'totalprecip_in')
  double get totalPrecipIn => throw _privateConstructorUsedError;
  @JsonKey(name: 'totalsnow_cm')
  double get totalSnowCm => throw _privateConstructorUsedError;
  @JsonKey(name: 'avgvis_km')
  double get avgVisKm => throw _privateConstructorUsedError;
  @JsonKey(name: 'avgvis_miles')
  double get avgVisMiles => throw _privateConstructorUsedError;
  @JsonKey(name: 'avghumidity')
  double get avgHumidity => throw _privateConstructorUsedError;
  @JsonKey(name: 'daily_will_it_rain')
  int get dailyWillItRain => throw _privateConstructorUsedError;
  @JsonKey(name: 'daily_chance_of_rain')
  int get dailyChanceOfRain => throw _privateConstructorUsedError;
  @JsonKey(name: 'daily_will_it_snow')
  int get dailyWillItSnow => throw _privateConstructorUsedError;
  @JsonKey(name: 'daily_chance_of_snow')
  int get dailyChanceOfSnow => throw _privateConstructorUsedError;
  WeatherCurrentConditionRemoteDTO get condition =>
      throw _privateConstructorUsedError;
  double get uv => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WeatherDayRemoteDTOCopyWith<WeatherDayRemoteDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherDayRemoteDTOCopyWith<$Res> {
  factory $WeatherDayRemoteDTOCopyWith(
          WeatherDayRemoteDTO value, $Res Function(WeatherDayRemoteDTO) then) =
      _$WeatherDayRemoteDTOCopyWithImpl<$Res, WeatherDayRemoteDTO>;
  @useResult
  $Res call(
      {@JsonKey(name: 'maxtemp_c') double maxTempC,
      @JsonKey(name: 'maxtemp_f') double maxTempF,
      @JsonKey(name: 'mintemp_c') double minTempC,
      @JsonKey(name: 'mintemp_f') double minTempF,
      @JsonKey(name: 'avgtemp_c') double avgTempC,
      @JsonKey(name: 'avgtemp_f') double avgTempF,
      @JsonKey(name: 'maxwind_mph') double maxWindMph,
      @JsonKey(name: 'maxwind_kph') double maxWindKph,
      @JsonKey(name: 'totalprecip_mm') double totalPrecipMm,
      @JsonKey(name: 'totalprecip_in') double totalPrecipIn,
      @JsonKey(name: 'totalsnow_cm') double totalSnowCm,
      @JsonKey(name: 'avgvis_km') double avgVisKm,
      @JsonKey(name: 'avgvis_miles') double avgVisMiles,
      @JsonKey(name: 'avghumidity') double avgHumidity,
      @JsonKey(name: 'daily_will_it_rain') int dailyWillItRain,
      @JsonKey(name: 'daily_chance_of_rain') int dailyChanceOfRain,
      @JsonKey(name: 'daily_will_it_snow') int dailyWillItSnow,
      @JsonKey(name: 'daily_chance_of_snow') int dailyChanceOfSnow,
      WeatherCurrentConditionRemoteDTO condition,
      double uv});

  $WeatherCurrentConditionRemoteDTOCopyWith<$Res> get condition;
}

/// @nodoc
class _$WeatherDayRemoteDTOCopyWithImpl<$Res, $Val extends WeatherDayRemoteDTO>
    implements $WeatherDayRemoteDTOCopyWith<$Res> {
  _$WeatherDayRemoteDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? maxTempC = null,
    Object? maxTempF = null,
    Object? minTempC = null,
    Object? minTempF = null,
    Object? avgTempC = null,
    Object? avgTempF = null,
    Object? maxWindMph = null,
    Object? maxWindKph = null,
    Object? totalPrecipMm = null,
    Object? totalPrecipIn = null,
    Object? totalSnowCm = null,
    Object? avgVisKm = null,
    Object? avgVisMiles = null,
    Object? avgHumidity = null,
    Object? dailyWillItRain = null,
    Object? dailyChanceOfRain = null,
    Object? dailyWillItSnow = null,
    Object? dailyChanceOfSnow = null,
    Object? condition = null,
    Object? uv = null,
  }) {
    return _then(_value.copyWith(
      maxTempC: null == maxTempC
          ? _value.maxTempC
          : maxTempC // ignore: cast_nullable_to_non_nullable
              as double,
      maxTempF: null == maxTempF
          ? _value.maxTempF
          : maxTempF // ignore: cast_nullable_to_non_nullable
              as double,
      minTempC: null == minTempC
          ? _value.minTempC
          : minTempC // ignore: cast_nullable_to_non_nullable
              as double,
      minTempF: null == minTempF
          ? _value.minTempF
          : minTempF // ignore: cast_nullable_to_non_nullable
              as double,
      avgTempC: null == avgTempC
          ? _value.avgTempC
          : avgTempC // ignore: cast_nullable_to_non_nullable
              as double,
      avgTempF: null == avgTempF
          ? _value.avgTempF
          : avgTempF // ignore: cast_nullable_to_non_nullable
              as double,
      maxWindMph: null == maxWindMph
          ? _value.maxWindMph
          : maxWindMph // ignore: cast_nullable_to_non_nullable
              as double,
      maxWindKph: null == maxWindKph
          ? _value.maxWindKph
          : maxWindKph // ignore: cast_nullable_to_non_nullable
              as double,
      totalPrecipMm: null == totalPrecipMm
          ? _value.totalPrecipMm
          : totalPrecipMm // ignore: cast_nullable_to_non_nullable
              as double,
      totalPrecipIn: null == totalPrecipIn
          ? _value.totalPrecipIn
          : totalPrecipIn // ignore: cast_nullable_to_non_nullable
              as double,
      totalSnowCm: null == totalSnowCm
          ? _value.totalSnowCm
          : totalSnowCm // ignore: cast_nullable_to_non_nullable
              as double,
      avgVisKm: null == avgVisKm
          ? _value.avgVisKm
          : avgVisKm // ignore: cast_nullable_to_non_nullable
              as double,
      avgVisMiles: null == avgVisMiles
          ? _value.avgVisMiles
          : avgVisMiles // ignore: cast_nullable_to_non_nullable
              as double,
      avgHumidity: null == avgHumidity
          ? _value.avgHumidity
          : avgHumidity // ignore: cast_nullable_to_non_nullable
              as double,
      dailyWillItRain: null == dailyWillItRain
          ? _value.dailyWillItRain
          : dailyWillItRain // ignore: cast_nullable_to_non_nullable
              as int,
      dailyChanceOfRain: null == dailyChanceOfRain
          ? _value.dailyChanceOfRain
          : dailyChanceOfRain // ignore: cast_nullable_to_non_nullable
              as int,
      dailyWillItSnow: null == dailyWillItSnow
          ? _value.dailyWillItSnow
          : dailyWillItSnow // ignore: cast_nullable_to_non_nullable
              as int,
      dailyChanceOfSnow: null == dailyChanceOfSnow
          ? _value.dailyChanceOfSnow
          : dailyChanceOfSnow // ignore: cast_nullable_to_non_nullable
              as int,
      condition: null == condition
          ? _value.condition
          : condition // ignore: cast_nullable_to_non_nullable
              as WeatherCurrentConditionRemoteDTO,
      uv: null == uv
          ? _value.uv
          : uv // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $WeatherCurrentConditionRemoteDTOCopyWith<$Res> get condition {
    return $WeatherCurrentConditionRemoteDTOCopyWith<$Res>(_value.condition,
        (value) {
      return _then(_value.copyWith(condition: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_WeatherDayRemoteDTOCopyWith<$Res>
    implements $WeatherDayRemoteDTOCopyWith<$Res> {
  factory _$$_WeatherDayRemoteDTOCopyWith(_$_WeatherDayRemoteDTO value,
          $Res Function(_$_WeatherDayRemoteDTO) then) =
      __$$_WeatherDayRemoteDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'maxtemp_c') double maxTempC,
      @JsonKey(name: 'maxtemp_f') double maxTempF,
      @JsonKey(name: 'mintemp_c') double minTempC,
      @JsonKey(name: 'mintemp_f') double minTempF,
      @JsonKey(name: 'avgtemp_c') double avgTempC,
      @JsonKey(name: 'avgtemp_f') double avgTempF,
      @JsonKey(name: 'maxwind_mph') double maxWindMph,
      @JsonKey(name: 'maxwind_kph') double maxWindKph,
      @JsonKey(name: 'totalprecip_mm') double totalPrecipMm,
      @JsonKey(name: 'totalprecip_in') double totalPrecipIn,
      @JsonKey(name: 'totalsnow_cm') double totalSnowCm,
      @JsonKey(name: 'avgvis_km') double avgVisKm,
      @JsonKey(name: 'avgvis_miles') double avgVisMiles,
      @JsonKey(name: 'avghumidity') double avgHumidity,
      @JsonKey(name: 'daily_will_it_rain') int dailyWillItRain,
      @JsonKey(name: 'daily_chance_of_rain') int dailyChanceOfRain,
      @JsonKey(name: 'daily_will_it_snow') int dailyWillItSnow,
      @JsonKey(name: 'daily_chance_of_snow') int dailyChanceOfSnow,
      WeatherCurrentConditionRemoteDTO condition,
      double uv});

  @override
  $WeatherCurrentConditionRemoteDTOCopyWith<$Res> get condition;
}

/// @nodoc
class __$$_WeatherDayRemoteDTOCopyWithImpl<$Res>
    extends _$WeatherDayRemoteDTOCopyWithImpl<$Res, _$_WeatherDayRemoteDTO>
    implements _$$_WeatherDayRemoteDTOCopyWith<$Res> {
  __$$_WeatherDayRemoteDTOCopyWithImpl(_$_WeatherDayRemoteDTO _value,
      $Res Function(_$_WeatherDayRemoteDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? maxTempC = null,
    Object? maxTempF = null,
    Object? minTempC = null,
    Object? minTempF = null,
    Object? avgTempC = null,
    Object? avgTempF = null,
    Object? maxWindMph = null,
    Object? maxWindKph = null,
    Object? totalPrecipMm = null,
    Object? totalPrecipIn = null,
    Object? totalSnowCm = null,
    Object? avgVisKm = null,
    Object? avgVisMiles = null,
    Object? avgHumidity = null,
    Object? dailyWillItRain = null,
    Object? dailyChanceOfRain = null,
    Object? dailyWillItSnow = null,
    Object? dailyChanceOfSnow = null,
    Object? condition = null,
    Object? uv = null,
  }) {
    return _then(_$_WeatherDayRemoteDTO(
      maxTempC: null == maxTempC
          ? _value.maxTempC
          : maxTempC // ignore: cast_nullable_to_non_nullable
              as double,
      maxTempF: null == maxTempF
          ? _value.maxTempF
          : maxTempF // ignore: cast_nullable_to_non_nullable
              as double,
      minTempC: null == minTempC
          ? _value.minTempC
          : minTempC // ignore: cast_nullable_to_non_nullable
              as double,
      minTempF: null == minTempF
          ? _value.minTempF
          : minTempF // ignore: cast_nullable_to_non_nullable
              as double,
      avgTempC: null == avgTempC
          ? _value.avgTempC
          : avgTempC // ignore: cast_nullable_to_non_nullable
              as double,
      avgTempF: null == avgTempF
          ? _value.avgTempF
          : avgTempF // ignore: cast_nullable_to_non_nullable
              as double,
      maxWindMph: null == maxWindMph
          ? _value.maxWindMph
          : maxWindMph // ignore: cast_nullable_to_non_nullable
              as double,
      maxWindKph: null == maxWindKph
          ? _value.maxWindKph
          : maxWindKph // ignore: cast_nullable_to_non_nullable
              as double,
      totalPrecipMm: null == totalPrecipMm
          ? _value.totalPrecipMm
          : totalPrecipMm // ignore: cast_nullable_to_non_nullable
              as double,
      totalPrecipIn: null == totalPrecipIn
          ? _value.totalPrecipIn
          : totalPrecipIn // ignore: cast_nullable_to_non_nullable
              as double,
      totalSnowCm: null == totalSnowCm
          ? _value.totalSnowCm
          : totalSnowCm // ignore: cast_nullable_to_non_nullable
              as double,
      avgVisKm: null == avgVisKm
          ? _value.avgVisKm
          : avgVisKm // ignore: cast_nullable_to_non_nullable
              as double,
      avgVisMiles: null == avgVisMiles
          ? _value.avgVisMiles
          : avgVisMiles // ignore: cast_nullable_to_non_nullable
              as double,
      avgHumidity: null == avgHumidity
          ? _value.avgHumidity
          : avgHumidity // ignore: cast_nullable_to_non_nullable
              as double,
      dailyWillItRain: null == dailyWillItRain
          ? _value.dailyWillItRain
          : dailyWillItRain // ignore: cast_nullable_to_non_nullable
              as int,
      dailyChanceOfRain: null == dailyChanceOfRain
          ? _value.dailyChanceOfRain
          : dailyChanceOfRain // ignore: cast_nullable_to_non_nullable
              as int,
      dailyWillItSnow: null == dailyWillItSnow
          ? _value.dailyWillItSnow
          : dailyWillItSnow // ignore: cast_nullable_to_non_nullable
              as int,
      dailyChanceOfSnow: null == dailyChanceOfSnow
          ? _value.dailyChanceOfSnow
          : dailyChanceOfSnow // ignore: cast_nullable_to_non_nullable
              as int,
      condition: null == condition
          ? _value.condition
          : condition // ignore: cast_nullable_to_non_nullable
              as WeatherCurrentConditionRemoteDTO,
      uv: null == uv
          ? _value.uv
          : uv // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_WeatherDayRemoteDTO implements _WeatherDayRemoteDTO {
  const _$_WeatherDayRemoteDTO(
      {@JsonKey(name: 'maxtemp_c') required this.maxTempC,
      @JsonKey(name: 'maxtemp_f') required this.maxTempF,
      @JsonKey(name: 'mintemp_c') required this.minTempC,
      @JsonKey(name: 'mintemp_f') required this.minTempF,
      @JsonKey(name: 'avgtemp_c') required this.avgTempC,
      @JsonKey(name: 'avgtemp_f') required this.avgTempF,
      @JsonKey(name: 'maxwind_mph') required this.maxWindMph,
      @JsonKey(name: 'maxwind_kph') required this.maxWindKph,
      @JsonKey(name: 'totalprecip_mm') required this.totalPrecipMm,
      @JsonKey(name: 'totalprecip_in') required this.totalPrecipIn,
      @JsonKey(name: 'totalsnow_cm') required this.totalSnowCm,
      @JsonKey(name: 'avgvis_km') required this.avgVisKm,
      @JsonKey(name: 'avgvis_miles') required this.avgVisMiles,
      @JsonKey(name: 'avghumidity') required this.avgHumidity,
      @JsonKey(name: 'daily_will_it_rain') required this.dailyWillItRain,
      @JsonKey(name: 'daily_chance_of_rain') required this.dailyChanceOfRain,
      @JsonKey(name: 'daily_will_it_snow') required this.dailyWillItSnow,
      @JsonKey(name: 'daily_chance_of_snow') required this.dailyChanceOfSnow,
      required this.condition,
      required this.uv});

  factory _$_WeatherDayRemoteDTO.fromJson(Map<String, dynamic> json) =>
      _$$_WeatherDayRemoteDTOFromJson(json);

  @override
  @JsonKey(name: 'maxtemp_c')
  final double maxTempC;
  @override
  @JsonKey(name: 'maxtemp_f')
  final double maxTempF;
  @override
  @JsonKey(name: 'mintemp_c')
  final double minTempC;
  @override
  @JsonKey(name: 'mintemp_f')
  final double minTempF;
  @override
  @JsonKey(name: 'avgtemp_c')
  final double avgTempC;
  @override
  @JsonKey(name: 'avgtemp_f')
  final double avgTempF;
  @override
  @JsonKey(name: 'maxwind_mph')
  final double maxWindMph;
  @override
  @JsonKey(name: 'maxwind_kph')
  final double maxWindKph;
  @override
  @JsonKey(name: 'totalprecip_mm')
  final double totalPrecipMm;
  @override
  @JsonKey(name: 'totalprecip_in')
  final double totalPrecipIn;
  @override
  @JsonKey(name: 'totalsnow_cm')
  final double totalSnowCm;
  @override
  @JsonKey(name: 'avgvis_km')
  final double avgVisKm;
  @override
  @JsonKey(name: 'avgvis_miles')
  final double avgVisMiles;
  @override
  @JsonKey(name: 'avghumidity')
  final double avgHumidity;
  @override
  @JsonKey(name: 'daily_will_it_rain')
  final int dailyWillItRain;
  @override
  @JsonKey(name: 'daily_chance_of_rain')
  final int dailyChanceOfRain;
  @override
  @JsonKey(name: 'daily_will_it_snow')
  final int dailyWillItSnow;
  @override
  @JsonKey(name: 'daily_chance_of_snow')
  final int dailyChanceOfSnow;
  @override
  final WeatherCurrentConditionRemoteDTO condition;
  @override
  final double uv;

  @override
  String toString() {
    return 'WeatherDayRemoteDTO(maxTempC: $maxTempC, maxTempF: $maxTempF, minTempC: $minTempC, minTempF: $minTempF, avgTempC: $avgTempC, avgTempF: $avgTempF, maxWindMph: $maxWindMph, maxWindKph: $maxWindKph, totalPrecipMm: $totalPrecipMm, totalPrecipIn: $totalPrecipIn, totalSnowCm: $totalSnowCm, avgVisKm: $avgVisKm, avgVisMiles: $avgVisMiles, avgHumidity: $avgHumidity, dailyWillItRain: $dailyWillItRain, dailyChanceOfRain: $dailyChanceOfRain, dailyWillItSnow: $dailyWillItSnow, dailyChanceOfSnow: $dailyChanceOfSnow, condition: $condition, uv: $uv)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WeatherDayRemoteDTO &&
            (identical(other.maxTempC, maxTempC) ||
                other.maxTempC == maxTempC) &&
            (identical(other.maxTempF, maxTempF) ||
                other.maxTempF == maxTempF) &&
            (identical(other.minTempC, minTempC) ||
                other.minTempC == minTempC) &&
            (identical(other.minTempF, minTempF) ||
                other.minTempF == minTempF) &&
            (identical(other.avgTempC, avgTempC) ||
                other.avgTempC == avgTempC) &&
            (identical(other.avgTempF, avgTempF) ||
                other.avgTempF == avgTempF) &&
            (identical(other.maxWindMph, maxWindMph) ||
                other.maxWindMph == maxWindMph) &&
            (identical(other.maxWindKph, maxWindKph) ||
                other.maxWindKph == maxWindKph) &&
            (identical(other.totalPrecipMm, totalPrecipMm) ||
                other.totalPrecipMm == totalPrecipMm) &&
            (identical(other.totalPrecipIn, totalPrecipIn) ||
                other.totalPrecipIn == totalPrecipIn) &&
            (identical(other.totalSnowCm, totalSnowCm) ||
                other.totalSnowCm == totalSnowCm) &&
            (identical(other.avgVisKm, avgVisKm) ||
                other.avgVisKm == avgVisKm) &&
            (identical(other.avgVisMiles, avgVisMiles) ||
                other.avgVisMiles == avgVisMiles) &&
            (identical(other.avgHumidity, avgHumidity) ||
                other.avgHumidity == avgHumidity) &&
            (identical(other.dailyWillItRain, dailyWillItRain) ||
                other.dailyWillItRain == dailyWillItRain) &&
            (identical(other.dailyChanceOfRain, dailyChanceOfRain) ||
                other.dailyChanceOfRain == dailyChanceOfRain) &&
            (identical(other.dailyWillItSnow, dailyWillItSnow) ||
                other.dailyWillItSnow == dailyWillItSnow) &&
            (identical(other.dailyChanceOfSnow, dailyChanceOfSnow) ||
                other.dailyChanceOfSnow == dailyChanceOfSnow) &&
            (identical(other.condition, condition) ||
                other.condition == condition) &&
            (identical(other.uv, uv) || other.uv == uv));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        maxTempC,
        maxTempF,
        minTempC,
        minTempF,
        avgTempC,
        avgTempF,
        maxWindMph,
        maxWindKph,
        totalPrecipMm,
        totalPrecipIn,
        totalSnowCm,
        avgVisKm,
        avgVisMiles,
        avgHumidity,
        dailyWillItRain,
        dailyChanceOfRain,
        dailyWillItSnow,
        dailyChanceOfSnow,
        condition,
        uv
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WeatherDayRemoteDTOCopyWith<_$_WeatherDayRemoteDTO> get copyWith =>
      __$$_WeatherDayRemoteDTOCopyWithImpl<_$_WeatherDayRemoteDTO>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WeatherDayRemoteDTOToJson(
      this,
    );
  }
}

abstract class _WeatherDayRemoteDTO implements WeatherDayRemoteDTO {
  const factory _WeatherDayRemoteDTO(
      {@JsonKey(name: 'maxtemp_c')
          required final double maxTempC,
      @JsonKey(name: 'maxtemp_f')
          required final double maxTempF,
      @JsonKey(name: 'mintemp_c')
          required final double minTempC,
      @JsonKey(name: 'mintemp_f')
          required final double minTempF,
      @JsonKey(name: 'avgtemp_c')
          required final double avgTempC,
      @JsonKey(name: 'avgtemp_f')
          required final double avgTempF,
      @JsonKey(name: 'maxwind_mph')
          required final double maxWindMph,
      @JsonKey(name: 'maxwind_kph')
          required final double maxWindKph,
      @JsonKey(name: 'totalprecip_mm')
          required final double totalPrecipMm,
      @JsonKey(name: 'totalprecip_in')
          required final double totalPrecipIn,
      @JsonKey(name: 'totalsnow_cm')
          required final double totalSnowCm,
      @JsonKey(name: 'avgvis_km')
          required final double avgVisKm,
      @JsonKey(name: 'avgvis_miles')
          required final double avgVisMiles,
      @JsonKey(name: 'avghumidity')
          required final double avgHumidity,
      @JsonKey(name: 'daily_will_it_rain')
          required final int dailyWillItRain,
      @JsonKey(name: 'daily_chance_of_rain')
          required final int dailyChanceOfRain,
      @JsonKey(name: 'daily_will_it_snow')
          required final int dailyWillItSnow,
      @JsonKey(name: 'daily_chance_of_snow')
          required final int dailyChanceOfSnow,
      required final WeatherCurrentConditionRemoteDTO condition,
      required final double uv}) = _$_WeatherDayRemoteDTO;

  factory _WeatherDayRemoteDTO.fromJson(Map<String, dynamic> json) =
      _$_WeatherDayRemoteDTO.fromJson;

  @override
  @JsonKey(name: 'maxtemp_c')
  double get maxTempC;
  @override
  @JsonKey(name: 'maxtemp_f')
  double get maxTempF;
  @override
  @JsonKey(name: 'mintemp_c')
  double get minTempC;
  @override
  @JsonKey(name: 'mintemp_f')
  double get minTempF;
  @override
  @JsonKey(name: 'avgtemp_c')
  double get avgTempC;
  @override
  @JsonKey(name: 'avgtemp_f')
  double get avgTempF;
  @override
  @JsonKey(name: 'maxwind_mph')
  double get maxWindMph;
  @override
  @JsonKey(name: 'maxwind_kph')
  double get maxWindKph;
  @override
  @JsonKey(name: 'totalprecip_mm')
  double get totalPrecipMm;
  @override
  @JsonKey(name: 'totalprecip_in')
  double get totalPrecipIn;
  @override
  @JsonKey(name: 'totalsnow_cm')
  double get totalSnowCm;
  @override
  @JsonKey(name: 'avgvis_km')
  double get avgVisKm;
  @override
  @JsonKey(name: 'avgvis_miles')
  double get avgVisMiles;
  @override
  @JsonKey(name: 'avghumidity')
  double get avgHumidity;
  @override
  @JsonKey(name: 'daily_will_it_rain')
  int get dailyWillItRain;
  @override
  @JsonKey(name: 'daily_chance_of_rain')
  int get dailyChanceOfRain;
  @override
  @JsonKey(name: 'daily_will_it_snow')
  int get dailyWillItSnow;
  @override
  @JsonKey(name: 'daily_chance_of_snow')
  int get dailyChanceOfSnow;
  @override
  WeatherCurrentConditionRemoteDTO get condition;
  @override
  double get uv;
  @override
  @JsonKey(ignore: true)
  _$$_WeatherDayRemoteDTOCopyWith<_$_WeatherDayRemoteDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

WeatherAstroRemoteDTO _$WeatherAstroRemoteDTOFromJson(
    Map<String, dynamic> json) {
  return _WeatherAstroRemoteDTO.fromJson(json);
}

/// @nodoc
mixin _$WeatherAstroRemoteDTO {
  String get sunrise => throw _privateConstructorUsedError;
  String get sunset => throw _privateConstructorUsedError;
  String get moonrise => throw _privateConstructorUsedError;
  String get moonset => throw _privateConstructorUsedError;
  @JsonKey(name: 'moon_phase')
  String get moonPhase => throw _privateConstructorUsedError;
  @JsonKey(name: 'moon_illumination')
  String get moonIllumination => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_moon_up')
  int get isMoonUp => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_sun_up')
  int get isSunUp => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WeatherAstroRemoteDTOCopyWith<WeatherAstroRemoteDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherAstroRemoteDTOCopyWith<$Res> {
  factory $WeatherAstroRemoteDTOCopyWith(WeatherAstroRemoteDTO value,
          $Res Function(WeatherAstroRemoteDTO) then) =
      _$WeatherAstroRemoteDTOCopyWithImpl<$Res, WeatherAstroRemoteDTO>;
  @useResult
  $Res call(
      {String sunrise,
      String sunset,
      String moonrise,
      String moonset,
      @JsonKey(name: 'moon_phase') String moonPhase,
      @JsonKey(name: 'moon_illumination') String moonIllumination,
      @JsonKey(name: 'is_moon_up') int isMoonUp,
      @JsonKey(name: 'is_sun_up') int isSunUp});
}

/// @nodoc
class _$WeatherAstroRemoteDTOCopyWithImpl<$Res,
        $Val extends WeatherAstroRemoteDTO>
    implements $WeatherAstroRemoteDTOCopyWith<$Res> {
  _$WeatherAstroRemoteDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sunrise = null,
    Object? sunset = null,
    Object? moonrise = null,
    Object? moonset = null,
    Object? moonPhase = null,
    Object? moonIllumination = null,
    Object? isMoonUp = null,
    Object? isSunUp = null,
  }) {
    return _then(_value.copyWith(
      sunrise: null == sunrise
          ? _value.sunrise
          : sunrise // ignore: cast_nullable_to_non_nullable
              as String,
      sunset: null == sunset
          ? _value.sunset
          : sunset // ignore: cast_nullable_to_non_nullable
              as String,
      moonrise: null == moonrise
          ? _value.moonrise
          : moonrise // ignore: cast_nullable_to_non_nullable
              as String,
      moonset: null == moonset
          ? _value.moonset
          : moonset // ignore: cast_nullable_to_non_nullable
              as String,
      moonPhase: null == moonPhase
          ? _value.moonPhase
          : moonPhase // ignore: cast_nullable_to_non_nullable
              as String,
      moonIllumination: null == moonIllumination
          ? _value.moonIllumination
          : moonIllumination // ignore: cast_nullable_to_non_nullable
              as String,
      isMoonUp: null == isMoonUp
          ? _value.isMoonUp
          : isMoonUp // ignore: cast_nullable_to_non_nullable
              as int,
      isSunUp: null == isSunUp
          ? _value.isSunUp
          : isSunUp // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_WeatherAstroRemoteDTOCopyWith<$Res>
    implements $WeatherAstroRemoteDTOCopyWith<$Res> {
  factory _$$_WeatherAstroRemoteDTOCopyWith(_$_WeatherAstroRemoteDTO value,
          $Res Function(_$_WeatherAstroRemoteDTO) then) =
      __$$_WeatherAstroRemoteDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String sunrise,
      String sunset,
      String moonrise,
      String moonset,
      @JsonKey(name: 'moon_phase') String moonPhase,
      @JsonKey(name: 'moon_illumination') String moonIllumination,
      @JsonKey(name: 'is_moon_up') int isMoonUp,
      @JsonKey(name: 'is_sun_up') int isSunUp});
}

/// @nodoc
class __$$_WeatherAstroRemoteDTOCopyWithImpl<$Res>
    extends _$WeatherAstroRemoteDTOCopyWithImpl<$Res, _$_WeatherAstroRemoteDTO>
    implements _$$_WeatherAstroRemoteDTOCopyWith<$Res> {
  __$$_WeatherAstroRemoteDTOCopyWithImpl(_$_WeatherAstroRemoteDTO _value,
      $Res Function(_$_WeatherAstroRemoteDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sunrise = null,
    Object? sunset = null,
    Object? moonrise = null,
    Object? moonset = null,
    Object? moonPhase = null,
    Object? moonIllumination = null,
    Object? isMoonUp = null,
    Object? isSunUp = null,
  }) {
    return _then(_$_WeatherAstroRemoteDTO(
      sunrise: null == sunrise
          ? _value.sunrise
          : sunrise // ignore: cast_nullable_to_non_nullable
              as String,
      sunset: null == sunset
          ? _value.sunset
          : sunset // ignore: cast_nullable_to_non_nullable
              as String,
      moonrise: null == moonrise
          ? _value.moonrise
          : moonrise // ignore: cast_nullable_to_non_nullable
              as String,
      moonset: null == moonset
          ? _value.moonset
          : moonset // ignore: cast_nullable_to_non_nullable
              as String,
      moonPhase: null == moonPhase
          ? _value.moonPhase
          : moonPhase // ignore: cast_nullable_to_non_nullable
              as String,
      moonIllumination: null == moonIllumination
          ? _value.moonIllumination
          : moonIllumination // ignore: cast_nullable_to_non_nullable
              as String,
      isMoonUp: null == isMoonUp
          ? _value.isMoonUp
          : isMoonUp // ignore: cast_nullable_to_non_nullable
              as int,
      isSunUp: null == isSunUp
          ? _value.isSunUp
          : isSunUp // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_WeatherAstroRemoteDTO implements _WeatherAstroRemoteDTO {
  const _$_WeatherAstroRemoteDTO(
      {required this.sunrise,
      required this.sunset,
      required this.moonrise,
      required this.moonset,
      @JsonKey(name: 'moon_phase') required this.moonPhase,
      @JsonKey(name: 'moon_illumination') required this.moonIllumination,
      @JsonKey(name: 'is_moon_up') required this.isMoonUp,
      @JsonKey(name: 'is_sun_up') required this.isSunUp});

  factory _$_WeatherAstroRemoteDTO.fromJson(Map<String, dynamic> json) =>
      _$$_WeatherAstroRemoteDTOFromJson(json);

  @override
  final String sunrise;
  @override
  final String sunset;
  @override
  final String moonrise;
  @override
  final String moonset;
  @override
  @JsonKey(name: 'moon_phase')
  final String moonPhase;
  @override
  @JsonKey(name: 'moon_illumination')
  final String moonIllumination;
  @override
  @JsonKey(name: 'is_moon_up')
  final int isMoonUp;
  @override
  @JsonKey(name: 'is_sun_up')
  final int isSunUp;

  @override
  String toString() {
    return 'WeatherAstroRemoteDTO(sunrise: $sunrise, sunset: $sunset, moonrise: $moonrise, moonset: $moonset, moonPhase: $moonPhase, moonIllumination: $moonIllumination, isMoonUp: $isMoonUp, isSunUp: $isSunUp)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WeatherAstroRemoteDTO &&
            (identical(other.sunrise, sunrise) || other.sunrise == sunrise) &&
            (identical(other.sunset, sunset) || other.sunset == sunset) &&
            (identical(other.moonrise, moonrise) ||
                other.moonrise == moonrise) &&
            (identical(other.moonset, moonset) || other.moonset == moonset) &&
            (identical(other.moonPhase, moonPhase) ||
                other.moonPhase == moonPhase) &&
            (identical(other.moonIllumination, moonIllumination) ||
                other.moonIllumination == moonIllumination) &&
            (identical(other.isMoonUp, isMoonUp) ||
                other.isMoonUp == isMoonUp) &&
            (identical(other.isSunUp, isSunUp) || other.isSunUp == isSunUp));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, sunrise, sunset, moonrise,
      moonset, moonPhase, moonIllumination, isMoonUp, isSunUp);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WeatherAstroRemoteDTOCopyWith<_$_WeatherAstroRemoteDTO> get copyWith =>
      __$$_WeatherAstroRemoteDTOCopyWithImpl<_$_WeatherAstroRemoteDTO>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WeatherAstroRemoteDTOToJson(
      this,
    );
  }
}

abstract class _WeatherAstroRemoteDTO implements WeatherAstroRemoteDTO {
  const factory _WeatherAstroRemoteDTO(
      {required final String sunrise,
      required final String sunset,
      required final String moonrise,
      required final String moonset,
      @JsonKey(name: 'moon_phase')
          required final String moonPhase,
      @JsonKey(name: 'moon_illumination')
          required final String moonIllumination,
      @JsonKey(name: 'is_moon_up')
          required final int isMoonUp,
      @JsonKey(name: 'is_sun_up')
          required final int isSunUp}) = _$_WeatherAstroRemoteDTO;

  factory _WeatherAstroRemoteDTO.fromJson(Map<String, dynamic> json) =
      _$_WeatherAstroRemoteDTO.fromJson;

  @override
  String get sunrise;
  @override
  String get sunset;
  @override
  String get moonrise;
  @override
  String get moonset;
  @override
  @JsonKey(name: 'moon_phase')
  String get moonPhase;
  @override
  @JsonKey(name: 'moon_illumination')
  String get moonIllumination;
  @override
  @JsonKey(name: 'is_moon_up')
  int get isMoonUp;
  @override
  @JsonKey(name: 'is_sun_up')
  int get isSunUp;
  @override
  @JsonKey(ignore: true)
  _$$_WeatherAstroRemoteDTOCopyWith<_$_WeatherAstroRemoteDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

WeatherHourRemoteDTO _$WeatherHourRemoteDTOFromJson(Map<String, dynamic> json) {
  return _WeatherHourRemoteDTO.fromJson(json);
}

/// @nodoc
mixin _$WeatherHourRemoteDTO {
  String get time => throw _privateConstructorUsedError;
  @JsonKey(name: 'time_epoch')
  int get timeEpoch => throw _privateConstructorUsedError;
  @JsonKey(name: 'temp_c')
  double get tempC => throw _privateConstructorUsedError;
  @JsonKey(name: 'temp_f')
  double get tempF => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_day')
  int get isDay => throw _privateConstructorUsedError;
  WeatherCurrentConditionRemoteDTO get condition =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'wind_mph')
  double get windMph => throw _privateConstructorUsedError;
  @JsonKey(name: 'wind_kph')
  double get windKph => throw _privateConstructorUsedError;
  @JsonKey(name: 'wind_degree')
  int get windDegree => throw _privateConstructorUsedError;
  @JsonKey(name: 'wind_dir')
  String get windDir => throw _privateConstructorUsedError;
  @JsonKey(name: 'pressure_mb')
  double get pressureMb => throw _privateConstructorUsedError;
  @JsonKey(name: 'pressure_in')
  double get pressureIn => throw _privateConstructorUsedError;
  @JsonKey(name: 'precip_mm')
  double get precipMm => throw _privateConstructorUsedError;
  @JsonKey(name: 'precip_in')
  double get precipIn => throw _privateConstructorUsedError;
  int get humidity => throw _privateConstructorUsedError;
  int get cloud => throw _privateConstructorUsedError;
  @JsonKey(name: 'feelslike_c')
  double get feelsLikeC => throw _privateConstructorUsedError;
  @JsonKey(name: 'feelslike_f')
  double get feelsLikeF => throw _privateConstructorUsedError;
  @JsonKey(name: 'windchill_c')
  double get windChillC => throw _privateConstructorUsedError;
  @JsonKey(name: 'windchill_f')
  double get windChillF => throw _privateConstructorUsedError;
  @JsonKey(name: 'heatindex_c')
  double get heatIndexC => throw _privateConstructorUsedError;
  @JsonKey(name: 'heatindex_f')
  double get heatIndexF => throw _privateConstructorUsedError;
  @JsonKey(name: 'dewpoint_c')
  double get dewPointC => throw _privateConstructorUsedError;
  @JsonKey(name: 'dewpoint_f')
  double get dewPointF => throw _privateConstructorUsedError;
  @JsonKey(name: 'will_it_rain')
  int get willItRain => throw _privateConstructorUsedError;
  @JsonKey(name: 'chance_of_rain')
  double get chanceOfRain => throw _privateConstructorUsedError;
  @JsonKey(name: 'will_it_snow')
  int get willItSnow => throw _privateConstructorUsedError;
  @JsonKey(name: 'chance_of_snow')
  double get chanceOfSnow => throw _privateConstructorUsedError;
  @JsonKey(name: 'vis_km')
  double get visKm => throw _privateConstructorUsedError;
  @JsonKey(name: 'vis_miles')
  double get visMiles => throw _privateConstructorUsedError;
  double? get gustMph => throw _privateConstructorUsedError;
  double? get gustKph => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WeatherHourRemoteDTOCopyWith<WeatherHourRemoteDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherHourRemoteDTOCopyWith<$Res> {
  factory $WeatherHourRemoteDTOCopyWith(WeatherHourRemoteDTO value,
          $Res Function(WeatherHourRemoteDTO) then) =
      _$WeatherHourRemoteDTOCopyWithImpl<$Res, WeatherHourRemoteDTO>;
  @useResult
  $Res call(
      {String time,
      @JsonKey(name: 'time_epoch') int timeEpoch,
      @JsonKey(name: 'temp_c') double tempC,
      @JsonKey(name: 'temp_f') double tempF,
      @JsonKey(name: 'is_day') int isDay,
      WeatherCurrentConditionRemoteDTO condition,
      @JsonKey(name: 'wind_mph') double windMph,
      @JsonKey(name: 'wind_kph') double windKph,
      @JsonKey(name: 'wind_degree') int windDegree,
      @JsonKey(name: 'wind_dir') String windDir,
      @JsonKey(name: 'pressure_mb') double pressureMb,
      @JsonKey(name: 'pressure_in') double pressureIn,
      @JsonKey(name: 'precip_mm') double precipMm,
      @JsonKey(name: 'precip_in') double precipIn,
      int humidity,
      int cloud,
      @JsonKey(name: 'feelslike_c') double feelsLikeC,
      @JsonKey(name: 'feelslike_f') double feelsLikeF,
      @JsonKey(name: 'windchill_c') double windChillC,
      @JsonKey(name: 'windchill_f') double windChillF,
      @JsonKey(name: 'heatindex_c') double heatIndexC,
      @JsonKey(name: 'heatindex_f') double heatIndexF,
      @JsonKey(name: 'dewpoint_c') double dewPointC,
      @JsonKey(name: 'dewpoint_f') double dewPointF,
      @JsonKey(name: 'will_it_rain') int willItRain,
      @JsonKey(name: 'chance_of_rain') double chanceOfRain,
      @JsonKey(name: 'will_it_snow') int willItSnow,
      @JsonKey(name: 'chance_of_snow') double chanceOfSnow,
      @JsonKey(name: 'vis_km') double visKm,
      @JsonKey(name: 'vis_miles') double visMiles,
      double? gustMph,
      double? gustKph});

  $WeatherCurrentConditionRemoteDTOCopyWith<$Res> get condition;
}

/// @nodoc
class _$WeatherHourRemoteDTOCopyWithImpl<$Res,
        $Val extends WeatherHourRemoteDTO>
    implements $WeatherHourRemoteDTOCopyWith<$Res> {
  _$WeatherHourRemoteDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = null,
    Object? timeEpoch = null,
    Object? tempC = null,
    Object? tempF = null,
    Object? isDay = null,
    Object? condition = null,
    Object? windMph = null,
    Object? windKph = null,
    Object? windDegree = null,
    Object? windDir = null,
    Object? pressureMb = null,
    Object? pressureIn = null,
    Object? precipMm = null,
    Object? precipIn = null,
    Object? humidity = null,
    Object? cloud = null,
    Object? feelsLikeC = null,
    Object? feelsLikeF = null,
    Object? windChillC = null,
    Object? windChillF = null,
    Object? heatIndexC = null,
    Object? heatIndexF = null,
    Object? dewPointC = null,
    Object? dewPointF = null,
    Object? willItRain = null,
    Object? chanceOfRain = null,
    Object? willItSnow = null,
    Object? chanceOfSnow = null,
    Object? visKm = null,
    Object? visMiles = null,
    Object? gustMph = freezed,
    Object? gustKph = freezed,
  }) {
    return _then(_value.copyWith(
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
      timeEpoch: null == timeEpoch
          ? _value.timeEpoch
          : timeEpoch // ignore: cast_nullable_to_non_nullable
              as int,
      tempC: null == tempC
          ? _value.tempC
          : tempC // ignore: cast_nullable_to_non_nullable
              as double,
      tempF: null == tempF
          ? _value.tempF
          : tempF // ignore: cast_nullable_to_non_nullable
              as double,
      isDay: null == isDay
          ? _value.isDay
          : isDay // ignore: cast_nullable_to_non_nullable
              as int,
      condition: null == condition
          ? _value.condition
          : condition // ignore: cast_nullable_to_non_nullable
              as WeatherCurrentConditionRemoteDTO,
      windMph: null == windMph
          ? _value.windMph
          : windMph // ignore: cast_nullable_to_non_nullable
              as double,
      windKph: null == windKph
          ? _value.windKph
          : windKph // ignore: cast_nullable_to_non_nullable
              as double,
      windDegree: null == windDegree
          ? _value.windDegree
          : windDegree // ignore: cast_nullable_to_non_nullable
              as int,
      windDir: null == windDir
          ? _value.windDir
          : windDir // ignore: cast_nullable_to_non_nullable
              as String,
      pressureMb: null == pressureMb
          ? _value.pressureMb
          : pressureMb // ignore: cast_nullable_to_non_nullable
              as double,
      pressureIn: null == pressureIn
          ? _value.pressureIn
          : pressureIn // ignore: cast_nullable_to_non_nullable
              as double,
      precipMm: null == precipMm
          ? _value.precipMm
          : precipMm // ignore: cast_nullable_to_non_nullable
              as double,
      precipIn: null == precipIn
          ? _value.precipIn
          : precipIn // ignore: cast_nullable_to_non_nullable
              as double,
      humidity: null == humidity
          ? _value.humidity
          : humidity // ignore: cast_nullable_to_non_nullable
              as int,
      cloud: null == cloud
          ? _value.cloud
          : cloud // ignore: cast_nullable_to_non_nullable
              as int,
      feelsLikeC: null == feelsLikeC
          ? _value.feelsLikeC
          : feelsLikeC // ignore: cast_nullable_to_non_nullable
              as double,
      feelsLikeF: null == feelsLikeF
          ? _value.feelsLikeF
          : feelsLikeF // ignore: cast_nullable_to_non_nullable
              as double,
      windChillC: null == windChillC
          ? _value.windChillC
          : windChillC // ignore: cast_nullable_to_non_nullable
              as double,
      windChillF: null == windChillF
          ? _value.windChillF
          : windChillF // ignore: cast_nullable_to_non_nullable
              as double,
      heatIndexC: null == heatIndexC
          ? _value.heatIndexC
          : heatIndexC // ignore: cast_nullable_to_non_nullable
              as double,
      heatIndexF: null == heatIndexF
          ? _value.heatIndexF
          : heatIndexF // ignore: cast_nullable_to_non_nullable
              as double,
      dewPointC: null == dewPointC
          ? _value.dewPointC
          : dewPointC // ignore: cast_nullable_to_non_nullable
              as double,
      dewPointF: null == dewPointF
          ? _value.dewPointF
          : dewPointF // ignore: cast_nullable_to_non_nullable
              as double,
      willItRain: null == willItRain
          ? _value.willItRain
          : willItRain // ignore: cast_nullable_to_non_nullable
              as int,
      chanceOfRain: null == chanceOfRain
          ? _value.chanceOfRain
          : chanceOfRain // ignore: cast_nullable_to_non_nullable
              as double,
      willItSnow: null == willItSnow
          ? _value.willItSnow
          : willItSnow // ignore: cast_nullable_to_non_nullable
              as int,
      chanceOfSnow: null == chanceOfSnow
          ? _value.chanceOfSnow
          : chanceOfSnow // ignore: cast_nullable_to_non_nullable
              as double,
      visKm: null == visKm
          ? _value.visKm
          : visKm // ignore: cast_nullable_to_non_nullable
              as double,
      visMiles: null == visMiles
          ? _value.visMiles
          : visMiles // ignore: cast_nullable_to_non_nullable
              as double,
      gustMph: freezed == gustMph
          ? _value.gustMph
          : gustMph // ignore: cast_nullable_to_non_nullable
              as double?,
      gustKph: freezed == gustKph
          ? _value.gustKph
          : gustKph // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $WeatherCurrentConditionRemoteDTOCopyWith<$Res> get condition {
    return $WeatherCurrentConditionRemoteDTOCopyWith<$Res>(_value.condition,
        (value) {
      return _then(_value.copyWith(condition: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_WeatherHourRemoteDTOCopyWith<$Res>
    implements $WeatherHourRemoteDTOCopyWith<$Res> {
  factory _$$_WeatherHourRemoteDTOCopyWith(_$_WeatherHourRemoteDTO value,
          $Res Function(_$_WeatherHourRemoteDTO) then) =
      __$$_WeatherHourRemoteDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String time,
      @JsonKey(name: 'time_epoch') int timeEpoch,
      @JsonKey(name: 'temp_c') double tempC,
      @JsonKey(name: 'temp_f') double tempF,
      @JsonKey(name: 'is_day') int isDay,
      WeatherCurrentConditionRemoteDTO condition,
      @JsonKey(name: 'wind_mph') double windMph,
      @JsonKey(name: 'wind_kph') double windKph,
      @JsonKey(name: 'wind_degree') int windDegree,
      @JsonKey(name: 'wind_dir') String windDir,
      @JsonKey(name: 'pressure_mb') double pressureMb,
      @JsonKey(name: 'pressure_in') double pressureIn,
      @JsonKey(name: 'precip_mm') double precipMm,
      @JsonKey(name: 'precip_in') double precipIn,
      int humidity,
      int cloud,
      @JsonKey(name: 'feelslike_c') double feelsLikeC,
      @JsonKey(name: 'feelslike_f') double feelsLikeF,
      @JsonKey(name: 'windchill_c') double windChillC,
      @JsonKey(name: 'windchill_f') double windChillF,
      @JsonKey(name: 'heatindex_c') double heatIndexC,
      @JsonKey(name: 'heatindex_f') double heatIndexF,
      @JsonKey(name: 'dewpoint_c') double dewPointC,
      @JsonKey(name: 'dewpoint_f') double dewPointF,
      @JsonKey(name: 'will_it_rain') int willItRain,
      @JsonKey(name: 'chance_of_rain') double chanceOfRain,
      @JsonKey(name: 'will_it_snow') int willItSnow,
      @JsonKey(name: 'chance_of_snow') double chanceOfSnow,
      @JsonKey(name: 'vis_km') double visKm,
      @JsonKey(name: 'vis_miles') double visMiles,
      double? gustMph,
      double? gustKph});

  @override
  $WeatherCurrentConditionRemoteDTOCopyWith<$Res> get condition;
}

/// @nodoc
class __$$_WeatherHourRemoteDTOCopyWithImpl<$Res>
    extends _$WeatherHourRemoteDTOCopyWithImpl<$Res, _$_WeatherHourRemoteDTO>
    implements _$$_WeatherHourRemoteDTOCopyWith<$Res> {
  __$$_WeatherHourRemoteDTOCopyWithImpl(_$_WeatherHourRemoteDTO _value,
      $Res Function(_$_WeatherHourRemoteDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = null,
    Object? timeEpoch = null,
    Object? tempC = null,
    Object? tempF = null,
    Object? isDay = null,
    Object? condition = null,
    Object? windMph = null,
    Object? windKph = null,
    Object? windDegree = null,
    Object? windDir = null,
    Object? pressureMb = null,
    Object? pressureIn = null,
    Object? precipMm = null,
    Object? precipIn = null,
    Object? humidity = null,
    Object? cloud = null,
    Object? feelsLikeC = null,
    Object? feelsLikeF = null,
    Object? windChillC = null,
    Object? windChillF = null,
    Object? heatIndexC = null,
    Object? heatIndexF = null,
    Object? dewPointC = null,
    Object? dewPointF = null,
    Object? willItRain = null,
    Object? chanceOfRain = null,
    Object? willItSnow = null,
    Object? chanceOfSnow = null,
    Object? visKm = null,
    Object? visMiles = null,
    Object? gustMph = freezed,
    Object? gustKph = freezed,
  }) {
    return _then(_$_WeatherHourRemoteDTO(
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
      timeEpoch: null == timeEpoch
          ? _value.timeEpoch
          : timeEpoch // ignore: cast_nullable_to_non_nullable
              as int,
      tempC: null == tempC
          ? _value.tempC
          : tempC // ignore: cast_nullable_to_non_nullable
              as double,
      tempF: null == tempF
          ? _value.tempF
          : tempF // ignore: cast_nullable_to_non_nullable
              as double,
      isDay: null == isDay
          ? _value.isDay
          : isDay // ignore: cast_nullable_to_non_nullable
              as int,
      condition: null == condition
          ? _value.condition
          : condition // ignore: cast_nullable_to_non_nullable
              as WeatherCurrentConditionRemoteDTO,
      windMph: null == windMph
          ? _value.windMph
          : windMph // ignore: cast_nullable_to_non_nullable
              as double,
      windKph: null == windKph
          ? _value.windKph
          : windKph // ignore: cast_nullable_to_non_nullable
              as double,
      windDegree: null == windDegree
          ? _value.windDegree
          : windDegree // ignore: cast_nullable_to_non_nullable
              as int,
      windDir: null == windDir
          ? _value.windDir
          : windDir // ignore: cast_nullable_to_non_nullable
              as String,
      pressureMb: null == pressureMb
          ? _value.pressureMb
          : pressureMb // ignore: cast_nullable_to_non_nullable
              as double,
      pressureIn: null == pressureIn
          ? _value.pressureIn
          : pressureIn // ignore: cast_nullable_to_non_nullable
              as double,
      precipMm: null == precipMm
          ? _value.precipMm
          : precipMm // ignore: cast_nullable_to_non_nullable
              as double,
      precipIn: null == precipIn
          ? _value.precipIn
          : precipIn // ignore: cast_nullable_to_non_nullable
              as double,
      humidity: null == humidity
          ? _value.humidity
          : humidity // ignore: cast_nullable_to_non_nullable
              as int,
      cloud: null == cloud
          ? _value.cloud
          : cloud // ignore: cast_nullable_to_non_nullable
              as int,
      feelsLikeC: null == feelsLikeC
          ? _value.feelsLikeC
          : feelsLikeC // ignore: cast_nullable_to_non_nullable
              as double,
      feelsLikeF: null == feelsLikeF
          ? _value.feelsLikeF
          : feelsLikeF // ignore: cast_nullable_to_non_nullable
              as double,
      windChillC: null == windChillC
          ? _value.windChillC
          : windChillC // ignore: cast_nullable_to_non_nullable
              as double,
      windChillF: null == windChillF
          ? _value.windChillF
          : windChillF // ignore: cast_nullable_to_non_nullable
              as double,
      heatIndexC: null == heatIndexC
          ? _value.heatIndexC
          : heatIndexC // ignore: cast_nullable_to_non_nullable
              as double,
      heatIndexF: null == heatIndexF
          ? _value.heatIndexF
          : heatIndexF // ignore: cast_nullable_to_non_nullable
              as double,
      dewPointC: null == dewPointC
          ? _value.dewPointC
          : dewPointC // ignore: cast_nullable_to_non_nullable
              as double,
      dewPointF: null == dewPointF
          ? _value.dewPointF
          : dewPointF // ignore: cast_nullable_to_non_nullable
              as double,
      willItRain: null == willItRain
          ? _value.willItRain
          : willItRain // ignore: cast_nullable_to_non_nullable
              as int,
      chanceOfRain: null == chanceOfRain
          ? _value.chanceOfRain
          : chanceOfRain // ignore: cast_nullable_to_non_nullable
              as double,
      willItSnow: null == willItSnow
          ? _value.willItSnow
          : willItSnow // ignore: cast_nullable_to_non_nullable
              as int,
      chanceOfSnow: null == chanceOfSnow
          ? _value.chanceOfSnow
          : chanceOfSnow // ignore: cast_nullable_to_non_nullable
              as double,
      visKm: null == visKm
          ? _value.visKm
          : visKm // ignore: cast_nullable_to_non_nullable
              as double,
      visMiles: null == visMiles
          ? _value.visMiles
          : visMiles // ignore: cast_nullable_to_non_nullable
              as double,
      gustMph: freezed == gustMph
          ? _value.gustMph
          : gustMph // ignore: cast_nullable_to_non_nullable
              as double?,
      gustKph: freezed == gustKph
          ? _value.gustKph
          : gustKph // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_WeatherHourRemoteDTO implements _WeatherHourRemoteDTO {
  const _$_WeatherHourRemoteDTO(
      {required this.time,
      @JsonKey(name: 'time_epoch') required this.timeEpoch,
      @JsonKey(name: 'temp_c') required this.tempC,
      @JsonKey(name: 'temp_f') required this.tempF,
      @JsonKey(name: 'is_day') required this.isDay,
      required this.condition,
      @JsonKey(name: 'wind_mph') required this.windMph,
      @JsonKey(name: 'wind_kph') required this.windKph,
      @JsonKey(name: 'wind_degree') required this.windDegree,
      @JsonKey(name: 'wind_dir') required this.windDir,
      @JsonKey(name: 'pressure_mb') required this.pressureMb,
      @JsonKey(name: 'pressure_in') required this.pressureIn,
      @JsonKey(name: 'precip_mm') required this.precipMm,
      @JsonKey(name: 'precip_in') required this.precipIn,
      required this.humidity,
      required this.cloud,
      @JsonKey(name: 'feelslike_c') required this.feelsLikeC,
      @JsonKey(name: 'feelslike_f') required this.feelsLikeF,
      @JsonKey(name: 'windchill_c') required this.windChillC,
      @JsonKey(name: 'windchill_f') required this.windChillF,
      @JsonKey(name: 'heatindex_c') required this.heatIndexC,
      @JsonKey(name: 'heatindex_f') required this.heatIndexF,
      @JsonKey(name: 'dewpoint_c') required this.dewPointC,
      @JsonKey(name: 'dewpoint_f') required this.dewPointF,
      @JsonKey(name: 'will_it_rain') required this.willItRain,
      @JsonKey(name: 'chance_of_rain') required this.chanceOfRain,
      @JsonKey(name: 'will_it_snow') required this.willItSnow,
      @JsonKey(name: 'chance_of_snow') required this.chanceOfSnow,
      @JsonKey(name: 'vis_km') required this.visKm,
      @JsonKey(name: 'vis_miles') required this.visMiles,
      required this.gustMph,
      required this.gustKph});

  factory _$_WeatherHourRemoteDTO.fromJson(Map<String, dynamic> json) =>
      _$$_WeatherHourRemoteDTOFromJson(json);

  @override
  final String time;
  @override
  @JsonKey(name: 'time_epoch')
  final int timeEpoch;
  @override
  @JsonKey(name: 'temp_c')
  final double tempC;
  @override
  @JsonKey(name: 'temp_f')
  final double tempF;
  @override
  @JsonKey(name: 'is_day')
  final int isDay;
  @override
  final WeatherCurrentConditionRemoteDTO condition;
  @override
  @JsonKey(name: 'wind_mph')
  final double windMph;
  @override
  @JsonKey(name: 'wind_kph')
  final double windKph;
  @override
  @JsonKey(name: 'wind_degree')
  final int windDegree;
  @override
  @JsonKey(name: 'wind_dir')
  final String windDir;
  @override
  @JsonKey(name: 'pressure_mb')
  final double pressureMb;
  @override
  @JsonKey(name: 'pressure_in')
  final double pressureIn;
  @override
  @JsonKey(name: 'precip_mm')
  final double precipMm;
  @override
  @JsonKey(name: 'precip_in')
  final double precipIn;
  @override
  final int humidity;
  @override
  final int cloud;
  @override
  @JsonKey(name: 'feelslike_c')
  final double feelsLikeC;
  @override
  @JsonKey(name: 'feelslike_f')
  final double feelsLikeF;
  @override
  @JsonKey(name: 'windchill_c')
  final double windChillC;
  @override
  @JsonKey(name: 'windchill_f')
  final double windChillF;
  @override
  @JsonKey(name: 'heatindex_c')
  final double heatIndexC;
  @override
  @JsonKey(name: 'heatindex_f')
  final double heatIndexF;
  @override
  @JsonKey(name: 'dewpoint_c')
  final double dewPointC;
  @override
  @JsonKey(name: 'dewpoint_f')
  final double dewPointF;
  @override
  @JsonKey(name: 'will_it_rain')
  final int willItRain;
  @override
  @JsonKey(name: 'chance_of_rain')
  final double chanceOfRain;
  @override
  @JsonKey(name: 'will_it_snow')
  final int willItSnow;
  @override
  @JsonKey(name: 'chance_of_snow')
  final double chanceOfSnow;
  @override
  @JsonKey(name: 'vis_km')
  final double visKm;
  @override
  @JsonKey(name: 'vis_miles')
  final double visMiles;
  @override
  final double? gustMph;
  @override
  final double? gustKph;

  @override
  String toString() {
    return 'WeatherHourRemoteDTO(time: $time, timeEpoch: $timeEpoch, tempC: $tempC, tempF: $tempF, isDay: $isDay, condition: $condition, windMph: $windMph, windKph: $windKph, windDegree: $windDegree, windDir: $windDir, pressureMb: $pressureMb, pressureIn: $pressureIn, precipMm: $precipMm, precipIn: $precipIn, humidity: $humidity, cloud: $cloud, feelsLikeC: $feelsLikeC, feelsLikeF: $feelsLikeF, windChillC: $windChillC, windChillF: $windChillF, heatIndexC: $heatIndexC, heatIndexF: $heatIndexF, dewPointC: $dewPointC, dewPointF: $dewPointF, willItRain: $willItRain, chanceOfRain: $chanceOfRain, willItSnow: $willItSnow, chanceOfSnow: $chanceOfSnow, visKm: $visKm, visMiles: $visMiles, gustMph: $gustMph, gustKph: $gustKph)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WeatherHourRemoteDTO &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.timeEpoch, timeEpoch) ||
                other.timeEpoch == timeEpoch) &&
            (identical(other.tempC, tempC) || other.tempC == tempC) &&
            (identical(other.tempF, tempF) || other.tempF == tempF) &&
            (identical(other.isDay, isDay) || other.isDay == isDay) &&
            (identical(other.condition, condition) ||
                other.condition == condition) &&
            (identical(other.windMph, windMph) || other.windMph == windMph) &&
            (identical(other.windKph, windKph) || other.windKph == windKph) &&
            (identical(other.windDegree, windDegree) ||
                other.windDegree == windDegree) &&
            (identical(other.windDir, windDir) || other.windDir == windDir) &&
            (identical(other.pressureMb, pressureMb) ||
                other.pressureMb == pressureMb) &&
            (identical(other.pressureIn, pressureIn) ||
                other.pressureIn == pressureIn) &&
            (identical(other.precipMm, precipMm) ||
                other.precipMm == precipMm) &&
            (identical(other.precipIn, precipIn) ||
                other.precipIn == precipIn) &&
            (identical(other.humidity, humidity) ||
                other.humidity == humidity) &&
            (identical(other.cloud, cloud) || other.cloud == cloud) &&
            (identical(other.feelsLikeC, feelsLikeC) ||
                other.feelsLikeC == feelsLikeC) &&
            (identical(other.feelsLikeF, feelsLikeF) ||
                other.feelsLikeF == feelsLikeF) &&
            (identical(other.windChillC, windChillC) ||
                other.windChillC == windChillC) &&
            (identical(other.windChillF, windChillF) ||
                other.windChillF == windChillF) &&
            (identical(other.heatIndexC, heatIndexC) ||
                other.heatIndexC == heatIndexC) &&
            (identical(other.heatIndexF, heatIndexF) ||
                other.heatIndexF == heatIndexF) &&
            (identical(other.dewPointC, dewPointC) ||
                other.dewPointC == dewPointC) &&
            (identical(other.dewPointF, dewPointF) ||
                other.dewPointF == dewPointF) &&
            (identical(other.willItRain, willItRain) ||
                other.willItRain == willItRain) &&
            (identical(other.chanceOfRain, chanceOfRain) ||
                other.chanceOfRain == chanceOfRain) &&
            (identical(other.willItSnow, willItSnow) ||
                other.willItSnow == willItSnow) &&
            (identical(other.chanceOfSnow, chanceOfSnow) ||
                other.chanceOfSnow == chanceOfSnow) &&
            (identical(other.visKm, visKm) || other.visKm == visKm) &&
            (identical(other.visMiles, visMiles) ||
                other.visMiles == visMiles) &&
            (identical(other.gustMph, gustMph) || other.gustMph == gustMph) &&
            (identical(other.gustKph, gustKph) || other.gustKph == gustKph));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        time,
        timeEpoch,
        tempC,
        tempF,
        isDay,
        condition,
        windMph,
        windKph,
        windDegree,
        windDir,
        pressureMb,
        pressureIn,
        precipMm,
        precipIn,
        humidity,
        cloud,
        feelsLikeC,
        feelsLikeF,
        windChillC,
        windChillF,
        heatIndexC,
        heatIndexF,
        dewPointC,
        dewPointF,
        willItRain,
        chanceOfRain,
        willItSnow,
        chanceOfSnow,
        visKm,
        visMiles,
        gustMph,
        gustKph
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WeatherHourRemoteDTOCopyWith<_$_WeatherHourRemoteDTO> get copyWith =>
      __$$_WeatherHourRemoteDTOCopyWithImpl<_$_WeatherHourRemoteDTO>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WeatherHourRemoteDTOToJson(
      this,
    );
  }
}

abstract class _WeatherHourRemoteDTO implements WeatherHourRemoteDTO {
  const factory _WeatherHourRemoteDTO(
      {required final String time,
      @JsonKey(name: 'time_epoch') required final int timeEpoch,
      @JsonKey(name: 'temp_c') required final double tempC,
      @JsonKey(name: 'temp_f') required final double tempF,
      @JsonKey(name: 'is_day') required final int isDay,
      required final WeatherCurrentConditionRemoteDTO condition,
      @JsonKey(name: 'wind_mph') required final double windMph,
      @JsonKey(name: 'wind_kph') required final double windKph,
      @JsonKey(name: 'wind_degree') required final int windDegree,
      @JsonKey(name: 'wind_dir') required final String windDir,
      @JsonKey(name: 'pressure_mb') required final double pressureMb,
      @JsonKey(name: 'pressure_in') required final double pressureIn,
      @JsonKey(name: 'precip_mm') required final double precipMm,
      @JsonKey(name: 'precip_in') required final double precipIn,
      required final int humidity,
      required final int cloud,
      @JsonKey(name: 'feelslike_c') required final double feelsLikeC,
      @JsonKey(name: 'feelslike_f') required final double feelsLikeF,
      @JsonKey(name: 'windchill_c') required final double windChillC,
      @JsonKey(name: 'windchill_f') required final double windChillF,
      @JsonKey(name: 'heatindex_c') required final double heatIndexC,
      @JsonKey(name: 'heatindex_f') required final double heatIndexF,
      @JsonKey(name: 'dewpoint_c') required final double dewPointC,
      @JsonKey(name: 'dewpoint_f') required final double dewPointF,
      @JsonKey(name: 'will_it_rain') required final int willItRain,
      @JsonKey(name: 'chance_of_rain') required final double chanceOfRain,
      @JsonKey(name: 'will_it_snow') required final int willItSnow,
      @JsonKey(name: 'chance_of_snow') required final double chanceOfSnow,
      @JsonKey(name: 'vis_km') required final double visKm,
      @JsonKey(name: 'vis_miles') required final double visMiles,
      required final double? gustMph,
      required final double? gustKph}) = _$_WeatherHourRemoteDTO;

  factory _WeatherHourRemoteDTO.fromJson(Map<String, dynamic> json) =
      _$_WeatherHourRemoteDTO.fromJson;

  @override
  String get time;
  @override
  @JsonKey(name: 'time_epoch')
  int get timeEpoch;
  @override
  @JsonKey(name: 'temp_c')
  double get tempC;
  @override
  @JsonKey(name: 'temp_f')
  double get tempF;
  @override
  @JsonKey(name: 'is_day')
  int get isDay;
  @override
  WeatherCurrentConditionRemoteDTO get condition;
  @override
  @JsonKey(name: 'wind_mph')
  double get windMph;
  @override
  @JsonKey(name: 'wind_kph')
  double get windKph;
  @override
  @JsonKey(name: 'wind_degree')
  int get windDegree;
  @override
  @JsonKey(name: 'wind_dir')
  String get windDir;
  @override
  @JsonKey(name: 'pressure_mb')
  double get pressureMb;
  @override
  @JsonKey(name: 'pressure_in')
  double get pressureIn;
  @override
  @JsonKey(name: 'precip_mm')
  double get precipMm;
  @override
  @JsonKey(name: 'precip_in')
  double get precipIn;
  @override
  int get humidity;
  @override
  int get cloud;
  @override
  @JsonKey(name: 'feelslike_c')
  double get feelsLikeC;
  @override
  @JsonKey(name: 'feelslike_f')
  double get feelsLikeF;
  @override
  @JsonKey(name: 'windchill_c')
  double get windChillC;
  @override
  @JsonKey(name: 'windchill_f')
  double get windChillF;
  @override
  @JsonKey(name: 'heatindex_c')
  double get heatIndexC;
  @override
  @JsonKey(name: 'heatindex_f')
  double get heatIndexF;
  @override
  @JsonKey(name: 'dewpoint_c')
  double get dewPointC;
  @override
  @JsonKey(name: 'dewpoint_f')
  double get dewPointF;
  @override
  @JsonKey(name: 'will_it_rain')
  int get willItRain;
  @override
  @JsonKey(name: 'chance_of_rain')
  double get chanceOfRain;
  @override
  @JsonKey(name: 'will_it_snow')
  int get willItSnow;
  @override
  @JsonKey(name: 'chance_of_snow')
  double get chanceOfSnow;
  @override
  @JsonKey(name: 'vis_km')
  double get visKm;
  @override
  @JsonKey(name: 'vis_miles')
  double get visMiles;
  @override
  double? get gustMph;
  @override
  double? get gustKph;
  @override
  @JsonKey(ignore: true)
  _$$_WeatherHourRemoteDTOCopyWith<_$_WeatherHourRemoteDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
