import 'package:andrews_app/features/search_verses_voice/domain/entities/entities.dart';
import 'package:andrews_app/features/search_verses_voice/domain/entities/intents.dart';

class Prediction {
  String topIntent;
  Intents? intents;
  Entities entities;

  Prediction({this.intents, required this.entities, required this.topIntent});
}