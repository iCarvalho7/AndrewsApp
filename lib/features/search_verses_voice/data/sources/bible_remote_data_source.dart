
import 'package:andrews_app/features/search_verses_voice/data/model/bible_verse_response/bible_verse_model.dart';

abstract class BibleRemoteDataSource {
  Future<BibleVerseModel> fetchBibleChapterAndVerses(String sentence);
}