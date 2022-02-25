import 'package:andrews_app/data/network/base_http_client.dart';
import 'package:andrews_app/features/search_verses_voice/data/model/luis_api_response/prediction_azure_model.dart';
import 'azure_remote_data_source.dart';

class AzureRemoteDataSourceImpl extends AzureRemoteDataSource {
  final BaseHttpClient _httpClient;

  AzureRemoteDataSourceImpl(this._httpClient);

  @override
  Future<PredictionResponseModel> findBibleBookPrediction(
      String userQuery) async {
    final response = await _httpClient.get('/predict', queryParams: {
      'query': userQuery,
      'subscription-key': '869b649922fb482c9d8379265d206751',
      'verbose': true,
      'show-all-intents': true,
      'log' : true
    });

    return PredictionResponseModel.fromJson(response.data);
  }
}
