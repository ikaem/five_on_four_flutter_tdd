import 'package:five_on_four_flutter_tdd/features/core/domain/exceptions/device_exceptions.dart';
import 'package:five_on_four_flutter_tdd/features/core/domain/exceptions/permission_exceptions.dart';
import 'package:five_on_four_flutter_tdd/features/core/domain/models/coordinates/model.dart';
import "package:geolocator/geolocator.dart";

// FUTURE eventually use permission_handler to request permission on initialization
class GeolocatorWrapper {
  Future<CoordinatesModel> getCurrentPosition() async {
    final bool isServiceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!isServiceEnabled) {
      throw DeviceExceptionLocationServiceDisabled(
          "Location service is not enabled");
    }

    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.denied) {
      throw PermissionExceptionLocationDenied("Location permission denied");
    }

    if (permission == LocationPermission.deniedForever) {
      throw PermissionExceptionLocationDenied(
          "Location permission denied forever");
    }

    final Position position = await Geolocator.getCurrentPosition();

    final CoordinatesModel coordinates = CoordinatesModel(
      latitude: position.latitude,
      longitude: position.longitude,
    );

    return coordinates;
  }
}
