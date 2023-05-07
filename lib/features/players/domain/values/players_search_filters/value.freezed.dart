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
mixin _$PlayersSearchFiltersValue {
  String get searchTerm => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PlayersSearchFiltersValueCopyWith<PlayersSearchFiltersValue> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlayersSearchFiltersValueCopyWith<$Res> {
  factory $PlayersSearchFiltersValueCopyWith(PlayersSearchFiltersValue value,
          $Res Function(PlayersSearchFiltersValue) then) =
      _$PlayersSearchFiltersValueCopyWithImpl<$Res, PlayersSearchFiltersValue>;
  @useResult
  $Res call({String searchTerm});
}

/// @nodoc
class _$PlayersSearchFiltersValueCopyWithImpl<$Res,
        $Val extends PlayersSearchFiltersValue>
    implements $PlayersSearchFiltersValueCopyWith<$Res> {
  _$PlayersSearchFiltersValueCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchTerm = null,
  }) {
    return _then(_value.copyWith(
      searchTerm: null == searchTerm
          ? _value.searchTerm
          : searchTerm // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PlayersSearchFiltersValueCopyWith<$Res>
    implements $PlayersSearchFiltersValueCopyWith<$Res> {
  factory _$$_PlayersSearchFiltersValueCopyWith(
          _$_PlayersSearchFiltersValue value,
          $Res Function(_$_PlayersSearchFiltersValue) then) =
      __$$_PlayersSearchFiltersValueCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String searchTerm});
}

/// @nodoc
class __$$_PlayersSearchFiltersValueCopyWithImpl<$Res>
    extends _$PlayersSearchFiltersValueCopyWithImpl<$Res,
        _$_PlayersSearchFiltersValue>
    implements _$$_PlayersSearchFiltersValueCopyWith<$Res> {
  __$$_PlayersSearchFiltersValueCopyWithImpl(
      _$_PlayersSearchFiltersValue _value,
      $Res Function(_$_PlayersSearchFiltersValue) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchTerm = null,
  }) {
    return _then(_$_PlayersSearchFiltersValue(
      searchTerm: null == searchTerm
          ? _value.searchTerm
          : searchTerm // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_PlayersSearchFiltersValue implements _PlayersSearchFiltersValue {
  const _$_PlayersSearchFiltersValue({required this.searchTerm});

  @override
  final String searchTerm;

  @override
  String toString() {
    return 'PlayersSearchFiltersValue(searchTerm: $searchTerm)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PlayersSearchFiltersValue &&
            (identical(other.searchTerm, searchTerm) ||
                other.searchTerm == searchTerm));
  }

  @override
  int get hashCode => Object.hash(runtimeType, searchTerm);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PlayersSearchFiltersValueCopyWith<_$_PlayersSearchFiltersValue>
      get copyWith => __$$_PlayersSearchFiltersValueCopyWithImpl<
          _$_PlayersSearchFiltersValue>(this, _$identity);
}

abstract class _PlayersSearchFiltersValue implements PlayersSearchFiltersValue {
  const factory _PlayersSearchFiltersValue({required final String searchTerm}) =
      _$_PlayersSearchFiltersValue;

  @override
  String get searchTerm;
  @override
  @JsonKey(ignore: true)
  _$$_PlayersSearchFiltersValueCopyWith<_$_PlayersSearchFiltersValue>
      get copyWith => throw _privateConstructorUsedError;
}
