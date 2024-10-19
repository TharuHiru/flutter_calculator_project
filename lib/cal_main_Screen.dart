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
        MediaQuery.of(context).size; // THis will give the screen size
    final buttonHeight =
        screenSize.height * 2 / 3; // calculate the size of the borrom area
    return Scaffold(
      // Display the calculator under the top app bar
      body: SafeArea(
        bottom: false, // dont apply this to bottom bar
        child: Column(
          children: [
            //Top part with displaying math
            Expanded(
              flex: 1,
              child: SingleChildScrollView(
                // The big numbers should scrollable
                child: Container(
                  alignment: Alignment.topRight,
                  padding: const EdgeInsets.all(15), //Padding around the number
                  //Text which the value is displayed
                  child: Text(
                    "0",
                    style: const TextStyle(
                        fontSize: 48, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),

            //Bottom path with buttons
            Container(
              height: buttonHeight,
              child: GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    mainAxisSpacing: 1,
                    crossAxisSpacing: 8,
                  ),
                  itemCount: Buttons.values.length,
                  itemBuilder: (context, index) {
                    String value = Buttons.values[index];

                    // If it's the 20th button, give it a height for two rows
                    if (value == Buttons.equal) {
                      return GridTile(
                        child: SizedBox(
                          height: (screenSize.width / 5) *
                              2, // Double height for two rows
                          child: buttonStyle(value),
                        ),
                      );
                    }
                    return GridTile(
                      child: SizedBox(
                        width: screenSize.width / 4, // Four columns
                        height:
                            screenSize.width / 5, // Regular height for one row
                        child: buttonStyle(value),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }

// Styling of the each button
  Widget buttonStyle(value) {
    return InkWell(
      onTap: () {},
      child: Center(
        child: CircleAvatar(
            // Add each number to inside a circle avatar
            radius: 30,
            backgroundColor: Colors.blue,
            child: Text(
              value,
              style: TextStyle(color: Colors.white),
            )),
      ),
    );
  }
}
