import 'package:five_on_four_flutter_tdd/libraries/geolocator/geolocator_wrapper.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "provider.g.dart";

@riverpod
GeolocatorWrapper geolocatorWrapper(GeolocatorWrapperRef ref) {
  final GeolocatorWrapper geolocatorWrapper = GeolocatorWrapper();

  return geolocatorWrapper;
}
