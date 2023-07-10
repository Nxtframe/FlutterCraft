import 'package:craftui/constants/apptheme.dart';
import 'package:flutter/material.dart';

class RightCloudComponent extends StatelessWidget {
  const RightCloudComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      height: 300,
      child: CustomPaint(
        painter: CloudPainter(),
      ),
    );
  }
}

class CloudPainter extends CustomPainter {
  final apptheme = AppTheme();
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color.fromARGB(255, 247, 229, 183)
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(0, 0) // Start at top left corner
      ..lineTo(size.width, 0) // Draw a straight line to the top right corner
      ..lineTo(size.width,
          size.height) // Draw a straight line to the bottom right corner
      ..cubicTo(
          //Little budge In the corner
          size.width,
          size.height, // Control point 1
          size.width * 0.65,
          size.height * 0.9999, // Control point 2
          size.width * 0.7,
          size.height * 0.8)
      ..cubicTo(
          ////Quadratic line to the top
          size.width * 0.7,
          size.height * 0.8, // Control point 1
          size.width * 0.8,
          size.height * 0.1, // Control point 2
          size.width * 0.1,
          size.height * 0)
      ..close(); // Close the path to complete the shape

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
