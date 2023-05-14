import 'package:five_on_four_flutter_tdd/libraries/dio/http_client_wrapper.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "provider.g.dart";

@riverpod
HttpClientWrapper httpClientWrapper(
  HttpClientWrapperRef ref,
) {
  final HttpClientWrapper httpClientWrapper = HttpClientWrapper();

  return httpClientWrapper;
}
