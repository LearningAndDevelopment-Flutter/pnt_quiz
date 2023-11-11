import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton(this.answerText, this.onTap, {super.key});

  final String answerText;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.deepPurpleAccent,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
            40,
          ))),
      child: Text(
        answerText,
        style: GoogleFonts.lobster(
          color: Colors.white,
          fontSize: 16,
          shadows: [
            const Shadow(
              blurRadius: 1.0,
              color: Color.fromARGB(195, 0, 0, 0),
              offset: Offset(1.0, 1.0),
            ),
          ],
        ),
      ),
    );
  }
}
