import 'package:andrews_app/data/utils/app_spacements.dart';
import 'package:andrews_app/features/search_verses_voice/domain/entities/bible/bible_verse.dart';
import 'package:andrews_app/features/search_verses_voice/domain/entities/bible/item_verse.dart';
import 'package:andrews_app/features/search_verses_voice/domain/entities/prediction_response.dart';
import 'package:andrews_app/features/search_verses_voice/domain/use_cases/azure_luis_use_case.dart';
import 'package:andrews_app/features/search_verses_voice/domain/use_cases/bible_use_case.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:speech_to_text/speech_recognition_error.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

import '../../messages/domain/entities/messages.dart';

class MainController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final AzureLuisUseCase _azureLuisUseCase;
  final BibleUseCase _bibleUseCase;
  final SpeechToText _speechRecognition;
  bool alreadyFetchFunction = false;

  RxBool get isListening => _speechRecognition.isListening.obs;

  Rx<double> buttonWidth = 0.0.obs;
  Rx<double> buttonHeight = 0.0.obs;
  RxBool isRecordingAudio = false.obs;

  void _onSpeechRecognitionError(SpeechRecognitionError error) {
    _speechRecognition.stop();
  }

  void _onSpeechResultSuccessCallback(SpeechRecognitionResult result) {
    query.value = result.recognizedWords;
  }

  bool isAvailable = false;

  late PredictionResponse predictionResponse;
  late BibleVerse bibleVerse;
  final ScrollController scrollController = ScrollController();

  RxString query = ''.obs;
  RxString bookName = ''.obs;
  RxString completeSentence = ''.obs;
  RxString versicle = ''.obs;
  RxString lastVersicle = ''.obs;
  RxString chapter = ''.obs;
  RxList<ItemVerse> versicleList = <ItemVerse>[].obs;
  RxList<Message> messageList = <Message>[].obs;

  MainController(
      this._azureLuisUseCase, this._bibleUseCase, this._speechRecognition);

  @override
  void onInit() {
    super.onInit();
    _load();
    SchedulerBinding.instance?.addPostFrameCallback((timeStamp) {
      _scrollMessageListDown();
      buttonHeight.value = Get.context!.screenPartHeight(15);
      buttonWidth.value = Get.context!.screenPartHeight(15);
    });
  }

  void _scrollMessageListDown() {
    scrollController.jumpTo(scrollController.position.maxScrollExtent);
  }

  void _load() async {
    isAvailable = await _speechRecognition.initialize(
        onError: _onSpeechRecognitionError,
        onStatus: (_){},
        debugLogging: true);
  }

  void _stop() async {
    _speechRecognition.stop();
    update();
  }

  void _fetchBibleBookAndName() async {
    if (query.value.isNotEmpty) {
      final response =
          await _azureLuisUseCase.fetchPredictionFromText(query.value);
      predictionResponse = response;
      _fillParams();
    }
  }

  void _fillParams() {
    query.value = predictionResponse.query;
    _addQuestionMessage();
    _requestChapterAndBook();
  }

  void _clearParams() {
    query.value = '';
  }

  void _requestChapterAndBook() async {
    final bibleVerses = await _bibleUseCase
        .fetchBibleVerse(predictionResponse.completeSentence);
    bibleVerse = bibleVerses;
    versicleList.value = bibleVerse.versesList;
    _addResponseMessage();
  }

  void startRecordingAudio() {
    _startAnimation();
    _startListening();
  }

  void _startAnimation() {
    if (buttonHeight.value == Get.context!.screenPartHeight(15)) {
      buttonHeight.value = buttonHeight.value * 1.2;
      buttonWidth.value = buttonWidth.value * 1.2;
      isRecordingAudio.value = true;
    }
  }

  void _resetAnimation() {
    buttonHeight.value = Get.context!.screenPartHeight(15);
    buttonWidth.value = Get.context!.screenPartHeight(15);
    isRecordingAudio.value = false;
  }

  void _startListening() {
    if (isAvailable && _speechRecognition.isNotListening) {
      _speechRecognition.listen(
          onResult: _onSpeechResultSuccessCallback, partialResults: true);
    }
  }

  void stopRecordingAudio() {
    _resetAnimation();
    _stop();
    _fetchBibleBookAndName();
  }

  void _addQuestionMessage() {
    messageList.add(
        Message(isQuestion: true, description: query.value));
  }

  void _addResponseMessage() {
    messageList.add(Message(
        isQuestion: false,
        title: bibleVerse.reference,
        versesList: bibleVerse.versesList,
        description: bibleVerse.completeTexts));
    _clearParams();
    _scrollMessageListDown();
  }
}
