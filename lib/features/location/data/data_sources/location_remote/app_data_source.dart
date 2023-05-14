import 'package:five_on_four_flutter_tdd/features/location/data/data_sources/location_remote/data_source.dart';
import 'package:five_on_four_flutter_tdd/libraries/dio/http_client_wrapper.dart';

class LocationRemoteAppDataSource implements LocationRemoteDataSource {
  const LocationRemoteAppDataSource({
    required HttpClientWrapper httpClientWrapper,
  }) : _httpClientWrapper = httpClientWrapper;

  final HttpClientWrapper _httpClientWrapper;

  @override
  Future<void> getLocationOfAddress(String address) {
    // TODO: implement getLocationOfAddress
    throw UnimplementedError();
  }
}
