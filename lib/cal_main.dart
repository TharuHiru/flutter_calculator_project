import 'package:flutter/material.dart';

class CalMain extends StatefulWidget {
  const CalMain({super.key});

  @override
  State<CalMain> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<CalMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Display the calculator under the top app bar
      body: SafeArea(
        bottom: false, // dont apply this to bottom bar
        child: Column(
          children: [
            //Top part with displaying math
            Expanded(
              child: SingleChildScrollView(
                // The big numbers should scrollable
                child: Container(
                  alignment: Alignment.topRight,
                  padding: const EdgeInsets.all(15), //Padding around the number
                  child: Text(
                    "0",
                    style: const TextStyle(
                        fontSize: 48, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),

            //Bottom path with buttons
            Wrap(
              children: [],
            )
          ],
        ),
      ),
    ); // Basic Structure of the app
  }
}
