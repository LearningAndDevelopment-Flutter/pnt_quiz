import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pnt_quiz/data/question.dart';
import 'package:pnt_quiz/question_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(this.restartQuiz,
      {super.key, required this.chosenAnswers});

  final List<String> chosenAnswers;
  final void Function() restartQuiz;

  List<Map<String, Object>> getSummaryDate() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].question,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswers[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryDate();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;

    return SingleChildScrollView(
      child: SizedBox(
          width: double.infinity,
          child: Container(
            margin: const EdgeInsets.only(top: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                RichText(
                    text: TextSpan(
                  text: 'Your answered ',
                  style: GoogleFonts.lobster(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        const Shadow(
                          blurRadius: 1.0,
                          color: Color.fromARGB(195, 0, 0, 0),
                          offset: Offset(1.0, 1.0),
                        ),
                      ]),
                  children: <TextSpan>[
                    TextSpan(
                        text: '$numCorrectQuestions ',
                        style: GoogleFonts.lobster(
                          color: Colors.lightGreen,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        )),
                    TextSpan(
                        text: 'out of ',
                        style: GoogleFonts.lobster(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        )),
                    TextSpan(
                        text: '$numTotalQuestions questions ',
                        style: GoogleFonts.lobster(
                          color: Colors.purpleAccent,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        )),
                    TextSpan(
                        text: 'correctly!',
                        style: GoogleFonts.lobster(
                          color: Colors.lightGreen,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        )),
                  ],
                )),
                const SizedBox(
                  height: 30,
                ),
                QuestionSummary(getSummaryDate()),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton.icon(
                  onPressed: restartQuiz,
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.deepPurpleAccent),
                  ),
                  icon: const Icon(Icons.refresh),
                  label: Text(
                    'Restart Quiz!',
                    style: GoogleFonts.lobster(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        const Shadow(
                          blurRadius: 1.0,
                          color: Color.fromARGB(195, 0, 0, 0),
                          offset: Offset(1.0, 1.0),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
