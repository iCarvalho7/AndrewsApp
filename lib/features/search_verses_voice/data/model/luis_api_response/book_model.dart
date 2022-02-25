
import 'package:andrews_app/features/search_verses_voice/domain/entities/book.dart';

class BookModel {
  String type;
  String text;
  int startIndex;
  int length;
  double score;
  int modelTypeId;
  String modelType;
  List<String> recognitionSources;

  BookModel(
      {required this.type,
      required this.text,
      required this.startIndex,
      required this.length,
      required this.score,
      required this.modelTypeId,
      required this.modelType,
      required this.recognitionSources});

  Book toEntity() => Book(
      type: type,
      text: text,
      startIndex: startIndex,
      length: length,
      score: score,
      modelTypeId: modelTypeId,
      modelType: modelType,
      recognitionSources: recognitionSources);

  factory BookModel.fromJson(dynamic json) => BookModel(
      type: json['type'],
      text: json['text'],
      startIndex: json['startIndex'],
      length: json['length'],
      score: json['score'],
      modelTypeId: json['modelTypeId'],
      modelType: json['modelType'],
      recognitionSources: (json['recognitionSources'] as List).cast());
}
