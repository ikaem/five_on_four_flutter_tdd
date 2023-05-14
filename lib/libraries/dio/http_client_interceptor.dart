// TODO sourcing intercepotor solution form here
// https://dhruvnakum.xyz/networking-in-flutter-interceptors

import 'package:dio/dio.dart';
import 'package:five_on_four_flutter_tdd/features/core/utils/helpers/value_from_env.dart';
import 'package:five_on_four_flutter_tdd/features/weather/utils/constants/weather_constants.dart';

class HttpClientInterceptor extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
// find the route
    final String routeAuthority = options.uri.authority;

    if (routeAuthority == WeatherConstants.baseUrl) {
      final String googleServicesApiKey = ValueFromEnv.weatherApiKey;
      ;

      // TODO not sure that this should not be used
      // final Uri updatedUri = options.uri.replace(
      //   queryParameters: {
      //     "key": googleServicesApiKey,
      //   },
      // );

      final RequestOptions updatedOptions = options.copyWith(
        queryParameters: {
          "key": googleServicesApiKey,
        },
      );

      handler.next(updatedOptions);
      return;
    }

    handler.next(options);
  }
}
