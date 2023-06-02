import 'package:five_on_four_flutter_tdd/libraries/geocoding/geocoding_wrapper.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'provider.g.dart';

@riverpod
GeocodingWrapper geocodingWrapper(
  GeocodingWrapperRef ref,
) {
  final GeocodingWrapper geocodingWrapper = GeocodingWrapper();

  return geocodingWrapper;
}
