class MessagesModel {
  bool isQuestion;
  String title;
  String description;

  MessagesModel({
    required this.isQuestion,
    required this.title,
    this.description = '',
  });
}
