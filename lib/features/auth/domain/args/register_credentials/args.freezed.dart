// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'args.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RegisterCredentialsArgs _$RegisterCredentialsArgsFromJson(
    Map<String, dynamic> json) {
  return _RegisterCredentialsArgs.fromJson(json);
}

/// @nodoc
mixin _$RegisterCredentialsArgs {
  String get nickname => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RegisterCredentialsArgsCopyWith<RegisterCredentialsArgs> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterCredentialsArgsCopyWith<$Res> {
  factory $RegisterCredentialsArgsCopyWith(RegisterCredentialsArgs value,
          $Res Function(RegisterCredentialsArgs) then) =
      _$RegisterCredentialsArgsCopyWithImpl<$Res, RegisterCredentialsArgs>;
  @useResult
  $Res call({String nickname, String email, String password});
}

/// @nodoc
class _$RegisterCredentialsArgsCopyWithImpl<$Res,
        $Val extends RegisterCredentialsArgs>
    implements $RegisterCredentialsArgsCopyWith<$Res> {
  _$RegisterCredentialsArgsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nickname = null,
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_value.copyWith(
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RegisterCredentialsArgsCopyWith<$Res>
    implements $RegisterCredentialsArgsCopyWith<$Res> {
  factory _$$_RegisterCredentialsArgsCopyWith(_$_RegisterCredentialsArgs value,
          $Res Function(_$_RegisterCredentialsArgs) then) =
      __$$_RegisterCredentialsArgsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String nickname, String email, String password});
}

/// @nodoc
class __$$_RegisterCredentialsArgsCopyWithImpl<$Res>
    extends _$RegisterCredentialsArgsCopyWithImpl<$Res,
        _$_RegisterCredentialsArgs>
    implements _$$_RegisterCredentialsArgsCopyWith<$Res> {
  __$$_RegisterCredentialsArgsCopyWithImpl(_$_RegisterCredentialsArgs _value,
      $Res Function(_$_RegisterCredentialsArgs) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nickname = null,
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_$_RegisterCredentialsArgs(
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RegisterCredentialsArgs implements _RegisterCredentialsArgs {
  const _$_RegisterCredentialsArgs(
      {required this.nickname, required this.email, required this.password});

  factory _$_RegisterCredentialsArgs.fromJson(Map<String, dynamic> json) =>
      _$$_RegisterCredentialsArgsFromJson(json);

  @override
  final String nickname;
  @override
  final String email;
  @override
  final String password;

  @override
  String toString() {
    return 'RegisterCredentialsArgs(nickname: $nickname, email: $email, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RegisterCredentialsArgs &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, nickname, email, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RegisterCredentialsArgsCopyWith<_$_RegisterCredentialsArgs>
      get copyWith =>
          __$$_RegisterCredentialsArgsCopyWithImpl<_$_RegisterCredentialsArgs>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RegisterCredentialsArgsToJson(
      this,
    );
  }
}

abstract class _RegisterCredentialsArgs implements RegisterCredentialsArgs {
  const factory _RegisterCredentialsArgs(
      {required final String nickname,
      required final String email,
      required final String password}) = _$_RegisterCredentialsArgs;

  factory _RegisterCredentialsArgs.fromJson(Map<String, dynamic> json) =
      _$_RegisterCredentialsArgs.fromJson;

  @override
  String get nickname;
  @override
  String get email;
  @override
  String get password;
  @override
  @JsonKey(ignore: true)
  _$$_RegisterCredentialsArgsCopyWith<_$_RegisterCredentialsArgs>
      get copyWith => throw _privateConstructorUsedError;
}
