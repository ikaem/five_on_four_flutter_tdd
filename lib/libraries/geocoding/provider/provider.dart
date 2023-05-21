import 'package:five_on_four_flutter_tdd/libraries/geocoding/location_wrapper.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'provider.g.dart';

@riverpod
LocationWrapper locationWrapper(
  LocationWrapperRef ref,
) {
  final LocationWrapper locationWrapper = LocationWrapper();

  return locationWrapper;
}
