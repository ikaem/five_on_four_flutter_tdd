import 'package:five_on_four_flutter_tdd/features/core/domain/models/coordinates/model.dart';
import "package:geolocator/geolocator.dart";

// TODO eventually use permission_handler to request permission on initialization
class GeolocatorWrapper {
  Future<CoordinatesModel> getCurrentPosition() async {
    final bool isServiceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!isServiceEnabled) {
      // TODO create proper exceptions later
      // TODO also, this will need to be handled, by informing user somehow?
      throw Exception("Location service is not enabled");
    }

    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      // ask again
      permission = await Geolocator.requestPermission();
    }

    // check if permission is still denied
    if (permission == LocationPermission.denied) {
      // TODO create proper exceptions later
      throw Exception("Location permission is denied");
    }

    // at this point, permission is not "denied"
    // so it's either "deniedForever" or "granted"

    if (permission == LocationPermission.deniedForever) {
      // TODO create proper exceptions later
      throw Exception("Location permission is denied forever");
    }

    // now, permission is "granted"

    final Position position = await Geolocator.getCurrentPosition();

// WE CAN get name of the place with that geocoder
    final CoordinatesModel coordinates = CoordinatesModel(
      latitude: position.latitude,
      longitude: position.longitude,
    );

    return coordinates;
  }
}
