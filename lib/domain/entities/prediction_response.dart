import 'package:andrews_app/domain/entities/prediction.dart';

class PredictionResponse {
  String query;
  Prediction prediction;

  PredictionResponse({required this.query, required this.prediction});
}