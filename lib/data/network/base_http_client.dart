import 'package:dio/dio.dart';

abstract class BaseHttpClient {
  Future<Response> get(String url, {
    required Map<String, dynamic> queryParams,
  });
}