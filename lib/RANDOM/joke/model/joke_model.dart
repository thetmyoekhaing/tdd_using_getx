class JokeModel {
  final String joke;

  JokeModel({required this.joke});

  factory JokeModel.fromJson(Map<String, dynamic> json) {
    final joke = json["joke"];
    return JokeModel(joke: joke);
  }
}
