import 'item_verse.dart';

class BibleVerse {
  String reference;
  List<ItemVerse> versesList;
  String completeTexts;

  BibleVerse(
      {required this.reference,
      required this.versesList,
      required this.completeTexts});
}
