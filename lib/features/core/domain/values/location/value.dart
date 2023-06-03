// TODO might be useful to use freezed later

import 'package:five_on_four_flutter_tdd/features/core/domain/models/coordinates/model.dart';
import 'package:flutter/material.dart';

@immutable
class LocationValue {
  const LocationValue({
    required this.name,
    required this.coordinates,
  });

  final String name;
  final CoordinatesModel coordinates;
}
