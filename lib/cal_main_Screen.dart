import 'package:flutter/material.dart';
import 'package:flutter_application_1/buttons.dart';
import 'package:flutter_application_1/calculatorLogic.dart';

class CalMain extends StatefulWidget {
  const CalMain({super.key});

  @override
  State<CalMain> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<CalMain> {
  String displayText = "0"; // Current display text
  String lastOperation = ""; // Last operation pressed
  bool operationPressed = false; // check if an operation was pressed
  int openBrCount = 0; // track the open bracket count

/////////////////////////////////////////             Display logic     ///////////////////////////////////////////////////////////////////////////////
  void onButtonPressed(String label) {
    setState(() {
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
        if (displayText == "0" ) {
          displayText = "(";
        } else {
            displayText = displayText + "(";
          }
          openBrCount++; // Increase open bracket count
        }

      // Close Bracket Logic
      else if (label == Buttons.closeBr) {
        // Only add a close bracket if there are open brackets without matches
        if (openBrCount > 0 ) {
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
    });
  }

  final Calculatorlogic calculator = Calculatorlogic();

/////////////////////////////////////////             Building the widget              ///////////////////////////////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final buttonHeight = screenSize.height * 2 / 3;
    const paddingStyle = EdgeInsets.symmetric(horizontal: 25, vertical: 30);

    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            // Display section
            Expanded(
              flex: 1,
              child: SingleChildScrollView(
                child: Container(
                  alignment: Alignment.topRight,
                  padding: const EdgeInsets.all(15),
                  child: Text(
                    displayText,
                    style: const TextStyle(
                        fontSize: 48, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),

            // Buttons section
            Container(
              padding: paddingStyle,
              height: buttonHeight,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xFF212224),
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: Buttons.row1(onButtonPressed),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: Buttons.row2(onButtonPressed),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: Buttons.row3(onButtonPressed),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: Buttons.row4(onButtonPressed),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: Buttons.row5(onButtonPressed),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: Buttons.row6(onButtonPressed),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 20),
                        Material(
                          color: Colors.blue, // Set the background color of the button
                          borderRadius: BorderRadius.circular(40), // Match the border radius
                          child: InkWell(
                            borderRadius: BorderRadius.circular(40), // Ensure ripple stays within rounded corners
                            onTap: () => onButtonPressed(Buttons.equal),
                            splashColor: const Color.fromARGB(150, 255, 255, 255), // Set your desired splash color
                            child: Container(
                              height: 160,
                              width: 70,
                              alignment: Alignment.center,
                              child: const Text(
                                Buttons.equal,
                                style: TextStyle(fontSize: 32, color: Colors.white), // Ensure text is readable
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
