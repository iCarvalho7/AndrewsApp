import 'package:andrews_app/features/search_verses_voice/data/model/luis_api_response/book_model.dart';
import 'package:andrews_app/features/search_verses_voice/data/model/luis_api_response/chapter_model.dart';
import 'package:andrews_app/features/search_verses_voice/data/model/luis_api_response/versicle_model.dart';
import 'package:andrews_app/features/search_verses_voice/domain/entities/instance.dart';

class InstanceModel {
  List<BookModel> books;
  List<ChapterModel> chapters;
  List<VersicleModel> verses;

  InstanceModel(
      {required this.books, required this.chapters, required this.verses});

  Instance toEntity() => Instance(
      books: books.map((e) => e.toEntity()).toList(),
      chapters: chapters.map((e) => e.toEntity()).toList(),
      verses: verses.map((e) => e.toEntity()).toList());

  factory InstanceModel.fromJson(Map<String, dynamic> json) {
    List<BookModel> books = [];
    List<ChapterModel> chapters = [];
    List<VersicleModel> verses = [];

    if(json['book'] != null){
      json['book'].forEach((element) {
        books.add(BookModel.fromJson(element));
      });
    }

    if(json['cap'] != null) {
      json['cap'].forEach((element) {
        chapters.add(ChapterModel.fromJson(element));
      });
    }

    if(json['verse'] != null){
      json['verse'].forEach((element) {
        verses.add(VersicleModel.fromJson(element));
      });
    }

    return InstanceModel(books: books, chapters: chapters, verses: verses);
  }
}
