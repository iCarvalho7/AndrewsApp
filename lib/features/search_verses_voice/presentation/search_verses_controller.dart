
import 'package:andrews_app/features/search_verses_voice/domain/entities/bible/bible_verse.dart';
import 'package:andrews_app/features/search_verses_voice/domain/entities/bible/item_verse.dart';
import 'package:andrews_app/features/search_verses_voice/domain/entities/prediction_response.dart';
import 'package:andrews_app/features/search_verses_voice/domain/use_cases/azure_luis_use_case.dart';
import 'package:andrews_app/features/search_verses_voice/domain/use_cases/bible_use_case.dart';
import 'package:get/get.dart';
import 'package:speech_to_text/speech_recognition_error.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

class MainController extends GetxController {
  final AzureLuisUseCase _azureLuisUseCase;
  final BibleUseCase _bibleUseCase;
  final SpeechToText _speechRecognition;
  bool alreadyFetchFunction = false;

  RxBool get isListening => _speechRecognition.isListening.obs;

  void _onSpeechRecognitionError(SpeechRecognitionError error) {
    _speechRecognition.stop();
  }

  void _statusCallback(String onListen) {
    if (onListen == 'done' && !alreadyFetchFunction) {
      fetchBibleBookAndName(query.value);
      _speechRecognition.stop();
      alreadyFetchFunction = true;
    }
  }

  void _onSpeechResultSuccessCallback(SpeechRecognitionResult result) {
    query.value = result.recognizedWords;
  }

  bool isAvailable = false;

  late PredictionResponse predictionResponse;
  late BibleVerse bibleVerse;

  RxString query = ''.obs;
  RxString bookName = ''.obs;
  RxString completeSentence = ''.obs;
  RxString versicle = ''.obs;
  RxString lastVersicle = ''.obs;
  RxString chapter = ''.obs;
  RxList<ItemVerse> versicleList = <ItemVerse>[].obs;

  MainController(
      this._azureLuisUseCase, this._bibleUseCase, this._speechRecognition);

  @override
  void onInit() {
    super.onInit();
    _load();
  }

  void _load() async {
    isAvailable = await _speechRecognition.initialize(
        onError: _onSpeechRecognitionError,
        onStatus: _statusCallback,
        debugLogging: true);
  }

  void listen() async {
    if (isAvailable && _speechRecognition.isNotListening) {
      _speechRecognition.listen(onResult: _onSpeechResultSuccessCallback);
      alreadyFetchFunction = false;
    }
  }

  void stop() async {
    _speechRecognition.stop();
    update();
  }

  void fetchBibleBookAndName(String userQuery) async {
    clearParams();
    final response = await _azureLuisUseCase.fetchPredictionFromText(userQuery);
    predictionResponse = response;
    fillParams();
  }

  void fillParams() {
    query.value = predictionResponse.query;
    bookName.value = predictionResponse.bookName;
    completeSentence.value = predictionResponse.completeSentence;
    versicle.value = predictionResponse.versicle.toString();
    chapter.value = predictionResponse.chapterWords;
    lastVersicle.value = predictionResponse.lastVerse.toString();
    requestChapterAndBook();
  }

  void clearParams() {
    query.value = '';
    bookName.value = '';
    completeSentence.value = '';
    versicle.value = '';
  }

  void requestChapterAndBook() async {
    final bibleVerses = await _bibleUseCase
        .fetchBibleVerse(predictionResponse.completeSentence);
    bibleVerse = bibleVerses;
    versicleList.value = bibleVerse.versesList;
  }
}
