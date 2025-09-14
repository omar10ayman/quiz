import 'package:flutter/material.dart';
import 'package:quiz/Data/all.dart';
import 'package:quiz/Data/quizquetions.dart';
import 'package:quiz/models/result.dart';
import 'package:quiz/themes.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  final selectedAnswered = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Colors.grey, Colors.blueGrey]),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                ...[
                  for (int i = 0; i < questions.length; i++)
                    ContainerWidget(
                      index: i + 1,
                      question: questions[i].question!,
                      seletcedAnswers: selectedAnswered,
                      answars: QuizQuestion(
                        questions[i].question,
                        questions[i].answers,
                      ).sheffledAnswers(),
                    ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Result(selectedAnswered),
                        ),
                      );
                    },
                    child: Text(
                      "Submit",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
