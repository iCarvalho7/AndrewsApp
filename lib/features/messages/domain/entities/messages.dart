import 'package:flutter/cupertino.dart';

import '../../../search_verses_voice/domain/entities/bible/item_verse.dart';

class Message {
  bool isQuestion;
  String title;
  String description;
  List<ItemVerse> versesList;

  List<Text> get formattedVerses {
    List<Text> _textsList = <Text>[];

    for (var e in versesList) {
      _textsList.add(Text('${e.verse}. ${e.text}\n'));
    }
    return _textsList;
  }

  Message({
    required this.isQuestion,
    required this.title,
    this.versesList = const <ItemVerse>[],
    this.description = '',
  });
}
