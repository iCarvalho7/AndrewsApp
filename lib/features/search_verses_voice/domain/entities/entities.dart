
import 'package:andrews_app/features/search_verses_voice/domain/entities/instance.dart';

class Entities {
  List<String> bookName;
  List<String> chapter;
  List<String> versicle;
  List<String> lastVerse;
  Instance? instance;

  Entities(
      {required this.bookName,
      required this.chapter,
      required this.versicle,
      required this.lastVerse,
      required this.instance});
}
