import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            return Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: SizedBox(
                width: 400,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: ClipOval(
                        child: Container(
                          color: data['user_answer'].toString() ==
                                  data['correct_answer'].toString()
                              ? Colors.green
                              : Colors.red,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 5,
                          ),
                          child: Text(
                            ((data['question_index'] as int) + 1).toString(),
                            style: GoogleFonts.dancingScript(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data['question'].toString(),
                            style: GoogleFonts.lobster(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            data['user_answer'].toString(),
                            style: GoogleFonts.lobster(
                              color: data['user_answer'].toString() ==
                                      data['correct_answer'].toString()
                                  ? Colors.green
                                  : Colors.red,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            data['correct_answer'].toString(),
                            style: GoogleFonts.lobster(
                              color: data['user_answer'].toString() ==
                                      data['correct_answer'].toString()
                                  ? Colors.green
                                  : Colors.red,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
