import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  // Numbers
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

  // Basic operations
  static const String add = "+";
  static const String sub = "-";
  static const String mul = "×";
  static const String div = "÷";

  // Others
  static const String equal = "=";
  static const String percentage = "%";
  static const String dot = ".";
  static const String sqrt = "√";
  static const String openBr = "(";
  static const String closeBr = ")";
  static const String sign = "+/-";

  static const String delete = "del";
  static const String reset = "C";
  const Buttons(
      {super.key, required this.label, this.textColor = Colors.white});

  final String label;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Handle button tap
      },
      child: Material(
        // material button
        elevation: 3,
        color: Colors.black,
        borderRadius: BorderRadius.circular(50), // round shadow
        child: CircleAvatar(
          backgroundColor: Color(0xFF26282D), // Avatar color
          radius: 36,
          child: Text(
            label,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: textColor, // Added white text color for better contrast
            ),
          ),
        ),
      ),
    );
  }

  static List<Widget> row1() => [
        const Buttons(
          label: reset,
          textColor: Color.fromARGB(255, 164, 62, 54),
        ),
        const Buttons(
          label: openBr,
          textColor: Color.fromARGB(255, 48, 110, 160),
        ),
        const Buttons(
          label: closeBr,
          textColor: Color.fromARGB(255, 48, 110, 160),
        ),
        const Buttons(
          label: mul,
        ),
      ];

  static List<Widget> row2() => [
        const Buttons(
          label: sign,
          textColor: Color.fromARGB(255, 48, 110, 160),
        ),
        const Buttons(
          label: percentage,
          textColor: Color.fromARGB(255, 48, 110, 160),
        ),
        const Buttons(
          label: sqrt,
          textColor: Color.fromARGB(255, 48, 110, 160),
        ),
        const Buttons(
          label: div,
        ),
      ];

  static List<Widget> row3() => [
        const Buttons(label: num7),
        const Buttons(label: num8),
        const Buttons(label: num9),
        const Buttons(
          label: sub,
        ),
      ];

  static List<Widget> row4() => [
        const Buttons(label: num4),
        const Buttons(label: num5),
        const Buttons(label: num6),
        const Buttons(
          label: add,
        ),
      ];

  static List<Widget> row5() => [
        const Buttons(label: num1),
        const Buttons(label: num2),
        const Buttons(label: num3),
      ];

  static List<Widget> row6() => [
        const Buttons(label: num0),
        const Buttons(label: dot),
        const Buttons(
            label: delete, textColor: Color.fromARGB(255, 164, 62, 54)),
      ];
}
