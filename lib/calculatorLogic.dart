import 'package:flutter_application_1/buttons.dart';
import 'package:math_expressions/math_expressions.dart'; // Import the package

class Calculatorlogic {
  String displayText = "0"; // Current display text
  String lastOperation = ""; // Last operation pressed
  bool operationPressed = false; // Check if an operation was pressed
  int openBrCount = 0; // Track the open bracket count

  // Button press handling
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
    } else {
      displayText += Buttons.mul + Buttons.sqrt + Buttons.openBr;
    }
  }

  // Add a dot 
  void Dot() {
    if (!displayText.contains(Buttons.dot)) {
      displayText += Buttons.dot;
    }
  }

  // Add mathematical operation (+, -, *, /)
  void addOperation(String label) {
    if (!operationPressed) {
      displayText += label;
      lastOperation = label;
      operationPressed = true;
    } else if (operationPressed && !['+', '-', '*', '/'].contains(lastOperation)) {
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
    if (displayText == Buttons.num0) {
      displayText = label;
    } else {
      displayText += label;
    }
    operationPressed = false;
  }

  // Evaluate the expression using math_expressions package
  void evaluateExpression() {
    try {
      Parser p = Parser();
      Expression exp = p.parse(displayText); // Parse the expression
      double result = exp.evaluate(EvaluationType.REAL, ContextModel()); // Evaluate the expression
      displayText = result.toString(); // Update the display with the result
    } catch (e) {
      displayText = "Error"; // Handle errors in expression parsing
    }
  }
}
