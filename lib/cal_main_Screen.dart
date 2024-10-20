import 'package:flutter/material.dart';
import 'package:flutter_application_1/buttons.dart';

class CalMain extends StatefulWidget {
  const CalMain({super.key});

  @override
  State<CalMain> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<CalMain> {
  @override
  Widget build(BuildContext context) {
    final screenSize =
        MediaQuery.of(context).size; // This will give the screen size
    final buttonHeight =
        screenSize.height * 2 / 3; // Calculate the size of the bottom area
    final paddingStyle = EdgeInsets.symmetric(horizontal: 25, vertical: 30);
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
                  child: const Text(
                    "0",
                    style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),

            // Bottom box with buttons
            Container(
              padding: paddingStyle,
              height: buttonHeight,
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 49, 48, 48),
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(30))),
              child: const Column(
                children: [
                  Row(
                    // row 1
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Buttons(
                        label: Buttons.reset,
                        textColor: Colors.red,
                      ),
                      Buttons(
                        label: Buttons.openBr,
                        textColor: Colors.blue,
                      ),
                      Buttons(
                        label: Buttons.closeBr,
                        textColor: Colors.blue,
                      ),
                      Buttons(label: Buttons.mul),
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
