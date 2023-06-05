import 'package:five_on_four_flutter_tdd/features/core/domain/values/location/value.dart';

abstract class PlayerPreferencesService {
  // this needs to expose bunch of stuff

// TODO possibly not needed
  // Stream<int?> get regionSizeStream;
  // TODO for now not needed
  // Stream<LocationValue?> get currentLocationStream;

  int? get regionSize;
  LocationValue? get currentLocation;

// TODO for now, it will only get current location
  Future<void> initialize();
  Future<void> handleChangedRegionSize(int regionSize);
}
