import 'package:craftui/constants/appDimensions.dart';
import 'package:flutter/material.dart';

class CustomShapePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final width = size.width;
    final height = size.height;
    final radius = height * 0.15;
    final path = Path();

    // top-left
    path.moveTo(0, 0);

    // top line to top-right
    path.lineTo(width, 0);

    //  straight line to bottom-right
    path.lineTo(width, height);

    // cloud shape from bottom-left to bottom-right
    path.cubicTo(
        width, height, width * 0.9, height * 1.2, width * 0.66, height * 0.9);
    //Second Shape
    path.cubicTo(width * 0.7, height * 0.9, width * 0.5, height * 1.2,
        width * 0.337, height * 0.9);
    //Third Shape
    path.cubicTo(width * 0.337, height * 0.9, width * 0.15, height * 1.2,
        width * 0, height * 0.99);
    // straight line to bottom-left
    path.lineTo(0, height);

    // Close the path
    path.close();

    // Set the paint properties
    final paint = Paint()
      ..color = const Color.fromARGB(255, 99, 24, 175)
      ..style = PaintingStyle.fill;

    // Draw the path on the canvas
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomShapePainter oldDelegate) => false;
}

class CloudShapeWidget extends StatelessWidget {
  const CloudShapeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppDimensions.screenWidth(context),
      height: AppDimensions.screenHeight(context),
      child: CustomPaint(
        painter: CustomShapePainter(),
      ),
    );
  }
}
