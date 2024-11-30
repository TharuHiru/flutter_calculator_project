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
  bool done = false;

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
    RegExp regex =
        RegExp(r'[a-zA-Z]'); // If a letter is there clear the whole thing
    if (regex.hasMatch(displayText)) {
      displayText = "0";
    }
    if(done){
      displayText = "0";
    }
    else
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
    if (!operationPressed) {
      displayText += label;
      lastOperation = label;
      operationPressed = true;
    } else if (operationPressed &&
        !['+', '-', '×', '/'].contains(lastOperation)) {
      displayText += label;
      lastOperation = label;
      operationPressed = true;
    } else {
      displayText = displayText.substring(0, displayText.length - 1) + label;
      lastOperation = label;
      operationPressed = true;
    }
  }

  /// Add a number or digit
void addNumberOrDigit(String label) {
  RegExp regex = RegExp(r'[a-zA-Z]');
  // If the text is 0, delete the 0 and replace it with the label
  if (displayText == Buttons.num0) {
    displayText = label;
  }
  else if (done) {
    displayText = label;
    done = false;
  }
  // Letters mean an error message, so clear the whole thing
  else if (regex.hasMatch(displayText)) {
    displayText = label;
  }
  // Else add the label to the current text
  else {
    // Split the displayText by operations to get the current number
    List<String> parts = displayText.split(RegExp(r'[\+\-\×\÷]'));
    String currentNumber = parts.isNotEmpty ? parts.last : "";

    // Check if adding the number exceeds 15 characters for the current number
    if (currentNumber.length < 15) {
      displayText += label;
    }
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
        addToHistory(displayText, "Cannot divide by zero");
        displayText = "Cannot divide by zero";
        return;
      }
      Parser p = Parser();
      Expression exp = p.parse(displayText.replaceAll('\n', ''));
      double result = exp.evaluate(EvaluationType.REAL, ContextModel());
      String resultStr = result == result.toInt()
          ? result.toInt().toString()
          : result.toString();
      addToHistory(displayText, resultStr);
      displayText = resultStr;
      done = true;
    } on FormatException {
      addToHistory(displayText, "Invalid Expression");
      displayText = "Invalid Expression";
    } catch (e) {
      addToHistory(displayText, "Error");
      displayText = "Error";
    }
  }
}
