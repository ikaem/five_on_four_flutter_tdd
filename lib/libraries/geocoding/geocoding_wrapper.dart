import 'package:five_on_four_flutter_tdd/features/core/domain/models/coordinates/model.dart';
import 'package:five_on_four_flutter_tdd/features/core/domain/values/location/value.dart';
import 'package:geocoding/geocoding.dart';

class GeocodingWrapper {
  Future<CoordinatesModel?> getCoordinatesForPlace({
    required String address,
    required String city,
  }) async {
    // TODO implement this better with possibly other tool that can handle more flexible address formats
    try {
      final List<Location> locationResults = await locationFromAddress(city);

      final CoordinatesModel location =
          CoordinatesModel.fromGeocodingLocation(locationResults.first);

      return location;
    } catch (e) {
// TODO log error in the caller
      return null;
    }
  }

  Future<LocationValue> getPlaceForCoordinates({
    required double longitude,
    required double latitude,
  }) async {
    final List<Placemark> placemarks = await placemarkFromCoordinates(
      latitude,
      longitude,
    );

    if (placemarks.isEmpty) {
      // TODO log error in the caller
      return LocationValue(
        name: "",
        coordinates: CoordinatesModel(
          latitude: latitude,
          longitude: longitude,
        ),
      );
    }

    final Placemark placemark = placemarks.first;
    final String placeName = placemark.locality ??
        placemark.subAdministrativeArea ??
        placemark.administrativeArea ??
        placemark.country ??
        "";

    return LocationValue(
      name: placeName,
      coordinates: CoordinatesModel(
        latitude: latitude,
        longitude: longitude,
      ),
    );
  }
}
