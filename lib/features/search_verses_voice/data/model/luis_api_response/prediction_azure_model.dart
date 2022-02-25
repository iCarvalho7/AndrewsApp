import 'package:andrews_app/features/search_verses_voice/data/model/luis_api_response/prediction_model.dart';
import 'package:andrews_app/features/search_verses_voice/domain/entities/prediction_response.dart';

class PredictionResponseModel {
  String query;
  PredictionModel prediction;

  PredictionResponseModel({required this.query, required this.prediction});

  factory PredictionResponseModel.fromJson(dynamic json) =>
      PredictionResponseModel(
          query: json['query'] as String,
          prediction: PredictionModel.fromJson(json['prediction']));

  PredictionResponse toEntity() =>
      PredictionResponse(query: query, prediction: prediction.toEntity());
}
