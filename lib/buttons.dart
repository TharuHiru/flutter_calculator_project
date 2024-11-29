//IM/2021/011 - G.W.T.Hirushani//

import 'package:flutter/material.dart';

class Buttons extends StatefulWidget {
  // The values of the each button in the calculator
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
  static const String div = "/";

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

  // Constructor of the button
  const Buttons({
    super.key,
    required this.label,
    required this.onPressed,
    this.textColor = Colors.white,
  });

  // Create each rows of buttons
  static List<Widget> row1(Function(String) onPressed) => [
        Buttons(
          label: reset,
          textColor: const Color.fromARGB(255, 164, 62, 54),
          onPressed: onPressed,
        ),
        Buttons(
            label: openBr,
            textColor: const Color.fromARGB(255, 48, 110, 160),
            onPressed: onPressed),
        Buttons(
            label: closeBr,
            textColor: const Color.fromARGB(255, 48, 110, 160),
            onPressed: onPressed),
        //create the history button
        Container(
          padding: const EdgeInsets.all(14.0), // Increase the touch area
          child: IconButton(
            icon: const Icon(
              Icons.history, // Use the history icon
              color: Color.fromARGB(255, 255, 255, 255),
              size: 30, // Match the color
            ),
            onPressed: () => onPressed(''), // Pass 'history' or any label
          ),
        ),
      ];

  static List<Widget> row2(Function(String) onPressed) => [
        Buttons(
            label: add,
            textColor: const Color.fromARGB(255, 48, 110, 160),
            onPressed: onPressed),
        Buttons(
            label: sub,
            textColor: const Color.fromARGB(255, 48, 110, 160),
            onPressed: onPressed),
        Buttons(
            label: mul,
            textColor: const Color.fromARGB(255, 48, 110, 160),
            onPressed: onPressed),
        Buttons(
            label: div,
            textColor: const Color.fromARGB(255, 48, 110, 160),
            onPressed: onPressed),
      ];

  static List<Widget> row3(Function(String) onPressed) => [
        Buttons(label: num7, onPressed: onPressed),
        Buttons(label: num8, onPressed: onPressed),
        Buttons(label: num9, onPressed: onPressed),
        Buttons(
            label: percentage,
            textColor: const Color.fromARGB(255, 48, 110, 160),
            onPressed: onPressed),
      ];

  static List<Widget> row4(Function(String) onPressed) => [
        Buttons(label: num4, onPressed: onPressed),
        Buttons(label: num5, onPressed: onPressed),
        Buttons(label: num6, onPressed: onPressed),
        Buttons(
            label: sqrt,
            textColor: const Color.fromARGB(255, 48, 110, 160),
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
            textColor: const Color.fromARGB(255, 164, 62, 54),
            onPressed: onPressed),
      ];

  @override
  State<Buttons> createState() => _ButtonsState();
}

// Class to create the buttons animation.
class _ButtonsState extends State<Buttons> {
  double _scale = 1.0;

  //when press the button
  void _onTapDown(TapDownDetails details) {
    setState(() {
      _scale = 0.9; // Shrink effect
    });
  }

//When release the button
  void _onTapUp(TapUpDetails details) {
    setState(() {
      _scale = 1.0; // Back to original size
    });
  }

// Widget for creating the button
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: (details) {
        _onTapUp(details);
        widget.onPressed(widget.label);
      },
      onTapCancel: () {
        setState(() {
          _scale = 1.0; // Cancel the effect
        });
      },
      child: Transform.scale(
        scale: _scale,
        child: Material(
          elevation: 3,
          color: Colors.black, // Colour of the button background
          borderRadius: BorderRadius.circular(50),
          child: CircleAvatar(
            backgroundColor: const Color(0xFF26282D),
            radius: 36,
            child: Text(
              widget.label,
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: widget.textColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
