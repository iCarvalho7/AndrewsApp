import 'package:andrews_app/features/search_verses_voice/data/sources/azure_remote_data_source.dart';
import 'package:andrews_app/features/search_verses_voice/domain/entities/prediction_response.dart';
import 'package:andrews_app/features/search_verses_voice/domain/repositories/azure_nlu_repository.dart';

class AzureNLURepositoryImpl extends AzureNLURepository {
  final AzureRemoteDataSource _remoteDataSource;
  AzureNLURepositoryImpl(this._remoteDataSource);

  @override
  Future<PredictionResponse> fetchAzurePrediction(String userQuery) async {
   final response = await _remoteDataSource.findBibleBookPrediction(userQuery);
   return response.toEntity();
  }
}