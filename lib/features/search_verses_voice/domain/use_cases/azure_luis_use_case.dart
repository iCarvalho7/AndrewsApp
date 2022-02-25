
import 'package:andrews_app/features/search_verses_voice/domain/entities/prediction_response.dart';

abstract class AzureLuisUseCase {
  Future<PredictionResponse> fetchPredictionFromText(String userQuery);
}