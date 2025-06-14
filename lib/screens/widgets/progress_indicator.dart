import 'package:flutter/material.dart';

class ProgressCircle extends StatelessWidget {
  final double currentValue;
  final double targetValue;
  final double size;
  final Color fillColor;
  final Color backgroundColor;
  final double strokeWidth;

  const ProgressCircle({
    super.key,
    required this.currentValue,
    this.targetValue = 100,
    this.size = 60,
    this.fillColor = Colors.blue,
    this.backgroundColor = const Color(0xFFE0E0E0),
    this.strokeWidth = 20.0,
  });

  @override
  Widget build(BuildContext context) {
    final progress = (currentValue / targetValue).clamp(0.0, 1.0);

    return SizedBox(
      // Wrap the Column with SizedBox
      height:
          size + 40, // Increase the height to accommodate the extra 40 pixels
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: size,
            height: size,
            child: Transform(
              alignment: Alignment.center,
              transform: Matrix4.rotationY(3.1416),
              child: CircularProgressIndicator(
                value: progress,
                strokeWidth: strokeWidth,
                backgroundColor: backgroundColor,
                valueColor: AlwaysStoppedAnimation<Color>(fillColor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
