import 'package:andrews_app/features/search_verses_voice/data/sources/bible_remote_data_source.dart';
import 'package:andrews_app/features/search_verses_voice/domain/entities/bible/bible_verse.dart';
import 'package:andrews_app/features/search_verses_voice/domain/repositories/bible_repository.dart';

class BibleRepositoryImpl extends BibleRepository {
  final BibleRemoteDataSource _dataSource;

  BibleRepositoryImpl(this._dataSource);

  @override
  Future<BibleVerse> fetchBibleVerses(String userSentence) async {
    final future = await _dataSource.fetchBibleChapterAndVerses(userSentence);
    return future.toEntity();
  }
}
