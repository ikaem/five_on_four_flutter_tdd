import 'dart:async';

import 'package:five_on_four_flutter_tdd/features/core/utils/mixins/validation.dart';
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

// TODO also, these fields need to be in the controller interface itself

// TODO might need seeded to kickoff the validation
  final BehaviorSubject<String> _matchNameSubject = BehaviorSubject();
  final BehaviorSubject<String> _locationNameSubject = BehaviorSubject();
  final BehaviorSubject<String> _locationAddressSubject = BehaviorSubject();
  final BehaviorSubject<String> _locationCitySubject = BehaviorSubject();
  final BehaviorSubject<String> _locationCountrySubject = BehaviorSubject();
  final BehaviorSubject<DateTime?> _dateSubject = BehaviorSubject();
  final BehaviorSubject<TimeOfDay> _timeSubject = BehaviorSubject();

  StreamSink<String> get _matchNameSink => _matchNameSubject.sink;
  StreamSink<String> get _locationNameSink => _locationNameSubject.sink;
  StreamSink<String> get _locationAddressSink => _locationAddressSubject.sink;
  StreamSink<String> get _locationCitySink => _locationCitySubject.sink;
  StreamSink<String> get _locationCountrySink => _locationCountrySubject.sink;
  StreamSink<DateTime?> get _dateSink => _dateSubject.sink;
  StreamSink<TimeOfDay> get _timeSink => _timeSubject.sink;

  // TODO this should be overriden
  Stream<String> get matchNameStream =>
      _matchNameSubject.distinct().transform(matchNameValidationTransformer);
  Stream<String> get locationNameStream => _locationNameSubject
      .distinct()
      .transform(genericTextValidationTransformer);
  Stream<String> get locationAddressStream => _locationAddressSubject
      .distinct()
      .transform(genericTextValidationTransformer);
  Stream<String> get locationCityStream => _locationCitySubject
      .distinct()
      .transform(genericTextValidationTransformer);
  Stream<String> get locationCountryStream => _locationCountrySubject
      .distinct()
      .transform(locationCountryValidationTransformer);
  Stream<DateTime?> get dateStream =>
      _dateSubject.distinct().transform(dateValidationTransformer);
  Stream<TimeOfDay> get timeStream =>
      _timeSubject.distinct().transform(timeValidationTransformer);

  Stream<bool> get inputsValidationStream => Rx.combineLatest(
        [
          matchNameStream,
          locationNameStream,
          locationAddressStream,
          locationCityStream,
          locationCountryStream,
          dateStream,
          timeStream,
        ],
        (values) => true,
      );
  @override
  AsyncValue<void> build() {
    return AsyncValue.loading();
  }

  @override
  Future<void> dispose() async {
    await _matchNameSubject.close();
  }
}
