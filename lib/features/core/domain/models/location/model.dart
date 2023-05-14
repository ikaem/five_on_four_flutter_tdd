// TODO this is a simple model - keep in core for now until location feature grows

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';

@immutable
class LocationModel {
  const LocationModel({
    required this.latitude,
    required this.longitude,
  });

  final double latitude;
  final double longitude;

  factory LocationModel.fromGeocodingLocation(Location geocodingLocation) {
    final LocationModel locationModel = LocationModel(
      latitude: geocodingLocation.latitude,
      longitude: geocodingLocation.longitude,
    );

    return locationModel;
  }
}
