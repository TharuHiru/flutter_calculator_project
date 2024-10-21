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

  const Buttons({
    Key? key,
    required this.label,
    required this.onPressed,
    this.textColor = Colors.white,
  }) : super(key: key);

  final String label;
  final Color textColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      splashColor: Colors.grey.withOpacity(0.5), // Splash color for feedback
      highlightColor: Colors.grey[300], // Highlight color when pressed
      borderRadius: BorderRadius.circular(50),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.black,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 4),
              blurRadius: 8,
            ),
          ],
        ),
        child: CircleAvatar(
          backgroundColor: Color(0xFF26282D), // Avatar color
          radius: 36,
          child: Center(
            // Center the text in the CircleAvatar
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
      ),
    );
  }

  static List<Widget> row1(Calculatorlogic calculator) => [
        Buttons(
            label: reset,
            textColor: const Color.fromARGB(255, 164, 62, 54),
            onPressed: () {
              print("Reset button pressed");
              calculator.onButtonPressed(reset);
            }),
        Buttons(
            label: openBr,
            textColor: const Color.fromARGB(255, 48, 110, 160),
            onPressed: () => calculator.onButtonPressed(openBr)),
        Buttons(
            label: closeBr,
            textColor: const Color.fromARGB(255, 48, 110, 160),
            onPressed: () => calculator.onButtonPressed(closeBr)),
        Buttons(
            label: mul,
            textColor: const Color.fromARGB(255, 48, 110, 160),
            onPressed: () => calculator.onButtonPressed(mul)),
      ];

  static List<Widget> row2(Calculatorlogic calculator) => [
        Buttons(
            label: sign,
            textColor: const Color.fromARGB(255, 48, 110, 160),
            onPressed: () => calculator.onButtonPressed(sign)),
        Buttons(
            label: percentage,
            textColor: const Color.fromARGB(255, 48, 110, 160),
            onPressed: () => calculator.onButtonPressed(percentage)),
        Buttons(
            label: sqrt,
            textColor: const Color.fromARGB(255, 48, 110, 160),
            onPressed: () => calculator.onButtonPressed(sqrt)),
        Buttons(
            label: div,
            textColor: const Color.fromARGB(255, 48, 110, 160),
            onPressed: () => calculator.onButtonPressed(div)),
      ];

  static List<Widget> row3(Calculatorlogic calculator) => [
        Buttons(label: num7, onPressed: () => calculator.onButtonPressed(num7)),
        Buttons(label: num8, onPressed: () => calculator.onButtonPressed(num8)),
        Buttons(label: num9, onPressed: () => calculator.onButtonPressed(num9)),
        Buttons(
            label: sub,
            textColor: const Color.fromARGB(255, 48, 110, 160),
            onPressed: () => calculator.onButtonPressed(sub)),
      ];

  static List<Widget> row4(Calculatorlogic calculator) => [
        Buttons(label: num4, onPressed: () => calculator.onButtonPressed(num4)),
        Buttons(label: num5, onPressed: () => calculator.onButtonPressed(num5)),
        Buttons(label: num6, onPressed: () => calculator.onButtonPressed(num6)),
        Buttons(
            label: add,
            textColor: const Color.fromARGB(255, 48, 110, 160),
            onPressed: () => calculator.onButtonPressed(Buttons.reset)),
      ];

  static List<Widget> row5(Calculatorlogic calculator) => [
        Buttons(label: num1, onPressed: () => calculator.onButtonPressed(num1)),
        Buttons(label: num2, onPressed: () => calculator.onButtonPressed(num2)),
        Buttons(label: num3, onPressed: () => calculator.onButtonPressed(num3)),
      ];

  static List<Widget> row6(Calculatorlogic calculator) => [
        Buttons(label: num0, onPressed: () => calculator.onButtonPressed(num0)),
        Buttons(label: dot, onPressed: () => calculator.onButtonPressed(dot)),
        Buttons(
            label: delete,
            textColor: const Color.fromARGB(255, 164, 62, 54),
            onPressed: () => calculator.onButtonPressed(delete)),
      ];
}
