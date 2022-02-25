import 'package:dio/dio.dart';
import 'base_http_client.dart';

class BibleApiHttpClientImpl extends BaseHttpClient {
  Dio _client;

  BibleApiHttpClientImpl(this._client, List<Interceptor> interceptors) {
    _client = _client
      ..interceptors.addAll([...interceptors])
      ..options.baseUrl = "https://bible-api.com/"
      ..options.connectTimeout = 1500000;
  }

  @override
  Future<Response> get(String url,
      {required Map<String, dynamic> queryParams}) async {
    final response = await _client.get(url, queryParameters: queryParams);
    return response;
  }
}
