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

  // Logic for mathematical functions display
  void onButtonPressed(String label) {
    setState(() {
      if (label == Buttons.reset) {
        displayText = "0";
        lastOperation = "";
        operationPressed = false;
        //logic for the delete button, delete the last text
      } else if (label == Buttons.delete) {
        displayText = displayText.substring(0, displayText.length - 1);
      }
      //logic for the dot button, only one dot can be there in the
      else if (label == Buttons.dot) {
        if (!displayText.contains('.')) {
          displayText += label;
        }
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
        if (operationPressed &&
            ((lastOperation != Buttons.add) &&
                (lastOperation != Buttons.sub) &&
                (lastOperation != Buttons.mul) &&
                (lastOperation != Buttons.div))) {
          displayText = displayText + label;
          lastOperation = label;
          operationPressed = true;
        }
      } else {
        if (displayText == "0") {
          displayText = label;
        } else {
          displayText += label;
        }
        operationPressed = false;
      }
    });
  }

  final Calculatorlogic calculator = Calculatorlogic();

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
                      Container(
                        height: 160,
                        width: 70,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: GestureDetector(
                          onTap: () => onButtonPressed(Buttons.equal),
                          child: const Center(
                            child: Text(
                              Buttons.equal,
                              style: TextStyle(fontSize: 32),
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
