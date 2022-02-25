
import 'package:andrews_app/features/search_verses_voice/data/model/luis_api_response/entities_model.dart';
import 'package:andrews_app/features/search_verses_voice/data/model/luis_api_response/intents_model.dart';
import 'package:andrews_app/features/search_verses_voice/domain/entities/prediction.dart';

class PredictionModel {
  String topIntent;
  IntentsModel? intents;
  EntitiesModel entities;

  PredictionModel({
    required this.topIntent,
    this.intents,
    required this.entities,
  });

  Prediction toEntity() => Prediction (
      topIntent: topIntent,
      intents: null,
      entities: entities.toEntity());

  factory PredictionModel.fromJson(dynamic json) => PredictionModel(
      topIntent: json['topIntent'],
      intents: null,
      entities: EntitiesModel.fromJson(json['entities']));
}
