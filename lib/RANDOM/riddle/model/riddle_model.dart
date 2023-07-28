class RiddleModel {
  final String title;
  final String question;
  final String answer;

  RiddleModel(
      {required this.title, required this.question, required this.answer});

  factory RiddleModel.fromJson(Map<String, dynamic> json) {
    final title = json["title"];
    final question = json["question"];
    final answer = json["answer"];

    return RiddleModel(title: title, question: question, answer: answer);
  }
}
