//IM/2021/011 - G.W.T.Hirushani//

import 'dart:math';
import 'package:flutter_application_1/buttons.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculatorlogic {
  String displayText = "0"; // text displayes
  String lastOperation = ""; // operation pressed lastly
  bool operationPressed = false; // track if the operation is pressed
  int openBrCount = 0; // open bracket count
  String errorMessage = "Invalid input";
  List<String> history = []; //list to save history

  void addToHistory(String expression, String result) {
    history.add('$expression = $result');
  }

  void clearHistory() {
    history.clear();
  }

  void onButtonPressed(String label) {
    switch (label) {
      case Buttons.reset:
        resetCalculator();
        break;
      case Buttons.delete:
        deleteLastCharacter();
        break;
      case Buttons.openBr:
        OpenBracket();
        break;
      case Buttons.closeBr:
        CloseBracket();
        break;
      case Buttons.sqrt:
        SquareRoot();
        break;
      case Buttons.percentage:
        percentage();
        break;
      case Buttons.dot:
        Dot();
        break;
      case Buttons.add:
      case Buttons.sub:
      case Buttons.mul:
      case Buttons.div:
        addOperation(label);
        break;
      case Buttons.equal:
        evaluateExpression();
        break;
      default:
        addNumberOrDigit(label);
        break;
    }
  }

  // if "C" is pressed reset all
  void resetCalculator() {
    displayText = "0";
    lastOperation = "";
    operationPressed = false;
    openBrCount = 0;
  }

  void deleteLastCharacter() {
    RegExp regex = RegExp(r'[a-zA-Z]'); // If a letter is there clear the whole thing
    if (regex.hasMatch(displayText)) {
      displayText = "0";
    }
    if (displayText.length == 1) // if length is 1 add 0
    {
      displayText = "0";
    } else {
      displayText = displayText.substring(0, displayText.length - 1);
    }
  }

  void OpenBracket() {
    if (displayText == "0") {
      displayText = "(";
    } else {
      displayText += "(";
    }
    openBrCount++;
    operationPressed = false;
  }

  void CloseBracket() {
    if (openBrCount > 0) {
      displayText += ")";
      openBrCount--;
    }
  }

  void SquareRoot() {
    if (displayText == "0") {
      displayText = "√(";
      openBrCount++;
    } else {
      displayText += "×√(";
      openBrCount++;
    }
  }

  // each number should have only one decimal point
  void Dot() {
    RegExp regex = RegExp(r'(\d+\.?\d*)$');
    Match? match = regex.firstMatch(displayText);
    if (match == null || !match.group(0)!.contains(".")) {
      displayText += ".";
    }
  }

  void addOperation(String label) {
    List<String> lines = displayText.split('\n');
    String lastLine = lines.isNotEmpty ? lines.last : "";
    if (lastLine.length >= 15) {
      lines.add(label);
    } else {
      lastLine += label;
      lines[lines.length - 1] = lastLine;
    }
    displayText = lines.join('\n');
    lastOperation = label;
    operationPressed = true;
  }

  void addNumberOrDigit(String label) {
    RegExp regex = RegExp(r'[a-zA-Z]');
    if (displayText == Buttons.num0) {
      displayText = label;
    } else if (regex.hasMatch(displayText)) {
      displayText = label;
    } else {
      List<String> lines = displayText.split('\n');
      String lastLine = lines.isNotEmpty ? lines.last : "";
      if (lastLine.length < 15) {
        lastLine += label;
        lines[lines.length - 1] = lastLine;
      } else {
        lines.add(label);
      }
      displayText = lines.join('\n');
    }
    operationPressed = false;
  }

  void percentage() {
    if (displayText == "0") {
      return;
    }
    RegExp regex = RegExp(r'(\d+\.?\d*)$');
    Match match = regex.firstMatch(displayText) as Match;
    String numberStr = match.group(0)!;
    double number = double.parse(numberStr);
    number = number / 100;
    displayText = displayText.substring(0, match.start) + number.toString();
  }

  void evaluateExpression() {
    try {
      RegExp sqrtRegex = RegExp(r'√\(([^)]+)\)');
      displayText = displayText.replaceAllMapped(sqrtRegex, (match) {
        String valueStr = match.group(1)!;
        double value = double.parse(valueStr);
        double sqrtValue = sqrt(value);
        return sqrtValue.toString();
      });
      displayText = displayText.replaceAll('×', '*');
      if (displayText.contains('/0')) {
        displayText = "Cannot divide by zero";
        return;
      }
      Parser p = Parser();
      Expression exp = p.parse(displayText.replaceAll('\n', ''));
      double result = exp.evaluate(EvaluationType.REAL, ContextModel());
      String resultStr = result == result.toInt() ? result.toInt().toString() : result.toString();
      addToHistory(displayText, resultStr);
      displayText = resultStr;
    } on FormatException {
      displayText = "Invalid Expression";
    } catch (e) {
      displayText = "Error";
    }
  }
}