import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  static const String num1 = "1";
  static const String num2 = "2";
  static const String num3 = "3";
  static const String num4 = "4";
  static const String num5 = "5";
  static const String num6 = "6";
  static const String num7 = "7";
  static const String num8 = "8";
  static const String num9 = "9";
  static const String num0 = "0";

  static const String add = "+";
  static const String sub = "-";
  static const String mul = "×";
  static const String div = "÷";

  static const String equal = "=";
  static const String percentage = "%";
  static const String dot = ".";
  static const String sqrt = "√";
  static const String openBr = "(";
  static const String closeBr = ")";
  static const String sign = "+/-";

  static const String delete = "del";
  static const String reset = "C";

  final String label;
  final Color textColor;
  final Function(String) onPressed;

  const Buttons({
    super.key,
    required this.label,
    required this.onPressed,
    this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onPressed(label),
      child: Material(
        color: Colors.black,
        elevation: 3,
        borderRadius: BorderRadius.circular(50),
        child: CircleAvatar(
          backgroundColor: const Color(0xFF26282D),
          radius: 36,
          child: Text(
            label,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }

  // Static rows for layout
  static List<Widget> row1(Function(String) onPressed) => [
        Buttons(
          label: reset,
          textColor: Color.fromARGB(255, 164, 62, 54),
          onPressed: onPressed,
        ),
        Buttons(
            label: openBr,
            textColor: Color.fromARGB(255, 48, 110, 160),
            onPressed: onPressed),
        Buttons(
            label: closeBr,
            textColor: Color.fromARGB(255, 48, 110, 160),
            onPressed: onPressed),
        Buttons(
            label: mul,
            textColor: Color.fromARGB(255, 48, 110, 160),
            onPressed: onPressed),
      ];

  static List<Widget> row2(Function(String) onPressed) => [
        Buttons(
            label: sign,
            textColor: Color.fromARGB(255, 48, 110, 160),
            onPressed: onPressed),
        Buttons(
            label: percentage,
            textColor: Color.fromARGB(255, 48, 110, 160),
            onPressed: onPressed),
        Buttons(
            label: sqrt,
            textColor: Color.fromARGB(255, 48, 110, 160),
            onPressed: onPressed),
        Buttons(
            label: div,
            textColor: Color.fromARGB(255, 48, 110, 160),
            onPressed: onPressed),
      ];

  static List<Widget> row3(Function(String) onPressed) => [
        Buttons(label: num7, onPressed: onPressed),
        Buttons(label: num8, onPressed: onPressed),
        Buttons(label: num9, onPressed: onPressed),
        Buttons(
            label: sub,
            textColor: Color.fromARGB(255, 48, 110, 160),
            onPressed: onPressed),
      ];

  static List<Widget> row4(Function(String) onPressed) => [
        Buttons(label: num4, onPressed: onPressed),
        Buttons(label: num5, onPressed: onPressed),
        Buttons(label: num6, onPressed: onPressed),
        Buttons(
            label: add,
            textColor: Color.fromARGB(255, 48, 110, 160),
            onPressed: onPressed),
      ];

  static List<Widget> row5(Function(String) onPressed) => [
        Buttons(label: num1, onPressed: onPressed),
        Buttons(label: num2, onPressed: onPressed),
        Buttons(label: num3, onPressed: onPressed),
      ];

  static List<Widget> row6(Function(String) onPressed) => [
        Buttons(label: num0, onPressed: onPressed),
        Buttons(label: dot, onPressed: onPressed),
        Buttons(
            label: delete,
            textColor: Color.fromARGB(255, 164, 62, 54),
            onPressed: onPressed),
      ];
}
