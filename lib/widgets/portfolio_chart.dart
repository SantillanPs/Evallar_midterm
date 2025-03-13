import 'package:flutter/material.dart';
import 'dart:math' as math;

class PortfolioChart extends StatelessWidget {
  const PortfolioChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Portfolio Performance',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: colorScheme.onSurface,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: colorScheme.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                '+12.4% YTD',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: colorScheme.primary,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 200,
          child: CustomPaint(
            size: const Size(double.infinity, 200),
            painter: _ChartPainter(
              lineColor: colorScheme.primary,
              gradientTopColor: colorScheme.primary.withOpacity(0.3),
              gradientBottomColor: colorScheme.primary.withOpacity(0.0),
              gridColor: colorScheme.onSurface.withOpacity(0.1),
            ),
          ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _TimeframeButton(label: '1D', isSelected: false),
            _TimeframeButton(label: '1W', isSelected: false),
            _TimeframeButton(label: '1M', isSelected: false),
            _TimeframeButton(label: '3M', isSelected: true),
            _TimeframeButton(label: '1Y', isSelected: false),
            _TimeframeButton(label: 'ALL', isSelected: false),
          ],
        ),
      ],
    );
  }
}

class _TimeframeButton extends StatelessWidget {
  final String label;
  final bool isSelected;

  const _TimeframeButton({
    required this.label,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: isSelected ? colorScheme.primary : Colors.transparent,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          color: isSelected ? colorScheme.onPrimary : colorScheme.onSurface,
          fontSize: 13,
        ),
      ),
    );
  }
}

class _ChartPainter extends CustomPainter {
  final Color lineColor;
  final Color gradientTopColor;
  final Color gradientBottomColor;
  final Color gridColor;

  _ChartPainter({
    required this.lineColor,
    required this.gradientTopColor,
    required this.gradientBottomColor,
    required this.gridColor,
  });

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

    // Draw the grid lines
    final gridPaint = Paint()
      ..color = gridColor
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

    // Draw the gradient below the line
    final gradientPath = Path()..moveTo(points.first.dx, points.first.dy);

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

      gradientPath.cubicTo(
        controlPoint1.dx,
        controlPoint1.dy,
        controlPoint2.dx,
        controlPoint2.dy,
        currentPoint.dx,
        currentPoint.dy,
      );
    }

    // Complete the gradient path
    gradientPath.lineTo(width, height);
    gradientPath.lineTo(0, height);
    gradientPath.close();

    final gradientPaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          gradientTopColor,
          gradientBottomColor,
        ],
      ).createShader(Rect.fromLTWH(0, 0, width, height));

    canvas.drawPath(gradientPath, gradientPaint);

    // Draw the line
    final linePath = Path()..moveTo(points.first.dx, points.first.dy);

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

      linePath.cubicTo(
        controlPoint1.dx,
        controlPoint1.dy,
        controlPoint2.dx,
        controlPoint2.dy,
        currentPoint.dx,
        currentPoint.dy,
      );
    }

    final linePaint = Paint()
      ..color = lineColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    canvas.drawPath(linePath, linePaint);

    // Draw dots at the start and end points
    final dotPaint = Paint()
      ..color = lineColor
      ..style = PaintingStyle.fill;

    canvas.drawCircle(points.first, 4, dotPaint);
    canvas.drawCircle(points.last, 4, dotPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
