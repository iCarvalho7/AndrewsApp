import 'package:andrews_app/features/search_verses_voice/domain/entities/versicle.dart';

class VersicleModel {
  String type;
  String text;
  int startIndex;
  int length;
  double score;
  int modelTypeId;
  String modelType;
  List<String> recognitionSources;

  VersicleModel(
      {required this.type,
      required this.text,
      required this.startIndex,
      required this.length,
      required this.score,
      required this.modelTypeId,
      required this.modelType,
      required this.recognitionSources});

  Versicle toEntity() => Versicle(
      type: type,
      text: text,
      startIndex: startIndex,
      length: length,
      score: score,
      modelTypeId: modelTypeId,
      modelType: modelType,
      recognitionSources: recognitionSources);

  factory VersicleModel.fromJson(dynamic json) => VersicleModel(
      type: json['type'],
      text: json['text'],
      startIndex: json['startIndex'],
      length: json['length'],
      score: json['score'],
      modelTypeId: json['modelTypeId'],
      modelType: json['modelType'],
      recognitionSources: (json['recognitionSources'] as List).cast());
}
