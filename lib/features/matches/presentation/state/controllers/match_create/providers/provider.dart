import 'dart:async';

import 'package:five_on_four_flutter_tdd/features/core/utils/mixins/validation.dart';
import 'package:five_on_four_flutter_tdd/features/matches/application/services/matches/providers/provider.dart';
import 'package:five_on_four_flutter_tdd/features/matches/application/services/matches/service.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/values/match_participant_invitation/value.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/values/new_match/value.dart';
import 'package:five_on_four_flutter_tdd/features/matches/presentation/state/controllers/match_create/controller.dart';
import 'package:five_on_four_flutter_tdd/features/matches/utils/mixins/match_create_validation_mixin.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rxdart/rxdart.dart';

part "provider.g.dart";

@riverpod
class MatchCreateAppController extends _$MatchCreateAppController
    with ValidationMixin, MatchCreateValidationMixin
    implements MatchCreateController {
  late final MatchesService _matchesService = ref.read(matchesServiceProvider);

  @override
  Stream<String> get matchNameValidationStream =>
      _matchNameStream.transform(genericTextValidationTransformer);
  @override
  Stream<String> get locationNameValidationStream =>
      _locationNameStream.transform(genericTextValidationTransformer);
  @override
  Stream<String> get locationAddressValidationStream =>
      _locationAddressStream.transform(genericTextValidationTransformer);
  @override
  Stream<String> get locationCityValidationStream =>
      _locationCityStream.transform(genericTextValidationTransformer);
  @override
  Stream<String> get locationCountryValidationStream =>
      _locationCountryStream.transform(locationCountryValidationTransformer);
  @override
  Stream<DateTime?> get dateValidationStream =>
      _dateStream.transform(dateValidationTransformer);
  @override
  Stream<TimeOfDay?> get timeValidationStream =>
      _timeStream.transform(timeValidationTransformer);
  @override
  Stream<bool> get joinMatchValidationStream =>
      _joinMatchStream.transform(joinMatchValidationTransformer);

  // TODO there is no need to validate match participants
  @override
  Stream<List<MatchParticipantInvitationValue>>
      get participantInvitationsStream => _participantInvitationsStream;

  @override
  Stream<bool> get inputsValidationStream => Rx.combineLatest(
        [
          _matchNameStream,
          _locationNameStream,
          _locationAddressStream,
          _locationCityStream,
          _locationCountryStream,
          _dateStream,
          _timeStream,
        ],
        (values) {
          final String? matchName = _matchNameSubject.valueOrNull;
          final String? locationName = _locationNameSubject.valueOrNull;
          final String? locationAddress = _locationAddressSubject.valueOrNull;
          final String? locationCity = _locationCitySubject.valueOrNull;
          final String? locationCountry = _locationCountrySubject.valueOrNull;
          final DateTime? date = _dateSubject.valueOrNull;
          final TimeOfDay? time = _timeSubject.valueOrNull;

          final MatchCreateInputsValidationValue validationValue =
              validateInputs(
            matchNameValue: matchName,
            locationNameValue: locationName,
            locationAddressValue: locationAddress,
            locationCityValue: locationCity,
            locationCountryValue: locationCountry,
            dateValue: date,
            timeValue: time,
          );

          return validationValue.areInputsValid;
        },
      );

  @override
  void onAddParticipantInvitation(
    MatchParticipantInvitationValue invitation,
  ) {
    final List<MatchParticipantInvitationValue> currentInvitations =
        _participantInvitationsSubject.value;

    final bool isInvitationPresent = currentInvitations
        .any((element) => element.playerId == invitation.playerId);
    if (isInvitationPresent) return;

    final List<MatchParticipantInvitationValue> updatedInvitations = [
      ...currentInvitations,
      invitation,
    ];

    _participantInvitationsSink.add(updatedInvitations);
  }

  @override
  void onRemoveParticipantInvitation(
    MatchParticipantInvitationValue invitation,
  ) {
    final List<MatchParticipantInvitationValue> currentInvitations = [
      ..._participantInvitationsSubject.value
    ];
    currentInvitations
        .removeWhere((element) => element.playerId == invitation.playerId);

    _participantInvitationsSink.add(currentInvitations);
  }

  @override
  void onChangeMatchName(String value) {
    _matchNameSink.add(value);
  }

  @override
  void onLocationNameChange(String value) {
    _locationNameSink.add(value);
  }

  @override
  void onLocationAddressChange(String value) {
    _locationAddressSink.add(value);
  }

  @override
  void onLocationCityChange(String value) {
    _locationCitySink.add(value);
  }

  @override
  void onLocationCountryChange(String value) {
    _locationCountrySink.add(value);
  }

  @override
  void onDateChange(DateTime? value) {
    _dateSink.add(value);
  }

  @override
  void onTimeChange(TimeOfDay? value) {
    _timeSink.add(value);
  }

  @override
  void onJoinMatchChange(bool? value) {
    _joinMatchSink.add(value ?? false);
  }

  @override
  Future<void> onSubmit() async {
    final MatchCreateInputsValidationValue validationValue = validateInputs(
      matchNameValue: _matchNameSubject.valueOrNull,
      locationNameValue: _locationNameSubject.valueOrNull,
      locationAddressValue: _locationAddressSubject.valueOrNull,
      locationCityValue: _locationCitySubject.valueOrNull,
      locationCountryValue: _locationCountrySubject.valueOrNull,
      dateValue: _dateSubject.valueOrNull,
      timeValue: _timeSubject.valueOrNull,
    );

    if (!validationValue.areInputsValid) {
      _populateInvalidInputErrors(validationValue);
      return;
    }

    // TODO now we create match data

    final NewMatchValue matchData = NewMatchValue(
      matchName: _matchNameSubject.value,
      locationName: _locationNameSubject.value,
      locationAddress: _locationAddressSubject.value,
      locationCity: _locationCitySubject.value,
      locationCountry: _locationCountrySubject.value,
      date: _dateSubject.value!,
      time: _timeSubject.value!,
      isOrganizerJoined: _joinMatchSubject.value,
      invitedPlayers: _participantInvitationsSubject.value,
    );

    state = AsyncValue.loading();

    try {
      final String id = await _matchesService.createMatch(matchData);

      state = AsyncValue.data(id);
    } catch (e) {
      // avoid guard because cannot debug errors easily

      state = AsyncValue.error(e, StackTrace.current);
    }

    // TODO test
  }

  // TODO move this below
  void _populateInvalidInputErrors(
    MatchCreateInputsValidationValue validationValue,
  ) {
    // TODO not liking nested is here
    // TODO make helpers for this
    if (validationValue.matchNameError != null)
      _matchNameSink.addError(validationValue.matchNameError!);
    if (validationValue.locationNameError != null)
      _locationNameSink.addError(validationValue.locationNameError!);
    if (validationValue.locationAddressError != null)
      _locationAddressSink.addError(validationValue.locationAddressError!);
    if (validationValue.locationCityError != null)
      _locationCitySink.addError(validationValue.locationCityError!);
    if (validationValue.locationCountryError != null)
      _locationCountrySink.addError(validationValue.locationCountryError!);
    if (validationValue.dateError != null)
      _dateSink.addError(validationValue.dateError!);
    if (validationValue.timeError != null)
      _timeSink.addError(validationValue.timeError!);
  }

  @override
  AsyncValue<String> build() {
    // TODO note that this does not need to return actual value - but because of it, state value will always be nullable
    return AsyncValue.loading();
  }

  @override
  Future<void> dispose() async {
    await _matchNameSubject.close();
    await _locationNameSubject.close();
    await _locationAddressSubject.close();
    await _locationCitySubject.close();
    await _locationCountrySubject.close();
    await _dateSubject.close();
    await _timeSubject.close();
    await _joinMatchSubject.close();
  }

  // TODO this needs to get the match service - or match create service, i dont know anymore

// TODO might need seeded to kickoff the validation
  final BehaviorSubject<String> _matchNameSubject = BehaviorSubject();
  final BehaviorSubject<String> _locationNameSubject = BehaviorSubject();
  final BehaviorSubject<String> _locationAddressSubject = BehaviorSubject();
  final BehaviorSubject<String> _locationCitySubject = BehaviorSubject();
  final BehaviorSubject<String> _locationCountrySubject = BehaviorSubject();
  final BehaviorSubject<DateTime?> _dateSubject = BehaviorSubject();
  final BehaviorSubject<TimeOfDay?> _timeSubject = BehaviorSubject();
  final BehaviorSubject<bool> _joinMatchSubject = BehaviorSubject.seeded(false);

  // TODO test
  final BehaviorSubject<List<MatchParticipantInvitationValue>>
      _participantInvitationsSubject = BehaviorSubject.seeded(invitations);

  StreamSink<String> get _matchNameSink => _matchNameSubject.sink;
  StreamSink<String> get _locationNameSink => _locationNameSubject.sink;
  StreamSink<String> get _locationAddressSink => _locationAddressSubject.sink;
  StreamSink<String> get _locationCitySink => _locationCitySubject.sink;
  StreamSink<String> get _locationCountrySink => _locationCountrySubject.sink;
  StreamSink<DateTime?> get _dateSink => _dateSubject.sink;
  StreamSink<TimeOfDay?> get _timeSink => _timeSubject.sink;
  StreamSink<bool> get _joinMatchSink => _joinMatchSubject.sink;

  // TODO test
  StreamSink<List<MatchParticipantInvitationValue>>
      get _participantInvitationsSink => _participantInvitationsSubject.sink;

  Stream<String> get _matchNameStream => _matchNameSubject.distinct();
  Stream<String> get _locationNameStream => _locationNameSubject.distinct();
  Stream<String> get _locationAddressStream =>
      _locationAddressSubject.distinct();
  Stream<String> get _locationCityStream => _locationCitySubject.distinct();
  Stream<String> get _locationCountryStream =>
      _locationCountrySubject.distinct();
  Stream<DateTime?> get _dateStream => _dateSubject.distinct();
  Stream<TimeOfDay?> get _timeStream => _timeSubject.distinct();
  Stream<bool> get _joinMatchStream => _joinMatchSubject.distinct();

  // TODO test
  // TODO for distinct to work properly, we have to use freezed, or override equality operator for this
  Stream<List<MatchParticipantInvitationValue>>
      get _participantInvitationsStream =>
          _participantInvitationsSubject.distinct();
}

// TODO test  - remove this later
List<MatchParticipantInvitationValue> invitations = List.generate(
  5,
  (index) => MatchParticipantInvitationValue(
      playerId: (index + 1).toString(), nickname: "Nickname ${index + 1}"),
);
