
import 'package:andrews_app/features/search_verses_voice/domain/entities/bible/bible_verse.dart';

abstract class BibleUseCase {
  Future<BibleVerse> fetchBibleVerse(String userSentence);
}