import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pnt_quiz/answer_button.dart';
import 'package:pnt_quiz/data/question.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;

  @override
  State<StatefulWidget> createState() {
    return _QuestionQuestionState();
  }
}

class _QuestionQuestionState extends State<QuestionScreen> {
  int currentQuestionIndex = 0;

  @override
  build(context) {
    final currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.question,
              style: GoogleFonts.dancingScript(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            ...currentQuestion.suffleAnswers().map((answer) {
              return Padding(
                padding: const EdgeInsets.all(4.0),
                child: SizedBox(
                  height: 35,
                  child: AnswerButton(answer, () {
                    answerQuestion(answer);
                  }),
                ),
              );
            })
          ],
        ),
      ),
    );
  }

  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);

    setState(() {
      currentQuestionIndex++;
    });
  }
}
