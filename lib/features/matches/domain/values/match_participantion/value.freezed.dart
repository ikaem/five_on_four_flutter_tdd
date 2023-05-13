// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'value.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MatchParticipationValue {
  String get playerId => throw _privateConstructorUsedError;
  String get nickname => throw _privateConstructorUsedError;
  MatchParticipantStatus get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MatchParticipationValueCopyWith<MatchParticipationValue> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MatchParticipationValueCopyWith<$Res> {
  factory $MatchParticipationValueCopyWith(MatchParticipationValue value,
          $Res Function(MatchParticipationValue) then) =
      _$MatchParticipationValueCopyWithImpl<$Res, MatchParticipationValue>;
  @useResult
  $Res call({String playerId, String nickname, MatchParticipantStatus status});
}

/// @nodoc
class _$MatchParticipationValueCopyWithImpl<$Res,
        $Val extends MatchParticipationValue>
    implements $MatchParticipationValueCopyWith<$Res> {
  _$MatchParticipationValueCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? playerId = null,
    Object? nickname = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      playerId: null == playerId
          ? _value.playerId
          : playerId // ignore: cast_nullable_to_non_nullable
              as String,
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as MatchParticipantStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MatchParticipationValueCopyWith<$Res>
    implements $MatchParticipationValueCopyWith<$Res> {
  factory _$$_MatchParticipationValueCopyWith(_$_MatchParticipationValue value,
          $Res Function(_$_MatchParticipationValue) then) =
      __$$_MatchParticipationValueCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String playerId, String nickname, MatchParticipantStatus status});
}

/// @nodoc
class __$$_MatchParticipationValueCopyWithImpl<$Res>
    extends _$MatchParticipationValueCopyWithImpl<$Res,
        _$_MatchParticipationValue>
    implements _$$_MatchParticipationValueCopyWith<$Res> {
  __$$_MatchParticipationValueCopyWithImpl(_$_MatchParticipationValue _value,
      $Res Function(_$_MatchParticipationValue) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? playerId = null,
    Object? nickname = null,
    Object? status = null,
  }) {
    return _then(_$_MatchParticipationValue(
      playerId: null == playerId
          ? _value.playerId
          : playerId // ignore: cast_nullable_to_non_nullable
              as String,
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as MatchParticipantStatus,
    ));
  }
}

/// @nodoc

class _$_MatchParticipationValue implements _MatchParticipationValue {
  const _$_MatchParticipationValue(
      {required this.playerId, required this.nickname, required this.status});

  @override
  final String playerId;
  @override
  final String nickname;
  @override
  final MatchParticipantStatus status;

  @override
  String toString() {
    return 'MatchParticipationValue(playerId: $playerId, nickname: $nickname, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MatchParticipationValue &&
            (identical(other.playerId, playerId) ||
                other.playerId == playerId) &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, playerId, nickname, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MatchParticipationValueCopyWith<_$_MatchParticipationValue>
      get copyWith =>
          __$$_MatchParticipationValueCopyWithImpl<_$_MatchParticipationValue>(
              this, _$identity);
}

abstract class _MatchParticipationValue implements MatchParticipationValue {
  const factory _MatchParticipationValue(
          {required final String playerId,
          required final String nickname,
          required final MatchParticipantStatus status}) =
      _$_MatchParticipationValue;

  @override
  String get playerId;
  @override
  String get nickname;
  @override
  MatchParticipantStatus get status;
  @override
  @JsonKey(ignore: true)
  _$$_MatchParticipationValueCopyWith<_$_MatchParticipationValue>
      get copyWith => throw _privateConstructorUsedError;
}
