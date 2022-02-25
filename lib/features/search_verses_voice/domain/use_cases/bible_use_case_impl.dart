
import 'package:andrews_app/features/search_verses_voice/domain/entities/bible/bible_verse.dart';
import 'package:andrews_app/features/search_verses_voice/domain/repositories/bible_repository.dart';
import 'package:andrews_app/features/search_verses_voice/domain/use_cases/bible_use_case.dart';

class BibleUseCaseImpl extends BibleUseCase {
  final BibleRepository _repository;

  BibleUseCaseImpl(this._repository);

  @override
  Future<BibleVerse> fetchBibleVerse(String userSentence) async {
    final response = await _repository.fetchBibleVerses(userSentence);
    return response;
  }
}
