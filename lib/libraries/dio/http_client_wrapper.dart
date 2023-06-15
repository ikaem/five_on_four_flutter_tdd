import 'dart:io';

import 'package:dio/dio.dart';
import 'package:five_on_four_flutter_tdd/features/core/domain/enums/http_method.dart';
import 'package:five_on_four_flutter_tdd/features/core/domain/exceptions/http_exceptions.dart';
import 'package:five_on_four_flutter_tdd/features/core/domain/values/http_request/value.dart';
import 'package:five_on_four_flutter_tdd/libraries/dio/http_client_interceptor.dart';

class HttpClientWrapper {
  HttpClientWrapper() {
    _dio.interceptors.add(HttpClientInterceptor());
  }

  final Dio _dio = Dio();

  Future<T> get<T>({
    required HttpRequestUriPartsValue uriParts,
  }) async {
    final Uri uri = Uri(
      scheme: uriParts.apiUrlScheme,
      host: uriParts.apiBaseUrl,
      path: "${uriParts.apiContextPath}/${uriParts.apiEndpointPath}",
      queryParameters: uriParts.queryParameters,
    );

    final Response<T> response = await _makeRequest<T>(
      args: HttpRequestArgsValue(
        uri: uri,
        method: HttpMethod.get,
      ),
    );

    final T? data = response.data;

    if (data == null) {
      throw HttpRequestExceptionDataNotFound(
        statusCode: response.statusCode ?? HttpStatus.notFound,
        message: response.statusMessage ?? "Data not found",
      );
    }

    return data;
  }

  Future<Response<T>> _makeRequest<T>({
    required HttpRequestArgsValue args,
  }) async {
    try {
      final Response<T> response = await _dio.requestUri<T>(
        args.uri,
        data: args.data,
        options: Options(
          method: args.method.name,
        ),
      );

      if (response.statusCode != 200) {
        throw HttpRequestException(
          statusCode: response.statusCode ?? HttpStatus.internalServerError,
          message: response.statusMessage ?? "Invalid response",
        );
      }

      return response;
    } catch (e) {
      final HttpRequestException fallbackException = HttpRequestException(
        statusCode: HttpStatus.internalServerError,
        message: "Invalid response: $e}",
      );

      final Object exception = e;

      if (exception is HttpRequestException) {
        throw exception;
      }

      if (exception is DioError) {
        throw HttpRequestException(
          statusCode:
              exception.response?.statusCode ?? fallbackException.statusCode,
          message:
              exception.response?.statusMessage ?? fallbackException.message,
        );
      }

      throw fallbackException;
    }
  }
}
