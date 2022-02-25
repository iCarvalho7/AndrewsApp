import 'package:andrews_app/data/network/base_http_client.dart';
import 'package:andrews_app/features/search_verses_voice/data/model/bible_verse_response/bible_verse_model.dart';

import 'bible_remote_data_source.dart';


class BibleRemoteDataSourceImpl extends BibleRemoteDataSource {
  final BaseHttpClient _client;

  BibleRemoteDataSourceImpl(this._client);

  @override
  Future<BibleVerseModel> fetchBibleChapterAndVerses(String sentence) async {
    final response =
        await _client.get(sentence, queryParams: {'translation': 'almeida'});
    return BibleVerseModel.fromJson(response.data);
  }
}
