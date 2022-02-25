class Chapter {
  String type;
  String text;
  int startIndex;
  int length;
  double score;
  int modelTypeId;
  String modelType;
  List<String> recognitionSources;

  Chapter(
      {required this.type,
        required this.text,
        required this.startIndex,
        required this.length,
        required this.score,
        required this.modelTypeId,
        required this.modelType,
        required this.recognitionSources});
}