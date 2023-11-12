import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {


    final path = Path();
    path.lineTo(50, 0); // start at the top left corner

    // draw the top right edge

    path.lineTo(size.width - 50, 0);


    // draw the bottom right edge
    path.lineTo(size.width , size.height);

    // draw the bottom left edge
    path.lineTo(0, size.height);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}