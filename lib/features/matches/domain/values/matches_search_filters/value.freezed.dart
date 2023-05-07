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
mixin _$MatchesSearchFiltersValue {
  String get searchTerm => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MatchesSearchFiltersValueCopyWith<MatchesSearchFiltersValue> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MatchesSearchFiltersValueCopyWith<$Res> {
  factory $MatchesSearchFiltersValueCopyWith(MatchesSearchFiltersValue value,
          $Res Function(MatchesSearchFiltersValue) then) =
      _$MatchesSearchFiltersValueCopyWithImpl<$Res, MatchesSearchFiltersValue>;
  @useResult
  $Res call({String searchTerm});
}

/// @nodoc
class _$MatchesSearchFiltersValueCopyWithImpl<$Res,
        $Val extends MatchesSearchFiltersValue>
    implements $MatchesSearchFiltersValueCopyWith<$Res> {
  _$MatchesSearchFiltersValueCopyWithImpl(this._value, this._then);

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
abstract class _$$_MatchesSearchFiltersValueCopyWith<$Res>
    implements $MatchesSearchFiltersValueCopyWith<$Res> {
  factory _$$_MatchesSearchFiltersValueCopyWith(
          _$_MatchesSearchFiltersValue value,
          $Res Function(_$_MatchesSearchFiltersValue) then) =
      __$$_MatchesSearchFiltersValueCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String searchTerm});
}

/// @nodoc
class __$$_MatchesSearchFiltersValueCopyWithImpl<$Res>
    extends _$MatchesSearchFiltersValueCopyWithImpl<$Res,
        _$_MatchesSearchFiltersValue>
    implements _$$_MatchesSearchFiltersValueCopyWith<$Res> {
  __$$_MatchesSearchFiltersValueCopyWithImpl(
      _$_MatchesSearchFiltersValue _value,
      $Res Function(_$_MatchesSearchFiltersValue) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchTerm = null,
  }) {
    return _then(_$_MatchesSearchFiltersValue(
      searchTerm: null == searchTerm
          ? _value.searchTerm
          : searchTerm // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_MatchesSearchFiltersValue implements _MatchesSearchFiltersValue {
  const _$_MatchesSearchFiltersValue({required this.searchTerm});

  @override
  final String searchTerm;

  @override
  String toString() {
    return 'MatchesSearchFiltersValue(searchTerm: $searchTerm)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MatchesSearchFiltersValue &&
            (identical(other.searchTerm, searchTerm) ||
                other.searchTerm == searchTerm));
  }

  @override
  int get hashCode => Object.hash(runtimeType, searchTerm);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MatchesSearchFiltersValueCopyWith<_$_MatchesSearchFiltersValue>
      get copyWith => __$$_MatchesSearchFiltersValueCopyWithImpl<
          _$_MatchesSearchFiltersValue>(this, _$identity);
}

abstract class _MatchesSearchFiltersValue implements MatchesSearchFiltersValue {
  const factory _MatchesSearchFiltersValue({required final String searchTerm}) =
      _$_MatchesSearchFiltersValue;

  @override
  String get searchTerm;
  @override
  @JsonKey(ignore: true)
  _$$_MatchesSearchFiltersValueCopyWith<_$_MatchesSearchFiltersValue>
      get copyWith => throw _privateConstructorUsedError;
}
