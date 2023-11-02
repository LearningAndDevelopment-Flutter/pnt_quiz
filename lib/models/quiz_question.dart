class QuizQuestion {
  const QuizQuestion(this.question, this.answers);

  final String question;
  final List<String> answers;

  List<String> suffleAnswers() {
    final suffleAnswers = List.of(answers);
    suffleAnswers.shuffle();

    return suffleAnswers;
  }
}
