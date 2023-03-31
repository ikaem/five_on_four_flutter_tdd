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

/// @nodoc
mixin _$MatchParticipantRemoteDTO {
  String get id => throw _privateConstructorUsedError;
  String get playerId => throw _privateConstructorUsedError;
  String get matchId => throw _privateConstructorUsedError;
  String get nickname => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  int get createdAt => throw _privateConstructorUsedError;
  int? get expiresAt => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MatchParticipantRemoteDTOCopyWith<MatchParticipantRemoteDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MatchParticipantRemoteDTOCopyWith<$Res> {
  factory $MatchParticipantRemoteDTOCopyWith(MatchParticipantRemoteDTO value,
          $Res Function(MatchParticipantRemoteDTO) then) =
      _$MatchParticipantRemoteDTOCopyWithImpl<$Res, MatchParticipantRemoteDTO>;
  @useResult
  $Res call(
      {String id,
      String playerId,
      String matchId,
      String nickname,
      String status,
      int createdAt,
      int? expiresAt});
}

/// @nodoc
class _$MatchParticipantRemoteDTOCopyWithImpl<$Res,
        $Val extends MatchParticipantRemoteDTO>
    implements $MatchParticipantRemoteDTOCopyWith<$Res> {
  _$MatchParticipantRemoteDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? playerId = null,
    Object? matchId = null,
    Object? nickname = null,
    Object? status = null,
    Object? createdAt = null,
    Object? expiresAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      playerId: null == playerId
          ? _value.playerId
          : playerId // ignore: cast_nullable_to_non_nullable
              as String,
      matchId: null == matchId
          ? _value.matchId
          : matchId // ignore: cast_nullable_to_non_nullable
              as String,
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int,
      expiresAt: freezed == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MatchParticipantRemoteDTOCopyWith<$Res>
    implements $MatchParticipantRemoteDTOCopyWith<$Res> {
  factory _$$_MatchParticipantRemoteDTOCopyWith(
          _$_MatchParticipantRemoteDTO value,
          $Res Function(_$_MatchParticipantRemoteDTO) then) =
      __$$_MatchParticipantRemoteDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String playerId,
      String matchId,
      String nickname,
      String status,
      int createdAt,
      int? expiresAt});
}

/// @nodoc
class __$$_MatchParticipantRemoteDTOCopyWithImpl<$Res>
    extends _$MatchParticipantRemoteDTOCopyWithImpl<$Res,
        _$_MatchParticipantRemoteDTO>
    implements _$$_MatchParticipantRemoteDTOCopyWith<$Res> {
  __$$_MatchParticipantRemoteDTOCopyWithImpl(
      _$_MatchParticipantRemoteDTO _value,
      $Res Function(_$_MatchParticipantRemoteDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? playerId = null,
    Object? matchId = null,
    Object? nickname = null,
    Object? status = null,
    Object? createdAt = null,
    Object? expiresAt = freezed,
  }) {
    return _then(_$_MatchParticipantRemoteDTO(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      playerId: null == playerId
          ? _value.playerId
          : playerId // ignore: cast_nullable_to_non_nullable
              as String,
      matchId: null == matchId
          ? _value.matchId
          : matchId // ignore: cast_nullable_to_non_nullable
              as String,
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int,
      expiresAt: freezed == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$_MatchParticipantRemoteDTO implements _MatchParticipantRemoteDTO {
  const _$_MatchParticipantRemoteDTO(
      {required this.id,
      required this.playerId,
      required this.matchId,
      required this.nickname,
      required this.status,
      required this.createdAt,
      required this.expiresAt});

  @override
  final String id;
  @override
  final String playerId;
  @override
  final String matchId;
  @override
  final String nickname;
  @override
  final String status;
  @override
  final int createdAt;
  @override
  final int? expiresAt;

  @override
  String toString() {
    return 'MatchParticipantRemoteDTO(id: $id, playerId: $playerId, matchId: $matchId, nickname: $nickname, status: $status, createdAt: $createdAt, expiresAt: $expiresAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MatchParticipantRemoteDTO &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.playerId, playerId) ||
                other.playerId == playerId) &&
            (identical(other.matchId, matchId) || other.matchId == matchId) &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, playerId, matchId, nickname,
      status, createdAt, expiresAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MatchParticipantRemoteDTOCopyWith<_$_MatchParticipantRemoteDTO>
      get copyWith => __$$_MatchParticipantRemoteDTOCopyWithImpl<
          _$_MatchParticipantRemoteDTO>(this, _$identity);
}

abstract class _MatchParticipantRemoteDTO implements MatchParticipantRemoteDTO {
  const factory _MatchParticipantRemoteDTO(
      {required final String id,
      required final String playerId,
      required final String matchId,
      required final String nickname,
      required final String status,
      required final int createdAt,
      required final int? expiresAt}) = _$_MatchParticipantRemoteDTO;

  @override
  String get id;
  @override
  String get playerId;
  @override
  String get matchId;
  @override
  String get nickname;
  @override
  String get status;
  @override
  int get createdAt;
  @override
  int? get expiresAt;
  @override
  @JsonKey(ignore: true)
  _$$_MatchParticipantRemoteDTOCopyWith<_$_MatchParticipantRemoteDTO>
      get copyWith => throw _privateConstructorUsedError;
}
