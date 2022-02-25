import 'package:andrews_app/data/utils/number_extensions.dart';
import 'package:andrews_app/features/search_verses_voice/domain/entities/prediction.dart';

class PredictionResponse {
  String query;
  Prediction prediction;

  PredictionResponse({required this.query, required this.prediction});

  String get bookName {
    return prediction.entities.bookName.isNotEmpty
        ? prediction.entities.bookName.first
        : '';
  }

  String get chapterWords {
    return prediction.entities.chapter.isNotEmpty
        ? prediction.entities.chapter.first
        : '';
  }

  String get versicleWords {
    return prediction.entities.versicle.isNotEmpty
        ? prediction.entities.versicle.first
        : '';
  }

  String get lastVersicleWords {
    return prediction.entities.lastVerse.isNotEmpty
        ? prediction.entities.lastVerse.first
        : '';
  }

  String get book => bookName.convertNumberWordsToNumber();

  int get versicle => int.tryParse(versicleWords) ?? versicleWords.getNumber();

  int get chapter => int.tryParse(chapterWords) ?? chapterWords.getNumber();

  int get lastVerse =>
      int.tryParse(lastVersicleWords) ?? lastVersicleWords.getNumber();

  String get completeSentence {
    return "$book$chapter${versicle > 0 ? ':$versicle' : ""}${lastVerse > 0 ?'-$lastVerse':''}".replaceAll(" ", "");
  }
}
