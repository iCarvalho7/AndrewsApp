import 'package:andrews_app/data/network/base_http_client.dart';
import 'package:dio/dio.dart';

class AzureNLUHttpClient extends BaseHttpClient {
  Dio _client;

  AzureNLUHttpClient(this._client, List<Interceptor> interceptors) {
    _client = _client
      ..interceptors.addAll([...interceptors])
      ..options.baseUrl =
          "https://prediction-bible-text-to-speech.cognitiveservices.azure.com/luis/prediction/v3.0/apps/e04c8b47-f099-499b-a1ff-e7612f10443e/slots/production"
      ..options.connectTimeout = 1500000;
  }

  @override
  Future<Response> get(String url,
      {required Map<String, dynamic> queryParams}) async {
    final response = await _client.get(url, queryParameters: queryParams);
    return response;
  }
}
