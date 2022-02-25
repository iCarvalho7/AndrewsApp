

import 'package:andrews_app/features/search_verses_voice/domain/entities/entities.dart';

import 'instance_model.dart';

class EntitiesModel {
  List<String> bookName;
  List<String> chapter;
  List<String> versicle;
  List<String> lastVerses;
  InstanceModel? instance;

  EntitiesModel(
      {required this.bookName,
      required this.chapter,
      required this.versicle,
      required this.lastVerses,
      required this.instance});

  Entities toEntity() => Entities(
      bookName: bookName,
      chapter: chapter,
      versicle: versicle,
      lastVerse: lastVerses,
      instance: instance?.toEntity());

  factory EntitiesModel.fromJson(dynamic json) {
    List<String> books = [];
    List<String> chapter = [];
    List<String> versicle = [];
    List<String> lastVerses = [];

    if (json['book'] != null) {
      json['book'].forEach((element) {
        books.add(element.toString());
      });
    }

    if (json['cap'] != null) {
      json['cap'].forEach((element) {
        chapter.add(element.toString());
      });
    }

    if (json['verse'] != null) {
      json['verse'].forEach((element) {
        versicle.add(element.toString());
      });
    }
    if (json['last_verse'] != null) {
      json['last_verse'].forEach((element) {
        lastVerses.add(element.toString());
      });
    }

    return EntitiesModel(
        bookName: books,
        chapter: chapter,
        versicle: versicle,
        lastVerses: lastVerses,
        instance: json["\$instance"] != null
            ? InstanceModel.fromJson(json["\$instance"])
            : null);
  }
}
