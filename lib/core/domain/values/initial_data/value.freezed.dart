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
mixin _$InitialDataValue {
  List<MatchModel>? get invitedMatches => throw _privateConstructorUsedError;
  List<MatchModel>? get joinedMatches => throw _privateConstructorUsedError;
  MatchInfoModel? get nextMatch => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $InitialDataValueCopyWith<InitialDataValue> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InitialDataValueCopyWith<$Res> {
  factory $InitialDataValueCopyWith(
          InitialDataValue value, $Res Function(InitialDataValue) then) =
      _$InitialDataValueCopyWithImpl<$Res, InitialDataValue>;
  @useResult
  $Res call(
      {List<MatchModel>? invitedMatches,
      List<MatchModel>? joinedMatches,
      MatchInfoModel? nextMatch});

  $MatchInfoModelCopyWith<$Res>? get nextMatch;
}

/// @nodoc
class _$InitialDataValueCopyWithImpl<$Res, $Val extends InitialDataValue>
    implements $InitialDataValueCopyWith<$Res> {
  _$InitialDataValueCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? invitedMatches = freezed,
    Object? joinedMatches = freezed,
    Object? nextMatch = freezed,
  }) {
    return _then(_value.copyWith(
      invitedMatches: freezed == invitedMatches
          ? _value.invitedMatches
          : invitedMatches // ignore: cast_nullable_to_non_nullable
              as List<MatchModel>?,
      joinedMatches: freezed == joinedMatches
          ? _value.joinedMatches
          : joinedMatches // ignore: cast_nullable_to_non_nullable
              as List<MatchModel>?,
      nextMatch: freezed == nextMatch
          ? _value.nextMatch
          : nextMatch // ignore: cast_nullable_to_non_nullable
              as MatchInfoModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MatchInfoModelCopyWith<$Res>? get nextMatch {
    if (_value.nextMatch == null) {
      return null;
    }

    return $MatchInfoModelCopyWith<$Res>(_value.nextMatch!, (value) {
      return _then(_value.copyWith(nextMatch: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_InitialDataValueCopyWith<$Res>
    implements $InitialDataValueCopyWith<$Res> {
  factory _$$_InitialDataValueCopyWith(
          _$_InitialDataValue value, $Res Function(_$_InitialDataValue) then) =
      __$$_InitialDataValueCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<MatchModel>? invitedMatches,
      List<MatchModel>? joinedMatches,
      MatchInfoModel? nextMatch});

  @override
  $MatchInfoModelCopyWith<$Res>? get nextMatch;
}

/// @nodoc
class __$$_InitialDataValueCopyWithImpl<$Res>
    extends _$InitialDataValueCopyWithImpl<$Res, _$_InitialDataValue>
    implements _$$_InitialDataValueCopyWith<$Res> {
  __$$_InitialDataValueCopyWithImpl(
      _$_InitialDataValue _value, $Res Function(_$_InitialDataValue) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? invitedMatches = freezed,
    Object? joinedMatches = freezed,
    Object? nextMatch = freezed,
  }) {
    return _then(_$_InitialDataValue(
      invitedMatches: freezed == invitedMatches
          ? _value._invitedMatches
          : invitedMatches // ignore: cast_nullable_to_non_nullable
              as List<MatchModel>?,
      joinedMatches: freezed == joinedMatches
          ? _value._joinedMatches
          : joinedMatches // ignore: cast_nullable_to_non_nullable
              as List<MatchModel>?,
      nextMatch: freezed == nextMatch
          ? _value.nextMatch
          : nextMatch // ignore: cast_nullable_to_non_nullable
              as MatchInfoModel?,
    ));
  }
}

/// @nodoc

class _$_InitialDataValue implements _InitialDataValue {
  const _$_InitialDataValue(
      {required final List<MatchModel>? invitedMatches,
      required final List<MatchModel>? joinedMatches,
      required this.nextMatch})
      : _invitedMatches = invitedMatches,
        _joinedMatches = joinedMatches;

  final List<MatchModel>? _invitedMatches;
  @override
  List<MatchModel>? get invitedMatches {
    final value = _invitedMatches;
    if (value == null) return null;
    if (_invitedMatches is EqualUnmodifiableListView) return _invitedMatches;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<MatchModel>? _joinedMatches;
  @override
  List<MatchModel>? get joinedMatches {
    final value = _joinedMatches;
    if (value == null) return null;
    if (_joinedMatches is EqualUnmodifiableListView) return _joinedMatches;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final MatchInfoModel? nextMatch;

  @override
  String toString() {
    return 'InitialDataValue(invitedMatches: $invitedMatches, joinedMatches: $joinedMatches, nextMatch: $nextMatch)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_InitialDataValue &&
            const DeepCollectionEquality()
                .equals(other._invitedMatches, _invitedMatches) &&
            const DeepCollectionEquality()
                .equals(other._joinedMatches, _joinedMatches) &&
            (identical(other.nextMatch, nextMatch) ||
                other.nextMatch == nextMatch));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_invitedMatches),
      const DeepCollectionEquality().hash(_joinedMatches),
      nextMatch);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InitialDataValueCopyWith<_$_InitialDataValue> get copyWith =>
      __$$_InitialDataValueCopyWithImpl<_$_InitialDataValue>(this, _$identity);
}

abstract class _InitialDataValue implements InitialDataValue {
  const factory _InitialDataValue(
      {required final List<MatchModel>? invitedMatches,
      required final List<MatchModel>? joinedMatches,
      required final MatchInfoModel? nextMatch}) = _$_InitialDataValue;

  @override
  List<MatchModel>? get invitedMatches;
  @override
  List<MatchModel>? get joinedMatches;
  @override
  MatchInfoModel? get nextMatch;
  @override
  @JsonKey(ignore: true)
  _$$_InitialDataValueCopyWith<_$_InitialDataValue> get copyWith =>
      throw _privateConstructorUsedError;
}
