import 'package:flutter/material.dart';
import 'package:flutter_application_1/buttons.dart';
import 'package:flutter_application_1/calculatorLogic.dart';

class CalMain extends StatefulWidget {
  const CalMain({super.key});

  @override
  State<CalMain> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<CalMain> {
  final Calculatorlogic calculator =
      Calculatorlogic(); // Instance of calculator logic

  @override
  Widget build(BuildContext context) {
    final screenSize =
        MediaQuery.of(context).size; // This will give the screen size
    final buttonHeight =
        screenSize.height * 2 / 3; // Calculate the size of the bottom area
    const paddingStyle = EdgeInsets.symmetric(horizontal: 25, vertical: 30);
    return Scaffold(
      // Display the calculator under the top app bar
      body: SafeArea(
        bottom: false, // Don't apply SafeArea to the bottom bar
        child: Column(
          children: [
            // Top part with displaying math
            Expanded(
              flex: 1,
              child: SingleChildScrollView(
                // The big numbers should be scrollable
                child: Container(
                  alignment: Alignment.topRight,
                  padding:
                      const EdgeInsets.all(15), // Padding around the number
                  // Text where the value is displayed
                  child: Text(
                    calculator.displayText, // value to be displayed
                    style: const TextStyle(
                        fontSize: 48, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),

            // Bottom box with buttons
            Container(
              // full bottom box
              padding: paddingStyle,
              height: buttonHeight,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xFF212224), // bottom box color
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              ),
              child: Column(
                // create a column inside the box
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    // row 1
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: Buttons.row1(calculator),
                  ),
                  Row(
                    // row 2
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: Buttons.row2(calculator),
                  ),
                  Row(
                    // row 3
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: Buttons.row3(calculator),
                  ),
                  Row(
                    // row 4
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: Buttons.row4(calculator),
                  ),
                  Row(
                    // row 5 and 6 is inside this row
                    children: [
                      Expanded(
                        child: Column(
                          // created a separate column inside the row
                          children: [
                            Row(
                              // row 5
                              mainAxisAlignment: MainAxisAlignment
                                  .spaceBetween, // create space between the row
                              children: Buttons.row5(
                                  calculator), // Spread buttons in row 5
                            ),
                            const SizedBox(
                              // to create the space between row 5 and 6
                              height: 10,
                            ),
                            Row(
                              // row 6
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: Buttons.row6(
                                  calculator), // Spread buttons in row 6
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        // add this to create the size between the two rows and the equal button
                        width: 20,
                      ),
                      Container(
                        // equal button
                        height: 160,
                        width: 70,
                        decoration: BoxDecoration(
                            color: (Colors.blue),
                            borderRadius: BorderRadius.circular(40)),
                        child: const Center(
                          // center the value
                          child: Text(
                            Buttons.equal,
                            style: TextStyle(fontSize: 32),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
