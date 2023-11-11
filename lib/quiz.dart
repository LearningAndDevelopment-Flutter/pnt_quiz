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
    if (selectedAnswers.length == questions.length) {
      selectedAnswers.clear();
    }
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'result_screen';
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
      screenWidget = ResultScreen(chosenAnswers: selectedAnswers, switchScreen);
    }

    return MaterialApp(
        title: 'PnT Quiz',
        home: Scaffold(
          backgroundColor: Colors.red,
          body: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 141, 79, 248),
                  Color.fromARGB(195, 140, 89, 230),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              )),
              child: activeScreen == 'start_screen'
                  ? StartScreen(switchScreen)
                  : screenWidget,
            ),
          ),
        ));
  }
}
