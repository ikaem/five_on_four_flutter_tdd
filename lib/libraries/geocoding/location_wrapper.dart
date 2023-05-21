import 'package:five_on_four_flutter_tdd/features/core/domain/models/location/model.dart';
import 'package:geocoding/geocoding.dart';

class LocationWrapper {
  Future<LocationModel?> getLocationForPlace({
    required String address,
    required String city,
  }) async {
    // TODO implement this better with possibly other tool that can handle more flexible address formats
    try {
      final List<Location> locationResults = await locationFromAddress(city);

      final LocationModel location =
          LocationModel.fromGeocodingLocation(locationResults.first);

      return location;
    } catch (e) {
// TODO log error in the caller
      return null;
    }
  }
}
