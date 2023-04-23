import 'dart:async';
import 'dart:developer';

import 'package:five_on_four_flutter_tdd/features/core/utils/mixins/validation.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/values/match_participant_invitation/value.dart';
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
          // TODO not sure if i should access subject directly here
          final String matchName = _matchNameSubject.value;
          final String locationName = _locationNameSubject.value;
          final String locationAddress = _locationAddressSubject.value;
          final String locationCity = _locationCitySubject.value;
          final String locationCountry = _locationCountrySubject.value;
          final DateTime? date = _dateSubject.value;
          final TimeOfDay? time = _timeSubject.value;

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

  // @override
  // void onChangeParticipantInvitations(
  //     List<MatchParticipantInvitationValue> value) {
  //   _participantInvitationsSink.add(value);
  // }

  @override
  void onAddParticipantInvitation(
    MatchParticipantInvitationValue invitation,
  ) {
    final List<MatchParticipantInvitationValue> currentInvitations =
        _participantInvitationsSubject.value;

    final bool isInvitationPresent = currentInvitations
        .any((element) => element.playerId == invitation.playerId);
    if (isInvitationPresent) return;

    // currentInvitations.add(invitation);
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

    // TODO test something
    final me = "";
    //
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
    log("submitting...");
  }

  @override
  AsyncValue<void> build() {
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
}

// TODO test  - remove this later
List<MatchParticipantInvitationValue> invitations = List.generate(
  5,
  (index) => MatchParticipantInvitationValue(
      playerId: (index + 1).toString(), nickname: "Nickname ${index + 1}"),
);
