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

/// @nodoc
mixin _$MatchRemoteDTO {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get date => throw _privateConstructorUsedError;
  MatchRemoteLocationDTO get location => throw _privateConstructorUsedError;
  List<MatchParticipantRemoteDTO> get participants =>
      throw _privateConstructorUsedError; // required String? organizerId,
// required String? organizerNickname,
  MatchRemoteOrganizerDTO? get organizer => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MatchRemoteDTOCopyWith<MatchRemoteDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MatchRemoteDTOCopyWith<$Res> {
  factory $MatchRemoteDTOCopyWith(
          MatchRemoteDTO value, $Res Function(MatchRemoteDTO) then) =
      _$MatchRemoteDTOCopyWithImpl<$Res, MatchRemoteDTO>;
  @useResult
  $Res call(
      {String id,
      String name,
      int date,
      MatchRemoteLocationDTO location,
      List<MatchParticipantRemoteDTO> participants,
      MatchRemoteOrganizerDTO? organizer});
}

/// @nodoc
class _$MatchRemoteDTOCopyWithImpl<$Res, $Val extends MatchRemoteDTO>
    implements $MatchRemoteDTOCopyWith<$Res> {
  _$MatchRemoteDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? date = null,
    Object? location = null,
    Object? participants = null,
    Object? organizer = freezed,
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
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as int,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as MatchRemoteLocationDTO,
      participants: null == participants
          ? _value.participants
          : participants // ignore: cast_nullable_to_non_nullable
              as List<MatchParticipantRemoteDTO>,
      organizer: freezed == organizer
          ? _value.organizer
          : organizer // ignore: cast_nullable_to_non_nullable
              as MatchRemoteOrganizerDTO?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MatchRemoteDTOCopyWith<$Res>
    implements $MatchRemoteDTOCopyWith<$Res> {
  factory _$$_MatchRemoteDTOCopyWith(
          _$_MatchRemoteDTO value, $Res Function(_$_MatchRemoteDTO) then) =
      __$$_MatchRemoteDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      int date,
      MatchRemoteLocationDTO location,
      List<MatchParticipantRemoteDTO> participants,
      MatchRemoteOrganizerDTO? organizer});
}

/// @nodoc
class __$$_MatchRemoteDTOCopyWithImpl<$Res>
    extends _$MatchRemoteDTOCopyWithImpl<$Res, _$_MatchRemoteDTO>
    implements _$$_MatchRemoteDTOCopyWith<$Res> {
  __$$_MatchRemoteDTOCopyWithImpl(
      _$_MatchRemoteDTO _value, $Res Function(_$_MatchRemoteDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? date = null,
    Object? location = null,
    Object? participants = null,
    Object? organizer = freezed,
  }) {
    return _then(_$_MatchRemoteDTO(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as int,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as MatchRemoteLocationDTO,
      participants: null == participants
          ? _value._participants
          : participants // ignore: cast_nullable_to_non_nullable
              as List<MatchParticipantRemoteDTO>,
      organizer: freezed == organizer
          ? _value.organizer
          : organizer // ignore: cast_nullable_to_non_nullable
              as MatchRemoteOrganizerDTO?,
    ));
  }
}

/// @nodoc

class _$_MatchRemoteDTO implements _MatchRemoteDTO {
  const _$_MatchRemoteDTO(
      {required this.id,
      required this.name,
      required this.date,
      required this.location,
      required final List<MatchParticipantRemoteDTO> participants,
      required this.organizer})
      : _participants = participants;

  @override
  final String id;
  @override
  final String name;
  @override
  final int date;
  @override
  final MatchRemoteLocationDTO location;
  final List<MatchParticipantRemoteDTO> _participants;
  @override
  List<MatchParticipantRemoteDTO> get participants {
    if (_participants is EqualUnmodifiableListView) return _participants;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_participants);
  }

// required String? organizerId,
// required String? organizerNickname,
  @override
  final MatchRemoteOrganizerDTO? organizer;

  @override
  String toString() {
    return 'MatchRemoteDTO(id: $id, name: $name, date: $date, location: $location, participants: $participants, organizer: $organizer)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MatchRemoteDTO &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.location, location) ||
                other.location == location) &&
            const DeepCollectionEquality()
                .equals(other._participants, _participants) &&
            (identical(other.organizer, organizer) ||
                other.organizer == organizer));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name, date, location,
      const DeepCollectionEquality().hash(_participants), organizer);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MatchRemoteDTOCopyWith<_$_MatchRemoteDTO> get copyWith =>
      __$$_MatchRemoteDTOCopyWithImpl<_$_MatchRemoteDTO>(this, _$identity);
}

abstract class _MatchRemoteDTO implements MatchRemoteDTO {
  const factory _MatchRemoteDTO(
      {required final String id,
      required final String name,
      required final int date,
      required final MatchRemoteLocationDTO location,
      required final List<MatchParticipantRemoteDTO> participants,
      required final MatchRemoteOrganizerDTO? organizer}) = _$_MatchRemoteDTO;

  @override
  String get id;
  @override
  String get name;
  @override
  int get date;
  @override
  MatchRemoteLocationDTO get location;
  @override
  List<MatchParticipantRemoteDTO> get participants;
  @override // required String? organizerId,
// required String? organizerNickname,
  MatchRemoteOrganizerDTO? get organizer;
  @override
  @JsonKey(ignore: true)
  _$$_MatchRemoteDTOCopyWith<_$_MatchRemoteDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
