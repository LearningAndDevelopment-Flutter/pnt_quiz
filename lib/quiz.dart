import 'package:flutter/material.dart';
import 'package:pnt_quiz/data/question.dart';
import 'package:pnt_quiz/question_screen.dart';
import 'package:pnt_quiz/result_screen.dart';
import 'package:pnt_quiz/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<StatefulWidget> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activeScreen = 'start_screen';

  // @override
  // void initState() {
  //   activeScreen = activeScreen;
  //   super.initState();
  // }

  void switchScreen() {
    setState(() {
      activeScreen = 'question_screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'result_screen';
        selectedAnswers = [];
      });
    }
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'question_screen') {
      screenWidget = QuestionScreen(onSelectAnswer: chooseAnswer);
    }

    if (activeScreen == 'result_screen') {
      screenWidget = ResultScreen();
    }

    return MaterialApp(
        title: 'PnT Quiz',
        home: Scaffold(
          body: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 104, 58, 183),
                Color.fromARGB(184, 104, 58, 183),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            )),
            child: activeScreen == 'start_screen'
                ? StartScreen(switchScreen)
                : screenWidget,
          ),
        ));
  }
}
