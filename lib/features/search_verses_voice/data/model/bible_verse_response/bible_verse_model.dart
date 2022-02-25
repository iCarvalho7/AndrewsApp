import 'package:andrews_app/features/search_verses_voice/data/model/bible_verse_response/item_verses_model.dart';
import 'package:andrews_app/features/search_verses_voice/domain/entities/bible/bible_verse.dart';

class BibleVerseModel {
  String reference;
  List<ItemVerseModel> versesList;
  String completeTexts;

  BibleVerseModel(
      {required this.reference,
      required this.versesList,
      required this.completeTexts});

  BibleVerse toEntity() => BibleVerse(
      reference: reference,
      versesList: versesList.map((e) => e.toEntity()).toList(),
      completeTexts: completeTexts);

  factory BibleVerseModel.fromJson(Map<String, dynamic> json) {
    if (json['versesList'] != null) {
      for (var element in json['versesList']) {
        ItemVerseModel.fromJson(element);
      }
    }
    return BibleVerseModel(
        reference: json['reference'],
        versesList: (json['verses'] as List)
            .map((e) => ItemVerseModel.fromJson(e))
            .toList(),
        completeTexts: json['text']);
  }
}
