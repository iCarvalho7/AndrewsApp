
import 'package:andrews_app/features/search_verses_voice/domain/entities/bible/bible_verse.dart';

abstract class BibleRepository {
  Future<BibleVerse> fetchBibleVerses(String userSentence);
}