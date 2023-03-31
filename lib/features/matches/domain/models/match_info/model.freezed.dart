// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MatchInfoModel {
  MatchModel get match => throw _privateConstructorUsedError;
  WeatherModel get weather => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MatchInfoModelCopyWith<MatchInfoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MatchInfoModelCopyWith<$Res> {
  factory $MatchInfoModelCopyWith(
          MatchInfoModel value, $Res Function(MatchInfoModel) then) =
      _$MatchInfoModelCopyWithImpl<$Res, MatchInfoModel>;
  @useResult
  $Res call({MatchModel match, WeatherModel weather});

  $MatchModelCopyWith<$Res> get match;
  $WeatherModelCopyWith<$Res> get weather;
}

/// @nodoc
class _$MatchInfoModelCopyWithImpl<$Res, $Val extends MatchInfoModel>
    implements $MatchInfoModelCopyWith<$Res> {
  _$MatchInfoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? match = null,
    Object? weather = null,
  }) {
    return _then(_value.copyWith(
      match: null == match
          ? _value.match
          : match // ignore: cast_nullable_to_non_nullable
              as MatchModel,
      weather: null == weather
          ? _value.weather
          : weather // ignore: cast_nullable_to_non_nullable
              as WeatherModel,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MatchModelCopyWith<$Res> get match {
    return $MatchModelCopyWith<$Res>(_value.match, (value) {
      return _then(_value.copyWith(match: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $WeatherModelCopyWith<$Res> get weather {
    return $WeatherModelCopyWith<$Res>(_value.weather, (value) {
      return _then(_value.copyWith(weather: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_MatchInfoModelCopyWith<$Res>
    implements $MatchInfoModelCopyWith<$Res> {
  factory _$$_MatchInfoModelCopyWith(
          _$_MatchInfoModel value, $Res Function(_$_MatchInfoModel) then) =
      __$$_MatchInfoModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({MatchModel match, WeatherModel weather});

  @override
  $MatchModelCopyWith<$Res> get match;
  @override
  $WeatherModelCopyWith<$Res> get weather;
}

/// @nodoc
class __$$_MatchInfoModelCopyWithImpl<$Res>
    extends _$MatchInfoModelCopyWithImpl<$Res, _$_MatchInfoModel>
    implements _$$_MatchInfoModelCopyWith<$Res> {
  __$$_MatchInfoModelCopyWithImpl(
      _$_MatchInfoModel _value, $Res Function(_$_MatchInfoModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? match = null,
    Object? weather = null,
  }) {
    return _then(_$_MatchInfoModel(
      match: null == match
          ? _value.match
          : match // ignore: cast_nullable_to_non_nullable
              as MatchModel,
      weather: null == weather
          ? _value.weather
          : weather // ignore: cast_nullable_to_non_nullable
              as WeatherModel,
    ));
  }
}

/// @nodoc

class _$_MatchInfoModel implements _MatchInfoModel {
  const _$_MatchInfoModel({required this.match, required this.weather});

  @override
  final MatchModel match;
  @override
  final WeatherModel weather;

  @override
  String toString() {
    return 'MatchInfoModel(match: $match, weather: $weather)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MatchInfoModel &&
            (identical(other.match, match) || other.match == match) &&
            (identical(other.weather, weather) || other.weather == weather));
  }

  @override
  int get hashCode => Object.hash(runtimeType, match, weather);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MatchInfoModelCopyWith<_$_MatchInfoModel> get copyWith =>
      __$$_MatchInfoModelCopyWithImpl<_$_MatchInfoModel>(this, _$identity);
}

abstract class _MatchInfoModel implements MatchInfoModel {
  const factory _MatchInfoModel(
      {required final MatchModel match,
      required final WeatherModel weather}) = _$_MatchInfoModel;

  @override
  MatchModel get match;
  @override
  WeatherModel get weather;
  @override
  @JsonKey(ignore: true)
  _$$_MatchInfoModelCopyWith<_$_MatchInfoModel> get copyWith =>
      throw _privateConstructorUsedError;
}
