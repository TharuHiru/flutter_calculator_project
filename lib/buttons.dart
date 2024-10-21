import 'package:flutter/material.dart';
import 'package:flutter_application_1/calculatorLogic.dart';

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
      {super.key,
      required this.label,
      required this.onPressed,
      this.textColor = Colors.white});

  final String label;
  final Color textColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
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
        Buttons(
            label: reset,
            textColor: const Color.fromARGB(255, 164, 62, 54),
            onPressed: () => Calculatorlogic.onButtonPressed(reset)),
        Buttons(
            label: openBr,
            textColor: const Color.fromARGB(255, 48, 110, 160),
            onPressed: () => Calculatorlogic.onButtonPressed(openBr)),
        Buttons(
            label: closeBr,
            textColor: const Color.fromARGB(255, 48, 110, 160),
            onPressed: () => Calculatorlogic.onButtonPressed(closeBr)),
        Buttons(
            label: mul,
            textColor: const Color.fromARGB(255, 48, 110, 160),
            onPressed: () => Calculatorlogic.onButtonPressed(mul)),
      ];

  static List<Widget> row2() => [
        Buttons(
            label: sign,
            textColor: const Color.fromARGB(255, 48, 110, 160),
            onPressed: () => Calculatorlogic.onButtonPressed(sign)),
        Buttons(
            label: percentage,
            textColor: const Color.fromARGB(255, 48, 110, 160),
            onPressed: () => Calculatorlogic.onButtonPressed(percentage)),
        Buttons(
            label: sqrt,
            textColor: const Color.fromARGB(255, 48, 110, 160),
            onPressed: () => Calculatorlogic.onButtonPressed(sqrt)),
        Buttons(
            label: div,
            textColor: const Color.fromARGB(255, 48, 110, 160),
            onPressed: () => Calculatorlogic.onButtonPressed(div)),
      ];

  static List<Widget> row3() => [
        Buttons(
            label: num7,
            onPressed: () => Calculatorlogic.onButtonPressed(num7)),
        Buttons(
            label: num8,
            onPressed: () => Calculatorlogic.onButtonPressed(num8)),
        Buttons(
            label: num9,
            onPressed: () => Calculatorlogic.onButtonPressed(num9)),
        Buttons(
            label: sub,
            textColor: const Color.fromARGB(255, 48, 110, 160),
            onPressed: () => Calculatorlogic.onButtonPressed(sub)),
      ];

  static List<Widget> row4() => [
        Buttons(
            label: num4,
            onPressed: () => Calculatorlogic.onButtonPressed(num4)),
        Buttons(
            label: num5,
            onPressed: () => Calculatorlogic.onButtonPressed(num5)),
        Buttons(
            label: num6,
            onPressed: () => Calculatorlogic.onButtonPressed(num6)),
        Buttons(
            label: add,
            textColor: const Color.fromARGB(255, 48, 110, 160),
            onPressed: () => Calculatorlogic.onButtonPressed(Buttons.reset)),
      ];

  static List<Widget> row5() => [
        Buttons(
            label: num1,
            onPressed: () => Calculatorlogic.onButtonPressed(num1)),
        Buttons(
            label: num2,
            onPressed: () => Calculatorlogic.onButtonPressed(num2)),
        Buttons(
            label: num3,
            onPressed: () => Calculatorlogic.onButtonPressed(num3)),
      ];

  static List<Widget> row6() => [
        Buttons(
            label: num0,
            onPressed: () => Calculatorlogic.onButtonPressed(num0)),
        Buttons(
            label: dot, onPressed: () => Calculatorlogic.onButtonPressed(dot)),
        Buttons(
            label: delete,
            textColor: const Color.fromARGB(255, 164, 62, 54),
            onPressed: () => Calculatorlogic.onButtonPressed(delete)),
      ];
}
