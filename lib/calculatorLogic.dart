import 'package:flutter_application_1/buttons.dart';

class Calculatorlogic {
  String displayText = "0"; // Current display text
  String lastOperation = ""; // Last operation pressed
  bool operationPressed = false; // check if an operation was pressed

  void onButtonPressed(String label) {
    if (label == Buttons.reset) {
      displayText = "0";
      lastOperation = "";
      operationPressed = false;
      // ignore: curly_braces_in_flow_control_structures
    } else if ((label == Buttons.add ||
        label == Buttons.sub ||
        label == Buttons.mul ||
        label == Buttons.div))
      displayText += label; // if an operation is pressed cant press again
    lastOperation = label; // store the last operation
    operationPressed = true; // set as operation is pressed
  }
}
