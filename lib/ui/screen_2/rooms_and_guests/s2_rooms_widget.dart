import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_1/providers/provider.dart';

import '../../../shared/styles/colors.dart';

class RoomsWidget extends StatefulWidget {
  const RoomsWidget({Key? key}) : super(key: key);

  @override
  State<RoomsWidget> createState() => _RoomsWidgetState();
}

class _RoomsWidgetState extends State<RoomsWidget> {
  @override
  Widget build(BuildContext context) {
    // Access the provider to get the rooms information
    MyProvider provider = Provider.of<MyProvider>(context);

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
        child: Row(
          children: [
            // Text displaying "Rooms"
            const Expanded(
              child: Text(
                'Rooms',
                style: TextStyle(
                  fontSize: 18,
                  color: greyColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // Button to subtract room
            ElevatedButton(
              style: _buildButtonStyle(
                provider.roomsNumber == 0
                    ? secondaryLightBlueColor
                    : mainBluePrimaryColor,
              ),
              onPressed: () => provider.subtractRoom(),
              child: Icon(
                Icons.remove,
                color: provider.roomsNumber == 0
                    ? secondaryLightBlueColor
                    : mainBluePrimaryColor,
                size: 28,
              ),
            ),
            const SizedBox(width: 16),

            // Text displaying the number of rooms
            Text(
              '${provider.roomsNumber}',
              style: const TextStyle(fontSize: 21, color: Colors.black),
            ),
            const SizedBox(width: 16),

            // Button to add room
            ElevatedButton(
              style: _buildButtonStyle(
                provider.roomsNumber == 4
                    ? secondaryLightBlueColor
                    : mainBluePrimaryColor,
              ),
              onPressed: () => provider.addRoom(),
              child: Icon(
                Icons.add,
                color: provider.roomsNumber == 4
                    ? secondaryLightBlueColor
                    : mainBluePrimaryColor,
                size: 28,
              ),
            ),
          ],
        ),
      ),
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
