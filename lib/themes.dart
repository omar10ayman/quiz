import 'package:flutter/material.dart';
import 'package:quiz/button.dart';

TextStyle sizedText = TextStyle(fontSize: 20, fontWeight: FontWeight.bold);

class ContainerWidget extends StatefulWidget {
  const ContainerWidget({
    super.key,
    required this.index,
    required this.question,
    required this.answars,
    required this.seletcedAnswers,
  });
  final int index;
  final String question;
  final List answars;
  final List seletcedAnswers;

  @override
  State<ContainerWidget> createState() => _ContainerWidgetState();
}

class _ContainerWidgetState extends State<ContainerWidget> {
  bool isActive = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                '${widget.index} .${widget.question}',
                style: sizedText,
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        for (int i = 0; i < widget.answars.length; i++)
          SizedBox(
            width: 200,
            child: Button(
              answar: widget.answars[i],
              seletcedAnswers: widget.seletcedAnswers,
              answars: widget.answars,
            ),
          ),
        Divider(thickness: 2, color: Colors.grey),
      ],
    );
  }
}
