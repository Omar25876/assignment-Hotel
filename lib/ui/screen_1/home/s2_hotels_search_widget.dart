import 'package:flutter/material.dart';

import '../../../helper/mycliper_hotels_search-widget.dart';
import '../../../helper/mycustom_clipper.dart';
import '../../../shared/styles/colors.dart';

class HotelsSearchWidget extends StatelessWidget {
  HotelsSearchWidget({Key? key}) : super(key: key);

  // Variable to store the width of the screen
  late double w;

  @override
  Widget build(BuildContext context) {
    // Retrieve the width of the screen using MediaQuery
    w = MediaQuery.of(context).size.width;

    // Widget to create a clip path with a container
    return Stack(
      children: [
        ClipPath(
          clipper: MyClipper(),
          // Container for the HotelsSearchWidget
          child: Container(
            // Set padding on the right side of the container
            padding: EdgeInsets.only(right: w * 0.1),
            // Set width and height of the container
            width: 200,
            height: 50,
            // Styling for the container
            decoration: const BoxDecoration(
              color: mainBluePrimaryColor, // Set background color to the primary blue color
            ),
            // Stack to overlay the text and the white curve
            child: const Center(
              child: Text(
                'Hotels Search',
                style: TextStyle(
                  color: Colors.white, // Set text color to white
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),

        Positioned(
          top: 0,
          right: 0,
          bottom: 0,
          child: CustomPaint(
            painter: BackSlashPainter(), // Custom painter for the white curve
          ),
        ),
      ],
    );
  }
}


