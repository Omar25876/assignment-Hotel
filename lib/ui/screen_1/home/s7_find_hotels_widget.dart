import 'package:flutter/material.dart';

class FindHotelsWidget extends StatelessWidget {
  const FindHotelsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // Padding for the container
      padding: const EdgeInsets.all(8),
      child: const Row(
        // Center align the content horizontally
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Text displaying 'find hotels'
          Text(
            'find Hotels',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
          // SizedBox for spacing between text and icon
          SizedBox(width: 16),
          // Search icon
          Icon(
            Icons.search,
            color: Colors.white,
            size: 38,
          ),
        ],
      ),
    );
  }
}
