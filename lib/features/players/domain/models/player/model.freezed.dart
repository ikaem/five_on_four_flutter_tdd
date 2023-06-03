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
  PlayerPreferencesModel get preferences => throw _privateConstructorUsedError;

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
  $Res call(
      {String id,
      String nickname,
      String email,
      PlayerPreferencesModel preferences});

  $PlayerPreferencesModelCopyWith<$Res> get preferences;
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
    Object? preferences = null,
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
      preferences: null == preferences
          ? _value.preferences
          : preferences // ignore: cast_nullable_to_non_nullable
              as PlayerPreferencesModel,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PlayerPreferencesModelCopyWith<$Res> get preferences {
    return $PlayerPreferencesModelCopyWith<$Res>(_value.preferences, (value) {
      return _then(_value.copyWith(preferences: value) as $Val);
    });
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
  $Res call(
      {String id,
      String nickname,
      String email,
      PlayerPreferencesModel preferences});

  @override
  $PlayerPreferencesModelCopyWith<$Res> get preferences;
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
    Object? preferences = null,
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
      preferences: null == preferences
          ? _value.preferences
          : preferences // ignore: cast_nullable_to_non_nullable
              as PlayerPreferencesModel,
    ));
  }
}

/// @nodoc

class _$_PlayerModel implements _PlayerModel {
  const _$_PlayerModel(
      {required this.id,
      required this.nickname,
      required this.email,
      required this.preferences});

  @override
  final String id;
  @override
  final String nickname;
  @override
  final String email;
  @override
  final PlayerPreferencesModel preferences;

  @override
  String toString() {
    return 'PlayerModel(id: $id, nickname: $nickname, email: $email, preferences: $preferences)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PlayerModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.preferences, preferences) ||
                other.preferences == preferences));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, nickname, email, preferences);

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
      required final String email,
      required final PlayerPreferencesModel preferences}) = _$_PlayerModel;

  @override
  String get id;
  @override
  String get nickname;
  @override
  String get email;
  @override
  PlayerPreferencesModel get preferences;
  @override
  @JsonKey(ignore: true)
  _$$_PlayerModelCopyWith<_$_PlayerModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PlayerPreferencesModel {
  int? get regionSize => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PlayerPreferencesModelCopyWith<PlayerPreferencesModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlayerPreferencesModelCopyWith<$Res> {
  factory $PlayerPreferencesModelCopyWith(PlayerPreferencesModel value,
          $Res Function(PlayerPreferencesModel) then) =
      _$PlayerPreferencesModelCopyWithImpl<$Res, PlayerPreferencesModel>;
  @useResult
  $Res call({int? regionSize});
}

/// @nodoc
class _$PlayerPreferencesModelCopyWithImpl<$Res,
        $Val extends PlayerPreferencesModel>
    implements $PlayerPreferencesModelCopyWith<$Res> {
  _$PlayerPreferencesModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? regionSize = freezed,
  }) {
    return _then(_value.copyWith(
      regionSize: freezed == regionSize
          ? _value.regionSize
          : regionSize // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PlayerPreferencesModelCopyWith<$Res>
    implements $PlayerPreferencesModelCopyWith<$Res> {
  factory _$$_PlayerPreferencesModelCopyWith(_$_PlayerPreferencesModel value,
          $Res Function(_$_PlayerPreferencesModel) then) =
      __$$_PlayerPreferencesModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? regionSize});
}

/// @nodoc
class __$$_PlayerPreferencesModelCopyWithImpl<$Res>
    extends _$PlayerPreferencesModelCopyWithImpl<$Res,
        _$_PlayerPreferencesModel>
    implements _$$_PlayerPreferencesModelCopyWith<$Res> {
  __$$_PlayerPreferencesModelCopyWithImpl(_$_PlayerPreferencesModel _value,
      $Res Function(_$_PlayerPreferencesModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? regionSize = freezed,
  }) {
    return _then(_$_PlayerPreferencesModel(
      regionSize: freezed == regionSize
          ? _value.regionSize
          : regionSize // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$_PlayerPreferencesModel implements _PlayerPreferencesModel {
  const _$_PlayerPreferencesModel({required this.regionSize});

  @override
  final int? regionSize;

  @override
  String toString() {
    return 'PlayerPreferencesModel(regionSize: $regionSize)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PlayerPreferencesModel &&
            (identical(other.regionSize, regionSize) ||
                other.regionSize == regionSize));
  }

  @override
  int get hashCode => Object.hash(runtimeType, regionSize);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PlayerPreferencesModelCopyWith<_$_PlayerPreferencesModel> get copyWith =>
      __$$_PlayerPreferencesModelCopyWithImpl<_$_PlayerPreferencesModel>(
          this, _$identity);
}

abstract class _PlayerPreferencesModel implements PlayerPreferencesModel {
  const factory _PlayerPreferencesModel({required final int? regionSize}) =
      _$_PlayerPreferencesModel;

  @override
  int? get regionSize;
  @override
  @JsonKey(ignore: true)
  _$$_PlayerPreferencesModelCopyWith<_$_PlayerPreferencesModel> get copyWith =>
      throw _privateConstructorUsedError;
}
