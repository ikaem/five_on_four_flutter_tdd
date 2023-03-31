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
mixin _$AuthModel {
  PlayerModel get player => throw _privateConstructorUsedError;
  int get loggedInAt => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AuthModelCopyWith<AuthModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthModelCopyWith<$Res> {
  factory $AuthModelCopyWith(AuthModel value, $Res Function(AuthModel) then) =
      _$AuthModelCopyWithImpl<$Res, AuthModel>;
  @useResult
  $Res call({PlayerModel player, int loggedInAt});

  $PlayerModelCopyWith<$Res> get player;
}

/// @nodoc
class _$AuthModelCopyWithImpl<$Res, $Val extends AuthModel>
    implements $AuthModelCopyWith<$Res> {
  _$AuthModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? player = null,
    Object? loggedInAt = null,
  }) {
    return _then(_value.copyWith(
      player: null == player
          ? _value.player
          : player // ignore: cast_nullable_to_non_nullable
              as PlayerModel,
      loggedInAt: null == loggedInAt
          ? _value.loggedInAt
          : loggedInAt // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PlayerModelCopyWith<$Res> get player {
    return $PlayerModelCopyWith<$Res>(_value.player, (value) {
      return _then(_value.copyWith(player: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_AuthModelCopyWith<$Res> implements $AuthModelCopyWith<$Res> {
  factory _$$_AuthModelCopyWith(
          _$_AuthModel value, $Res Function(_$_AuthModel) then) =
      __$$_AuthModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({PlayerModel player, int loggedInAt});

  @override
  $PlayerModelCopyWith<$Res> get player;
}

/// @nodoc
class __$$_AuthModelCopyWithImpl<$Res>
    extends _$AuthModelCopyWithImpl<$Res, _$_AuthModel>
    implements _$$_AuthModelCopyWith<$Res> {
  __$$_AuthModelCopyWithImpl(
      _$_AuthModel _value, $Res Function(_$_AuthModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? player = null,
    Object? loggedInAt = null,
  }) {
    return _then(_$_AuthModel(
      player: null == player
          ? _value.player
          : player // ignore: cast_nullable_to_non_nullable
              as PlayerModel,
      loggedInAt: null == loggedInAt
          ? _value.loggedInAt
          : loggedInAt // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_AuthModel implements _AuthModel {
  const _$_AuthModel({required this.player, required this.loggedInAt});

  @override
  final PlayerModel player;
  @override
  final int loggedInAt;

  @override
  String toString() {
    return 'AuthModel(player: $player, loggedInAt: $loggedInAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuthModel &&
            (identical(other.player, player) || other.player == player) &&
            (identical(other.loggedInAt, loggedInAt) ||
                other.loggedInAt == loggedInAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, player, loggedInAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AuthModelCopyWith<_$_AuthModel> get copyWith =>
      __$$_AuthModelCopyWithImpl<_$_AuthModel>(this, _$identity);
}

abstract class _AuthModel implements AuthModel {
  const factory _AuthModel(
      {required final PlayerModel player,
      required final int loggedInAt}) = _$_AuthModel;

  @override
  PlayerModel get player;
  @override
  int get loggedInAt;
  @override
  @JsonKey(ignore: true)
  _$$_AuthModelCopyWith<_$_AuthModel> get copyWith =>
      throw _privateConstructorUsedError;
}
