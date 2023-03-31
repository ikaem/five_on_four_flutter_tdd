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

AuthRemoteDTO _$AuthRemoteDTOFromJson(Map<String, dynamic> json) {
  return _AuthRemoteDTO.fromJson(json);
}

/// @nodoc
mixin _$AuthRemoteDTO {
  String get id => throw _privateConstructorUsedError;
  String get nickname => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  int get loggedInAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AuthRemoteDTOCopyWith<AuthRemoteDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthRemoteDTOCopyWith<$Res> {
  factory $AuthRemoteDTOCopyWith(
          AuthRemoteDTO value, $Res Function(AuthRemoteDTO) then) =
      _$AuthRemoteDTOCopyWithImpl<$Res, AuthRemoteDTO>;
  @useResult
  $Res call({String id, String nickname, String email, int loggedInAt});
}

/// @nodoc
class _$AuthRemoteDTOCopyWithImpl<$Res, $Val extends AuthRemoteDTO>
    implements $AuthRemoteDTOCopyWith<$Res> {
  _$AuthRemoteDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nickname = null,
    Object? email = null,
    Object? loggedInAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      loggedInAt: null == loggedInAt
          ? _value.loggedInAt
          : loggedInAt // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AuthRemoteDTOCopyWith<$Res>
    implements $AuthRemoteDTOCopyWith<$Res> {
  factory _$$_AuthRemoteDTOCopyWith(
          _$_AuthRemoteDTO value, $Res Function(_$_AuthRemoteDTO) then) =
      __$$_AuthRemoteDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String nickname, String email, int loggedInAt});
}

/// @nodoc
class __$$_AuthRemoteDTOCopyWithImpl<$Res>
    extends _$AuthRemoteDTOCopyWithImpl<$Res, _$_AuthRemoteDTO>
    implements _$$_AuthRemoteDTOCopyWith<$Res> {
  __$$_AuthRemoteDTOCopyWithImpl(
      _$_AuthRemoteDTO _value, $Res Function(_$_AuthRemoteDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nickname = null,
    Object? email = null,
    Object? loggedInAt = null,
  }) {
    return _then(_$_AuthRemoteDTO(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      loggedInAt: null == loggedInAt
          ? _value.loggedInAt
          : loggedInAt // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AuthRemoteDTO implements _AuthRemoteDTO {
  const _$_AuthRemoteDTO(
      {required this.id,
      required this.nickname,
      required this.email,
      required this.loggedInAt});

  factory _$_AuthRemoteDTO.fromJson(Map<String, dynamic> json) =>
      _$$_AuthRemoteDTOFromJson(json);

  @override
  final String id;
  @override
  final String nickname;
  @override
  final String email;
  @override
  final int loggedInAt;

  @override
  String toString() {
    return 'AuthRemoteDTO(id: $id, nickname: $nickname, email: $email, loggedInAt: $loggedInAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuthRemoteDTO &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.loggedInAt, loggedInAt) ||
                other.loggedInAt == loggedInAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, nickname, email, loggedInAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AuthRemoteDTOCopyWith<_$_AuthRemoteDTO> get copyWith =>
      __$$_AuthRemoteDTOCopyWithImpl<_$_AuthRemoteDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AuthRemoteDTOToJson(
      this,
    );
  }
}

abstract class _AuthRemoteDTO implements AuthRemoteDTO {
  const factory _AuthRemoteDTO(
      {required final String id,
      required final String nickname,
      required final String email,
      required final int loggedInAt}) = _$_AuthRemoteDTO;

  factory _AuthRemoteDTO.fromJson(Map<String, dynamic> json) =
      _$_AuthRemoteDTO.fromJson;

  @override
  String get id;
  @override
  String get nickname;
  @override
  String get email;
  @override
  int get loggedInAt;
  @override
  @JsonKey(ignore: true)
  _$$_AuthRemoteDTOCopyWith<_$_AuthRemoteDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
