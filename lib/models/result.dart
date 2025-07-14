import 'package:flutter/material.dart';
import 'package:quiz/Data/all.dart';
import 'package:quiz/models/home.dart';

class Result extends StatelessWidget {
  const Result(this.selectedAnswered, {super.key});
  final List selectedAnswered;
  @override
  Widget build(BuildContext context) {
    List getSummary() {
      List<Map<String, Object>> summary = [];
      for (int i = 0; i < selectedAnswered.length; i++) {
        summary.add({
          'index': i + 1,
          'question': questions[i].question!,
          'u_answar': selectedAnswered[i],
          'c_answar': questions[i].answers?[0]!,
        });
      }
      return summary;
    }

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Colors.grey, Colors.blueGrey]),
        ),
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Home()),
                  );
                },
                child: Text(
                  "Restart Quiz",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              ...getSummary().map((e) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundColor: e['u_answar'] == e['c_answar']
                            ? Colors.green
                            : Colors.red,
                        child: Text("${e['index']}"),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${e['question']}",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text("Your Answar : ${e['u_answar']}"),
                            Text("Correct Answar : ${e['c_answar']}"),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
