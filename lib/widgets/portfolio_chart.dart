import 'package:flutter/material.dart';
import 'dart:math' as math;

class PortfolioChart extends StatelessWidget {
  const PortfolioChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Portfolio Performance',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 200,
          child: CustomPaint(
            size: const Size(double.infinity, 200),
            painter: _ChartPainter(),
          ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text('1D'),
            Text('1W'),
            Text('1M'),
            Text('3M',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.blue)),
            Text('1Y'),
            Text('ALL'),
          ],
        ),
      ],
    );
  }
}

class _ChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final width = size.width;
    final height = size.height;

    // Generate some random data points for the chart
    final random = math.Random(42); // Fixed seed for consistent results
    final pointCount = 30;
    final points = List.generate(pointCount, (index) {
      final x = width * index / (pointCount - 1);

      // Generate a somewhat realistic looking stock chart
      // with an overall upward trend but some ups and downs
      final normalizedY = 0.5 +
          0.2 * math.sin(index / (pointCount / 5)) +
          0.1 * random.nextDouble() +
          0.01 * index; // Slight upward trend

      final y = height - (normalizedY * height * 0.8);
      return Offset(x, y);
    });

    // Draw the line
    final linePaint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    final path = Path()..moveTo(points.first.dx, points.first.dy);

    for (int i = 1; i < points.length; i++) {
      // Use a cubic bezier curve for smoother lines
      final prevPoint = points[i - 1];
      final currentPoint = points[i];

      final controlPoint1 = Offset(
        prevPoint.dx + (currentPoint.dx - prevPoint.dx) / 3,
        prevPoint.dy,
      );

      final controlPoint2 = Offset(
        prevPoint.dx + 2 * (currentPoint.dx - prevPoint.dx) / 3,
        currentPoint.dy,
      );

      path.cubicTo(
        controlPoint1.dx,
        controlPoint1.dy,
        controlPoint2.dx,
        controlPoint2.dy,
        currentPoint.dx,
        currentPoint.dy,
      );
    }

    canvas.drawPath(path, linePaint);

    // Draw the gradient below the line
    final gradientPath = Path()
      ..addPath(path, Offset.zero)
      ..lineTo(width, height)
      ..lineTo(0, height)
      ..close();

    final gradientPaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Colors.blue.withOpacity(0.3),
          Colors.blue.withOpacity(0.0),
        ],
      ).createShader(Rect.fromLTWH(0, 0, width, height));

    canvas.drawPath(gradientPath, gradientPaint);

    // Add grid lines
    final gridPaint = Paint()
      ..color = Colors.grey.withOpacity(0.2)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    for (int i = 1; i < 4; i++) {
      final y = i * height / 4;
      canvas.drawLine(
        Offset(0, y),
        Offset(width, y),
        gridPaint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
