import 'dart:math';

import 'package:flutter_application_1/buttons.dart';
import 'package:math_expressions/math_expressions.dart'; // Import the package

class Calculatorlogic {
  String displayText = "0"; // Current display text
  String lastOperation = ""; // Last operation pressed
  bool operationPressed = false; // Check if an operation was pressed
  int openBrCount = 0; // Track the open bracket count
  String errorMessage = "Invalid input";

  // Button press handling
  void onButtonPressed(String label) {
    switch (label) {
      // check the label passed by the button
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

  // Reset calculator to first state
  void resetCalculator() {
    displayText = Buttons.num0;
    lastOperation = "";
    operationPressed = false;
    openBrCount = 0;
  }

  // Delete the last character
  void deleteLastCharacter() {
    RegExp regex = RegExp(r'[a-zA-Z]');
    if (regex.hasMatch(displayText)) {
      displayText = Buttons.num0;
    }
    if (displayText.length == 1) {
      displayText = Buttons.num0;
    } else {
      displayText = displayText.substring(0, displayText.length - 1);
    }
  }

  // Add open bracket
  void OpenBracket() {
    if (displayText == Buttons.num0) {
      displayText = "(";
    } else {
      displayText += "(";
    }
    openBrCount++;
  }

  // Add close bracket
  void CloseBracket() {
    if (openBrCount > 0) {
      displayText += ")";
      openBrCount--;
    }
  }

  // Add square root operator
  void SquareRoot() {
    if (displayText == Buttons.num0) {
      displayText = Buttons.sqrt + Buttons.openBr;
      openBrCount++;
    } else {
      displayText += Buttons.mul + Buttons.sqrt + Buttons.openBr;
      openBrCount++;
    }
  }

  // Add a dot
  void Dot() {
    RegExp regex = RegExp(r'(\d+\.?\d*)$');
    Match? match = regex.firstMatch(displayText);

    // If there is no match or the last number does not contain a dot, add a dot
    if (match == null || !match.group(0)!.contains(Buttons.dot)) {
      displayText += Buttons.dot;
    }
  }

  // Add mathematical operation (+, -, *, /)
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

  // Add a number or digit
  void addNumberOrDigit(String label) {
    RegExp regex = RegExp(r'[a-zA-Z]');
    //if the text is 0 delete the 0 and replace the label
    if (displayText == Buttons.num0) {
      displayText = label;
    } 
    // letters means a error message. so clear the whole thing
    else if (regex.hasMatch(displayText)) {
      displayText = label;
    } 
    //else add the label to the currunt text
    else {
      displayText += label;
    }
    operationPressed = false;
  }

  // method to calculate percentage
  void percentage() {
    //do nothing when the number is 0
    if (displayText == Buttons.num0) {
      return;
    }
    // Find the last number in the displayText
    RegExp regex = RegExp(r'(\d+\.?\d*)$');
    Match match = regex.firstMatch(displayText) as Match;

    String numberStr = match.group(0)!;
    double number = double.parse(numberStr);
    number = number / 100;
    displayText = displayText.substring(0, match.start) + number.toString();
  }

  // Evaluate the expression using math_expressions package
  void evaluateExpression() {
    try {
      // Check for square root notation and replace it with the calculated value
      RegExp sqrtRegex = RegExp(r'√\(([^)]+)\)');
      displayText = displayText.replaceAllMapped(sqrtRegex, (match) {
        String valueStr = match.group(1)!;
        double value = double.parse(valueStr);
        double sqrtValue = sqrt(value);
        return sqrtValue.toString();
      });

      displayText = displayText.replaceAll('×', '*');

      // Check for division by zero
      if (displayText.contains('/0')) {
        displayText = "Cannot divide by zero";
        return;
      }

      // Parse and evaluate the modified expression
      Parser p = Parser();
      Expression exp = p.parse(displayText);
      double result = exp.evaluate(EvaluationType.REAL, ContextModel());
      displayText = result.toString();
    } on FormatException {
      displayText = "Invalid Expression";
    } catch (e) {
      displayText = "Error";
    }
  }
}
