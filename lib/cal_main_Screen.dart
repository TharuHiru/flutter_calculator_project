import 'package:flutter/material.dart';
import 'package:flutter_application_1/buttons.dart';
import 'package:flutter_application_1/calculatorLogic.dart';
import 'package:auto_size_text/auto_size_text.dart';

class CalMain extends StatefulWidget {
  const CalMain({super.key});

  @override
  State<CalMain> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<CalMain> {
  String displayText = "0"; // Current display text
  final Calculatorlogic calculator = Calculatorlogic();

/////////////////////////////////////////   Logic call   ///////////////////////////////////////////////////////////////////////////////
  void onButtonPressed(String label) {
    setState(() {
      calculator.onButtonPressed(label);
      displayText = calculator.displayText;
    });
  }

/////////////////////////////////////////Building the screen///////////////////////////////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) { // create the main  screen
    final screenSize = MediaQuery.of(context).size; // get the screen size
    final buttonHeight = screenSize.height * 2 / 3; // set the button section height to 2/3 of the screen height
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
                  child: AutoSizeText(
                    displayText,
                    style: const TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    minFontSize: 20,
                    overflow: TextOverflow.ellipsis,
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
                        color: const Color.fromARGB(255, 36, 86, 143), // Set the background color of the button
                        borderRadius: BorderRadius.circular(
                            40), // Match the border radius
                        child: InkWell(
                          borderRadius: BorderRadius.circular(
                              40), // Ensure ripple stays within rounded corners
                          onTap: () => onButtonPressed(Buttons.equal),
                          splashColor: const Color.fromARGB(150, 255, 255,
                              255), // Set your desired splash color
                          child: Container(
                            height: 160,
                            width: 70,
                            alignment: Alignment.center,
                            child: const Text(
                              Buttons.equal,
                              style: TextStyle(
                                  fontSize: 32,
                                  color:
                                      Colors.white), // Ensure text is readable
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