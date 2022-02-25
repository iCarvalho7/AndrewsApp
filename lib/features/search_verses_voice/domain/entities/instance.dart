import 'package:andrews_app/features/search_verses_voice/domain/entities/book.dart';
import 'package:andrews_app/features/search_verses_voice/domain/entities/chapter.dart';
import 'package:andrews_app/features/search_verses_voice/domain/entities/versicle.dart';

class Instance {
  List<Book> books;
  List<Chapter> chapters;
  List<Versicle> verses;

  Instance(
      {required this.books, required this.chapters, required this.verses});
}
