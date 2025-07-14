// ignore: file_names
class QuizQuestion {
  QuizQuestion(this.question, this.answers);
  String? question;
  List? answers;
  List sheffledAnswers() {
    List sheffled = List.of(answers!);
    sheffled.shuffle();
    return sheffled;
  }
}
