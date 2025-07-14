import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  const Button({
    super.key,
    required this.answar,
    required this.seletcedAnswers,
    required this.answars,
  });
  final String answar;
  final List seletcedAnswers;
  final List answars;
  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  bool isActive = false;
  bool isenable = false;


  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          isActive = !isActive;
          
        });
        if (widget.seletcedAnswers.contains(widget.answar)) {
          widget.seletcedAnswers.remove(widget.answar);
        } else {
          widget.seletcedAnswers.add(widget.answar);
        }
      },

      style: ElevatedButton.styleFrom(
        backgroundColor: isActive ? Colors.deepOrange : Colors.blue,
      ),
      child: Text(
        widget.answar,
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}
