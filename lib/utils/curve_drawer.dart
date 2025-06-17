import 'package:flutter/material.dart';

class CurvedCornerPainter extends CustomPainter {
  final double radius;
  final Color color;

  const CurvedCornerPainter({required this.radius, this.color = Colors.black});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    final mainPath = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width - radius, 0)
      // The control point (size.width, 0) pulls the curve towards the top-right corner,
      // while the end point (size.width, radius) defines where the curve ends on the right edge.
      ..quadraticBezierTo(size.width, 0, size.width, radius)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    final fullRect = Path()
      ..addRect(Rect.fromLTWH(0, 0, size.width, size.height));

    final invertedPath = Path.combine(
      PathOperation.difference,
      fullRect,
      mainPath,
    );

    canvas.drawPath(invertedPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
