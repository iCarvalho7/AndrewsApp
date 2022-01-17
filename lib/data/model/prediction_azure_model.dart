import 'package:andrews_app/data/model/prediction_model.dart';
import 'package:andrews_app/domain/entities/prediction_response.dart';

class PredictionResponseModel {
  String query;
  PredictionModel prediction;

  PredictionResponseModel({required this.query, required this.prediction});

  factory PredictionResponseModel.fromJson(dynamic json) =>
      PredictionResponseModel(
          query: json['query'], prediction: json['prediction']);

  PredictionResponse toEntity() =>
      PredictionResponse(query: query, prediction: prediction.toEntity());
}
