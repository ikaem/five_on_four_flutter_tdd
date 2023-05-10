import 'package:five_on_four_flutter_tdd/features/matches/domain/values/match_participantion/value.dart';
import 'package:flutter/material.dart';

abstract class MatchCreateController {
  // input streams

  Stream<String> get matchNameValidationStream;
  Stream<String> get locationNameValidationStream;
  Stream<String> get locationAddressValidationStream;
  Stream<String> get locationCityValidationStream;
  Stream<String> get locationCountryValidationStream;
  Stream<DateTime?> get dateValidationStream;
  Stream<TimeOfDay?> get timeValidationStream;
  Stream<bool> get joinMatchValidationStream;
  Stream<bool> get inputsValidationStream;
  Stream<List<MatchParticipationValue>> get participantInvitationsStream;

  // input change handlers
  void onChangeMatchName(String value);
  void onLocationNameChange(String value);
  void onLocationAddressChange(String value);
  void onLocationCityChange(String value);
  void onLocationCountryChange(String value);
  void onDateChange(DateTime? value);
  void onTimeChange(TimeOfDay? value);
  void onJoinMatchChange(bool? value);
  void onRemoveParticipantInvitation(
    MatchParticipationValue invitation,
  );
  void onAddParticipantInvitation(
    MatchParticipationValue invitation,
  );

  // form submission
  Future<void> onSubmit();

  Future<void> dispose();
}
