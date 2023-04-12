// route is a value, because it is immutable
import 'package:flutter/material.dart';

@immutable
class AppRouteValue {
  const AppRouteValue({
    required this.path,
    required this.name,
  });

  final String path;
  final String name;
}
