
import 'package:andrews_app/features/search_verses_voice/domain/entities/prediction_response.dart';

abstract class AzureNLURepository {

  Future<PredictionResponse> fetchAzurePrediction(String userQuery);
}