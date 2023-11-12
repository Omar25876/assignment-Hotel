import 'package:flutter/material.dart';

class BackSlashPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    Path path = Path()
      ..moveTo(0, 45)
      ..lineTo(0, size.height)
      ..lineTo(size.width-50, size.height - 50)
      ..moveTo( size.width - 55 ,  0)
      ..lineTo(0, size.height)
      ..lineTo(size.width-50, size.height - 50)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
