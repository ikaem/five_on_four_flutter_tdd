import 'package:five_on_four_flutter_tdd/features/core/domain/enums/http_method.dart';
import 'package:flutter/material.dart';

@immutable
class HttpRequestUriPartsValue {
  const HttpRequestUriPartsValue({
    required this.apiUrlScheme,
    required this.apiBaseUrl,
    required this.apiContextPath,
    required this.apiEndpointPath,
    required this.queryParameters,
  });

  final String apiUrlScheme;
  final String apiBaseUrl;
  final String apiContextPath;
  final String apiEndpointPath;
  final Map<String, String>? queryParameters;
}

@immutable
class HttpRequestArgsValue {
  const HttpRequestArgsValue({
    required this.uri,
    required this.method,
    this.data,
  });

  final Uri uri;
  final HttpMethod method;
  final Object? data;
}
