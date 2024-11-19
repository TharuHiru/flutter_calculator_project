import 'package:flutter_application_1/buttons.dart';

class Calculatorlogic {
  String displayText = "0"; // Current display text
  String lastOperation = ""; // Last operation pressed
  bool operationPressed = false; // check if an operation was pressed
  int openBrCount = 0; // track the open bracket count

  void onButtonPressed(String label) {
   
      if (label == Buttons.reset) {
        displayText = Buttons.num0; // set the text as 0
        lastOperation = ""; // set no last operation
        operationPressed = false; // set no operation was pressed
        openBrCount = 0;
      } else if (label == Buttons.delete) {
        if (displayText.length == 1) {
          //after deleting the most last value , the display should be 0
          displayText = Buttons.num0;
        } else {
          displayText = displayText.substring(
              0, displayText.length - 1); // oe else one value should be reduced
        }
      } else if (label == Buttons.openBr) {
        // If displayText is "0" or the last character is an operator, add an open bracket
        if (displayText == "0" || operationPressed == true) {
          if (displayText == "0") {
            displayText = "(";
          } else {
            displayText = displayText + "(";
          }
          openBrCount++; // Increase open bracket count
        }
      }

      // Close Bracket Logic
      else if (label == Buttons.closeBr) {
        // Only add a close bracket if there are open brackets without matches
        if (openBrCount > 0 && operationPressed == true) {
          displayText += ")";
          openBrCount--; // Decrease open bracket count
        }
      }

      //Logic for the Squareroot
      else if (label == Buttons.sqrt) {
        if (displayText == Buttons.num0) {
          displayText = (Buttons.sqrt + Buttons.openBr);
        } else {
          displayText =
              displayText + (Buttons.mul + Buttons.sqrt + Buttons.openBr);
        }
      }

      //logic for the dot button, only one dot can be there
      else if (label == Buttons.dot) {
        if (!displayText.contains(Buttons.dot)) {
          displayText += label;
        }

        //
      } else if ((label == Buttons.add ||
          label == Buttons.sub ||
          label == Buttons.mul ||
          label == Buttons.div)) {
        //if no operation is pressed the mathematical function is pressed for the first time
        if (!operationPressed) {
          displayText += label; // add the function
          lastOperation = label; // make the last operation as the function
          operationPressed = true; // an operation has pressed
        }
        // if an operation is pressed but the last value is not an operation, then the label should displayed.
        else if (operationPressed &&
            ((lastOperation != Buttons.add) &&
                (lastOperation != Buttons.sub) &&
                (lastOperation != Buttons.mul) &&
                (lastOperation != Buttons.div))) {
          displayText = displayText + label;
          lastOperation = label;
          operationPressed = true;
        } else {
          displayText = displayText.substring(0, displayText.length - 1);
          displayText = displayText + label;
          lastOperation = label;
          operationPressed = true;
        }
      } else {
        //When the
        if (displayText == Buttons.num0) {
          displayText = label;
        } else {
          displayText += label;
        }
        operationPressed = false;
      }
    
  }
}
