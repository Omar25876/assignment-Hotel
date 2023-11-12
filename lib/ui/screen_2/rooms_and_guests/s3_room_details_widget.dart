import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_1/shared/styles/colors.dart';
import '../../../providers/provider.dart';

class RoomDetailsWidget extends StatefulWidget {
  const RoomDetailsWidget({Key? key}) : super(key: key);

  @override
  State<RoomDetailsWidget> createState() => _RoomDetailsWidgetState();
}

class _RoomDetailsWidgetState extends State<RoomDetailsWidget> {
  late double screenHeight;
  @override
  Widget build(BuildContext context) {
    // Access the provider to get room details information
    MyProvider provider = Provider.of<MyProvider>(context);

    // Retrieve the screen dimensions using MediaQuery
    screenHeight = MediaQuery.of(context).size.height;
    return Card(
      elevation: 9,
      shadowColor: Colors.grey.shade300,
      color: Colors.white,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      borderOnForeground: true,
      semanticContainer: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Title "ROOM 1"
            const Row(
              children: [
                Expanded(
                  child: Text(
                    'ROOM 1',
                    style: TextStyle(
                      fontSize: 16,
                      color: greyColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.02),

            // Section for Adults
            _buildGuestSection(
              'Adults',
              provider.adultNumber,
                  () => provider.subtractAdult(),
                  () => provider.addAdult(),
            ),

            SizedBox(height: screenHeight * 0.03),

            // Section for Children
            _buildGuestSection(
              'Children',
              provider.childrenNumber,
                  () => provider.subtractChildren(),
                  () => provider.addChildren(),
            ),

            // Container for Child Ages
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  _buildChildAgeRow('Age of child 1', '14 years'),
                  SizedBox(height: screenHeight * 0.01),
                  _buildChildAgeRow('Age of child 2', '14 years'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper function to build the guest section
  Widget _buildGuestSection(
      String title,
      int count,
      VoidCallback onSubtract,
      VoidCallback onAdd,
      ) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: const TextStyle(fontSize: 18, color: greyColor),
          ),
        ),
        ElevatedButton(
          style: _buildButtonStyle(
            count == 0
                ? secondaryLightBlueColor
                : mainBluePrimaryColor,
          ),
          onPressed: onSubtract,
          child: Icon(
            Icons.remove,
            color: count == 0
                ? secondaryLightBlueColor
                : mainBluePrimaryColor,
            size: 28,
          ),
        ),
        const SizedBox(width: 16),
        Text(
          '$count',
          style: const TextStyle(fontSize: 21, color: Colors.black),
        ),
        const SizedBox(width: 16),
        ElevatedButton(
          style: _buildButtonStyle(
            count == 4 ?
                  secondaryLightBlueColor
                : mainBluePrimaryColor,
          ),
          onPressed: onAdd,
          child: Icon(
            Icons.add,
            color: count == 4
                ?secondaryLightBlueColor
                : mainBluePrimaryColor,
            size: 28,
          ),
        ),
      ],
    );
  }

  // Helper function to build a row for child age
  Widget _buildChildAgeRow(String title, String age) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: const TextStyle(fontSize: 16, color: Colors.black),
          ),
        ),
        Text(
          age,
          style: const TextStyle(fontSize: 16, color: greyColor),
        ),
      ],
    );
  }

  // Helper function to build button style
  ButtonStyle _buildButtonStyle(Color borderColor) {
    return ButtonStyle(
      backgroundColor: MaterialStateProperty.all(Colors.white),
      visualDensity: VisualDensity.comfortable,
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
          side: BorderSide(color: borderColor),
        ),
      ),
      padding: MaterialStateProperty.all(
        const EdgeInsets.fromLTRB(0, 12, 0, 12),
      ),
    );
  }
}
