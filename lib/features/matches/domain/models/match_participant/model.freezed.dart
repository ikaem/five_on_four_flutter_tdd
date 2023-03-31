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
mixin _$MatchParticipantModel {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get nickname => throw _privateConstructorUsedError;
  MatchParticipantStatus get status => throw _privateConstructorUsedError;
  int get createdAt => throw _privateConstructorUsedError;
  int? get invitationExpirationTime => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MatchParticipantModelCopyWith<MatchParticipantModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MatchParticipantModelCopyWith<$Res> {
  factory $MatchParticipantModelCopyWith(MatchParticipantModel value,
          $Res Function(MatchParticipantModel) then) =
      _$MatchParticipantModelCopyWithImpl<$Res, MatchParticipantModel>;
  @useResult
  $Res call(
      {String id,
      String userId,
      String nickname,
      MatchParticipantStatus status,
      int createdAt,
      int? invitationExpirationTime});
}

/// @nodoc
class _$MatchParticipantModelCopyWithImpl<$Res,
        $Val extends MatchParticipantModel>
    implements $MatchParticipantModelCopyWith<$Res> {
  _$MatchParticipantModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? nickname = null,
    Object? status = null,
    Object? createdAt = null,
    Object? invitationExpirationTime = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as MatchParticipantStatus,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int,
      invitationExpirationTime: freezed == invitationExpirationTime
          ? _value.invitationExpirationTime
          : invitationExpirationTime // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MatchParticipantModelCopyWith<$Res>
    implements $MatchParticipantModelCopyWith<$Res> {
  factory _$$_MatchParticipantModelCopyWith(_$_MatchParticipantModel value,
          $Res Function(_$_MatchParticipantModel) then) =
      __$$_MatchParticipantModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String userId,
      String nickname,
      MatchParticipantStatus status,
      int createdAt,
      int? invitationExpirationTime});
}

/// @nodoc
class __$$_MatchParticipantModelCopyWithImpl<$Res>
    extends _$MatchParticipantModelCopyWithImpl<$Res, _$_MatchParticipantModel>
    implements _$$_MatchParticipantModelCopyWith<$Res> {
  __$$_MatchParticipantModelCopyWithImpl(_$_MatchParticipantModel _value,
      $Res Function(_$_MatchParticipantModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? nickname = null,
    Object? status = null,
    Object? createdAt = null,
    Object? invitationExpirationTime = freezed,
  }) {
    return _then(_$_MatchParticipantModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as MatchParticipantStatus,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int,
      invitationExpirationTime: freezed == invitationExpirationTime
          ? _value.invitationExpirationTime
          : invitationExpirationTime // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$_MatchParticipantModel implements _MatchParticipantModel {
  const _$_MatchParticipantModel(
      {required this.id,
      required this.userId,
      required this.nickname,
      required this.status,
      required this.createdAt,
      required this.invitationExpirationTime});

  @override
  final String id;
  @override
  final String userId;
  @override
  final String nickname;
  @override
  final MatchParticipantStatus status;
  @override
  final int createdAt;
  @override
  final int? invitationExpirationTime;

  @override
  String toString() {
    return 'MatchParticipantModel(id: $id, userId: $userId, nickname: $nickname, status: $status, createdAt: $createdAt, invitationExpirationTime: $invitationExpirationTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MatchParticipantModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(
                    other.invitationExpirationTime, invitationExpirationTime) ||
                other.invitationExpirationTime == invitationExpirationTime));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, userId, nickname, status,
      createdAt, invitationExpirationTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MatchParticipantModelCopyWith<_$_MatchParticipantModel> get copyWith =>
      __$$_MatchParticipantModelCopyWithImpl<_$_MatchParticipantModel>(
          this, _$identity);
}

abstract class _MatchParticipantModel implements MatchParticipantModel {
  const factory _MatchParticipantModel(
      {required final String id,
      required final String userId,
      required final String nickname,
      required final MatchParticipantStatus status,
      required final int createdAt,
      required final int? invitationExpirationTime}) = _$_MatchParticipantModel;

  @override
  String get id;
  @override
  String get userId;
  @override
  String get nickname;
  @override
  MatchParticipantStatus get status;
  @override
  int get createdAt;
  @override
  int? get invitationExpirationTime;
  @override
  @JsonKey(ignore: true)
  _$$_MatchParticipantModelCopyWith<_$_MatchParticipantModel> get copyWith =>
      throw _privateConstructorUsedError;
}
