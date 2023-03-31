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
mixin _$MatchModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  List<MatchParticipantModel> get joinedParticipants =>
      throw _privateConstructorUsedError;
  List<MatchParticipantModel> get invitedParticipants =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MatchModelCopyWith<MatchModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MatchModelCopyWith<$Res> {
  factory $MatchModelCopyWith(
          MatchModel value, $Res Function(MatchModel) then) =
      _$MatchModelCopyWithImpl<$Res, MatchModel>;
  @useResult
  $Res call(
      {String id,
      String name,
      List<MatchParticipantModel> joinedParticipants,
      List<MatchParticipantModel> invitedParticipants});
}

/// @nodoc
class _$MatchModelCopyWithImpl<$Res, $Val extends MatchModel>
    implements $MatchModelCopyWith<$Res> {
  _$MatchModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? joinedParticipants = null,
    Object? invitedParticipants = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      joinedParticipants: null == joinedParticipants
          ? _value.joinedParticipants
          : joinedParticipants // ignore: cast_nullable_to_non_nullable
              as List<MatchParticipantModel>,
      invitedParticipants: null == invitedParticipants
          ? _value.invitedParticipants
          : invitedParticipants // ignore: cast_nullable_to_non_nullable
              as List<MatchParticipantModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MatchModelCopyWith<$Res>
    implements $MatchModelCopyWith<$Res> {
  factory _$$_MatchModelCopyWith(
          _$_MatchModel value, $Res Function(_$_MatchModel) then) =
      __$$_MatchModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      List<MatchParticipantModel> joinedParticipants,
      List<MatchParticipantModel> invitedParticipants});
}

/// @nodoc
class __$$_MatchModelCopyWithImpl<$Res>
    extends _$MatchModelCopyWithImpl<$Res, _$_MatchModel>
    implements _$$_MatchModelCopyWith<$Res> {
  __$$_MatchModelCopyWithImpl(
      _$_MatchModel _value, $Res Function(_$_MatchModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? joinedParticipants = null,
    Object? invitedParticipants = null,
  }) {
    return _then(_$_MatchModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      joinedParticipants: null == joinedParticipants
          ? _value._joinedParticipants
          : joinedParticipants // ignore: cast_nullable_to_non_nullable
              as List<MatchParticipantModel>,
      invitedParticipants: null == invitedParticipants
          ? _value._invitedParticipants
          : invitedParticipants // ignore: cast_nullable_to_non_nullable
              as List<MatchParticipantModel>,
    ));
  }
}

/// @nodoc

class _$_MatchModel implements _MatchModel {
  const _$_MatchModel(
      {required this.id,
      required this.name,
      required final List<MatchParticipantModel> joinedParticipants,
      required final List<MatchParticipantModel> invitedParticipants})
      : _joinedParticipants = joinedParticipants,
        _invitedParticipants = invitedParticipants;

  @override
  final String id;
  @override
  final String name;
  final List<MatchParticipantModel> _joinedParticipants;
  @override
  List<MatchParticipantModel> get joinedParticipants {
    if (_joinedParticipants is EqualUnmodifiableListView)
      return _joinedParticipants;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_joinedParticipants);
  }

  final List<MatchParticipantModel> _invitedParticipants;
  @override
  List<MatchParticipantModel> get invitedParticipants {
    if (_invitedParticipants is EqualUnmodifiableListView)
      return _invitedParticipants;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_invitedParticipants);
  }

  @override
  String toString() {
    return 'MatchModel(id: $id, name: $name, joinedParticipants: $joinedParticipants, invitedParticipants: $invitedParticipants)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MatchModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality()
                .equals(other._joinedParticipants, _joinedParticipants) &&
            const DeepCollectionEquality()
                .equals(other._invitedParticipants, _invitedParticipants));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      const DeepCollectionEquality().hash(_joinedParticipants),
      const DeepCollectionEquality().hash(_invitedParticipants));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MatchModelCopyWith<_$_MatchModel> get copyWith =>
      __$$_MatchModelCopyWithImpl<_$_MatchModel>(this, _$identity);
}

abstract class _MatchModel implements MatchModel {
  const factory _MatchModel(
          {required final String id,
          required final String name,
          required final List<MatchParticipantModel> joinedParticipants,
          required final List<MatchParticipantModel> invitedParticipants}) =
      _$_MatchModel;

  @override
  String get id;
  @override
  String get name;
  @override
  List<MatchParticipantModel> get joinedParticipants;
  @override
  List<MatchParticipantModel> get invitedParticipants;
  @override
  @JsonKey(ignore: true)
  _$$_MatchModelCopyWith<_$_MatchModel> get copyWith =>
      throw _privateConstructorUsedError;
}
