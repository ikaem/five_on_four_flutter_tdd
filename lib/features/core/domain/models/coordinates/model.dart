// TODO this is a simple model - keep in core for now until location feature grows

import 'dart:math';

import 'package:five_on_four_flutter_tdd/features/matches/presentation/state/controllers/matches_all/providers/provider.dart';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';

// FUTURE this should probably be a value object
@immutable
class CoordinatesModel {
  const CoordinatesModel({
    required this.latitude,
    required this.longitude,
  });

  final double latitude;
  final double longitude;

  factory CoordinatesModel.fromGeocodingLocation(Location geocodingLocation) {
    final CoordinatesModel locationModel = CoordinatesModel(
      latitude: geocodingLocation.latitude,
      longitude: geocodingLocation.longitude,
    );

    return locationModel;
  }
}

// TOOD move this extension to the value file after we move value there as well
extension CoordinatesModelExtension on CoordinatesModel {
  RegionCoordinatesBoundariesValue toRegionCoordinatesBoundaries(
    double regionSize,
  ) {
    final double currentRegionSize = regionSize;
    final double kmPerLatitudeDegree = 111.0;
    final double kmPerLongitudeDegree = kmPerLatitudeDegree *
        cos(latitude * (pi / 180)); // Convert latitude to radians
    final double currentLatitude = latitude;
    final double currentLongitude = longitude;

// calculate latitude boundaries
    final double differenceInLatDegrees =
        currentRegionSize / kmPerLatitudeDegree;
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
}
