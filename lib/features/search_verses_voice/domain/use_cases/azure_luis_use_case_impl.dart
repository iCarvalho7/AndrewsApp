import 'package:andrews_app/features/search_verses_voice/domain/entities/prediction_response.dart';
import 'package:andrews_app/features/search_verses_voice/domain/repositories/azure_nlu_repository.dart';
import 'package:andrews_app/features/search_verses_voice/domain/use_cases/azure_luis_use_case.dart';

class AzureLuisUseCaseImpl extends AzureLuisUseCase {
  final AzureNLURepository _repository;

  AzureLuisUseCaseImpl(this._repository);

  @override
  Future<PredictionResponse> fetchPredictionFromText(String userQuery) async {
    final response = await _repository.fetchAzurePrediction(userQuery);
    return response;
  }
}