import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class HttpInterceptor extends Interceptor {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    _logOnResponse(response);
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    _logOnError(err);
    super.onError(err, handler);
  }

  void _logOnResponse(Response response) {
    print("\n");
    print("HTTP RESPONSE");
    print("--> Request Info <--");
    print("Method: ${response.requestOptions.method}");
    print("URL: ${response.requestOptions.uri}");
    print("ResponseType: ${response.requestOptions.responseType}");
    print("Headers: ${response.requestOptions.headers}");
    print("Body: ${response.requestOptions.data}");
    print("--> Response Info <--");
    print("StatusCode: ${response.statusCode}");
    print("Body: ${response.data}");
    print("\n");
  }

  void _logOnError(DioError err) {
    print("HTTP ERROR");
    print("--> Request Info <--");
    print("Method: ${err.requestOptions.method}");
    print("URL: ${err.requestOptions.uri}");
    print("ResponseType: ${err.requestOptions.responseType}");
    print("Headers: ${err.requestOptions.headers}");
    print("Body: ${err.requestOptions.data}");
    print("--> ResponseInfo <--");
    if (err.response == null) return;
    print("StatusCode: ${err.response?.statusCode}");
    print("Body: ${err.response?.data}");
    print("--> Error Info <--");
    print("ErrorType: ${err.type}");
    print("Body: ${err.error}");
    print("\n");
  }
}
