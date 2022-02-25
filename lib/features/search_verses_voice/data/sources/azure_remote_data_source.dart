
import 'package:andrews_app/features/search_verses_voice/data/model/luis_api_response/prediction_azure_model.dart';

abstract class AzureRemoteDataSource {
  Future<PredictionResponseModel> findBibleBookPrediction(String userQuery);
}