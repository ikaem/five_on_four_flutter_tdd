import 'dart:async';
import 'dart:math';

import 'package:five_on_four_flutter_tdd/features/core/domain/models/location/model.dart';
import 'package:five_on_four_flutter_tdd/features/matches/application/services/matches/providers/provider.dart';
import 'package:five_on_four_flutter_tdd/features/matches/application/services/matches/service.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/models/match/model.dart';
import 'package:five_on_four_flutter_tdd/features/matches/presentation/state/controllers/matches_in_region/controller.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rxdart/rxdart.dart';

part "provider.g.dart";

@riverpod
class MatchesInRegionAppController extends _$MatchesInRegionAppController
    implements MatchesInRegionController {
  late final MatchesService matchesService = ref.read(matchesServiceProvider);

// TODO make this a constants somewheree in some constants
  final BehaviorSubject<double> _regionSizeSubject =
      BehaviorSubject.seeded(20.0);
  StreamSink<double> get _regionSizeSink => _regionSizeSubject.sink;

  late final StreamSubscription<double> _regionSizeSubscription;

  @override
  // TODO: implement regionSizeStream
  Stream<double> get regionSizeStream => _regionSizeSubject.distinct();

  @override
  AsyncValue<List<MatchModel>> build() {
    _initializeController();
    return AsyncValue.data([]);
  }

  @override
  void dispose() {
    ref.onDispose(() async {
      await _regionSizeSubscription.cancel();
      await _regionSizeSubject.close();
    });
  }

  @override
  void onChangeRegionSize(double regionSize) {
    _regionSizeSink.add(regionSize);
  }

  void _initializeController() {
    _regionSizeSubscription = _regionSizeSubject.stream
        .debounceTime(Duration(milliseconds: 500))
        .listen(_onRetrieveRegionMatches);
  }

  LocationModel _getCurrentLocation() {
// TODO this will required some sort of location service and pemissions granted

    final LocationModel currentLocation = LocationModel(
      latitude: 45.815399,
      longitude: 15.966568,
    );

    return currentLocation;
  }

  Future<void> _onRetrieveRegionMatches(double regionSize) async {
    final LocationModel currentLocation = _getCurrentLocation();
    final double currentRegionSize = regionSize;

    final RegionCoordinatesBoundariesValue regionCoordinatesBoundaries =
        _calculateRegionCoordinatesBoundaries(
      currentLocation,
      currentRegionSize,
    );

    state = AsyncValue.loading();

    try {
      final List<MatchModel> results =
          await matchesService.handleGetMatchesInRegion(
        regionCoordinatesBoundaries,
      );

      state = AsyncValue.data(results);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }

    // state = AsyncValue.loading();

    // try {
    //   final List<MatchModel> results =
    //       await matchesService.handleRetrieveRegionMatches(regionSize);
    //   state = AsyncValue.data(results);
    // } catch (e) {
    //   state = AsyncValue.error(e, StackTrace.current);
    // }
  }
}

// move this to values
@immutable
class RegionCoordinatesBoundariesValue {
  const RegionCoordinatesBoundariesValue({
    required this.latitudeUpper,
    required this.latitudeLower,
    required this.longitudeUpper,
    required this.longitudeLower,
  });

  final double latitudeUpper;
  final double latitudeLower;
  final double longitudeUpper;
  final double longitudeLower;
}

// TODO move this to some mixin or such
RegionCoordinatesBoundariesValue _calculateRegionCoordinatesBoundaries(
  LocationModel currentLocation,
  double regionSize,
) {
  final double currentRegionSize = regionSize;
  final double kmPerLatitudeDegree = 111.0;
  final double kmPerLongitudeDegree = kmPerLatitudeDegree *
      cos(currentLocation.latitude * (pi / 180)); // Convert latitude to radians
  final double currentLatitude = currentLocation.latitude;
  final double currentLongitude = currentLocation.longitude;

// calculate latitude boundaries
  final double differenceInLatDegrees = currentRegionSize / kmPerLatitudeDegree;
  final double upperLattitudeBoundary =
      currentLatitude + differenceInLatDegrees;
  final double lowerLattitudeBoundary =
      currentLatitude - differenceInLatDegrees;

  // calculate longitude boundaries
  final double differenceInLongDegrees =
      currentRegionSize / kmPerLongitudeDegree;
  final double upperLongitudeBoundary =
      currentLongitude + differenceInLongDegrees;
  final double lowerLongitudeBoundary =
      currentLongitude - differenceInLongDegrees;

  final RegionCoordinatesBoundariesValue regionCoordinatesBoundaries =
      RegionCoordinatesBoundariesValue(
    latitudeUpper: upperLattitudeBoundary,
    latitudeLower: lowerLattitudeBoundary,
    longitudeUpper: upperLongitudeBoundary,
    longitudeLower: lowerLongitudeBoundary,
  );

  return regionCoordinatesBoundaries;
}