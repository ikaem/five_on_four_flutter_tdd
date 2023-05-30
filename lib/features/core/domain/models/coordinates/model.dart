// TODO this is a simple model - keep in core for now until location feature grows

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
