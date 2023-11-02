import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 220,
            color: const Color.fromARGB(200, 255, 255, 255),
          ),
          SizedBox.fromSize(
            size: const Size(0, 40),
          ),
          const Text('Learn Flutter the fun way!',
              style: TextStyle(
                fontSize: 15,
                color: Colors.white,
              )),
          SizedBox.fromSize(
            size: const Size(0, 40),
          ),
          ElevatedButton.icon(
            onPressed: startQuiz,
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(Colors.deepPurpleAccent),
            ),
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text('Start Quiz'),
          ),
        ],
      ),
    );
  }
}
