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
mixin _$PlayerModel {
  String get id => throw _privateConstructorUsedError;
  String get nickname => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PlayerModelCopyWith<PlayerModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlayerModelCopyWith<$Res> {
  factory $PlayerModelCopyWith(
          PlayerModel value, $Res Function(PlayerModel) then) =
      _$PlayerModelCopyWithImpl<$Res, PlayerModel>;
  @useResult
  $Res call({String id, String nickname, String email});
}

/// @nodoc
class _$PlayerModelCopyWithImpl<$Res, $Val extends PlayerModel>
    implements $PlayerModelCopyWith<$Res> {
  _$PlayerModelCopyWithImpl(this._value, this._then);

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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PlayerModelCopyWith<$Res>
    implements $PlayerModelCopyWith<$Res> {
  factory _$$_PlayerModelCopyWith(
          _$_PlayerModel value, $Res Function(_$_PlayerModel) then) =
      __$$_PlayerModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String nickname, String email});
}

/// @nodoc
class __$$_PlayerModelCopyWithImpl<$Res>
    extends _$PlayerModelCopyWithImpl<$Res, _$_PlayerModel>
    implements _$$_PlayerModelCopyWith<$Res> {
  __$$_PlayerModelCopyWithImpl(
      _$_PlayerModel _value, $Res Function(_$_PlayerModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nickname = null,
    Object? email = null,
  }) {
    return _then(_$_PlayerModel(
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
    ));
  }
}

/// @nodoc

class _$_PlayerModel implements _PlayerModel {
  const _$_PlayerModel(
      {required this.id, required this.nickname, required this.email});

  @override
  final String id;
  @override
  final String nickname;
  @override
  final String email;

  @override
  String toString() {
    return 'PlayerModel(id: $id, nickname: $nickname, email: $email)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PlayerModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname) &&
            (identical(other.email, email) || other.email == email));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, nickname, email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PlayerModelCopyWith<_$_PlayerModel> get copyWith =>
      __$$_PlayerModelCopyWithImpl<_$_PlayerModel>(this, _$identity);
}

abstract class _PlayerModel implements PlayerModel {
  const factory _PlayerModel(
      {required final String id,
      required final String nickname,
      required final String email}) = _$_PlayerModel;

  @override
  String get id;
  @override
  String get nickname;
  @override
  String get email;
  @override
  @JsonKey(ignore: true)
  _$$_PlayerModelCopyWith<_$_PlayerModel> get copyWith =>
      throw _privateConstructorUsedError;
}
