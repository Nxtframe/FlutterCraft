import 'package:flutter/material.dart';

class CloudPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color.fromARGB(255, 247, 229, 183)
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(0, size.height * 0.3) // Start at top right corner
      ..lineTo(0, size.height) // Draw a straight line to bottom right corner
      ..lineTo(size.width * 0.9,
          size.height) // Draw a straight line to bottom left corner
      ..cubicTo(
        size.width * 0.9,
        size.height, // Control point 1
        size.width * 0.3,
        size.height * 0.7, // Control point 2
        size.width * 0.9,
        size.height * 0.05, // End point of the cloud shape
      )
      ..quadraticBezierTo(
        size.width * 1.1,
        size.height * -0.2, // Control point
        size.width * 0.5,
        size.height * 0.1, // Endpoint of the quadratic Bezier curve
      )

      // )
      ..close(); // Close the path to complete the shape

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class LeftCloudComponent extends StatelessWidget {
  const LeftCloudComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 130,
      height: 130,
      child: CustomPaint(
        painter: CloudPainter(),
      ),
    );
  }
}
