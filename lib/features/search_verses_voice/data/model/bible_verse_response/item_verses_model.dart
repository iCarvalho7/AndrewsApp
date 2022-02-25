
import 'package:andrews_app/features/search_verses_voice/domain/entities/bible/item_verse.dart';

class ItemVerseModel {
  String bookId;
  String bookName;
  int chapter;
  int verse;
  String text;

  ItemVerseModel(
      {required this.bookName,
      required this.bookId,
      required this.chapter,
      required this.verse,
      required this.text});

  ItemVerse toEntity() => ItemVerse(
      bookId: bookId,
      bookName: bookName,
      chapter: chapter,
      verse: verse,
      text: text);

  factory ItemVerseModel.fromJson(dynamic json) => ItemVerseModel(
      bookName: json['book_name'],
      bookId: json['book_id'],
      chapter: json['chapter'],
      verse: json['verse'],
      text: json['text']);
}
