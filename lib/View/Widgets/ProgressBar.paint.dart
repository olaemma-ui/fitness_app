import 'dart:developer';

import 'package:fitness_app/View/Widgets/AppUiManager.dart';
import 'package:fitness_app/View/Widgets/ColorManager.dart';
import 'package:flutter/material.dart';

class ProgressPaint extends CustomPainter {
  double completed, strokeWidth, radius;

  ProgressPaint({required this.completed, required this.strokeWidth, required this.radius});

  final pi = (22 / 7);
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = ColorManager.lightBlue
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = strokeWidth;

    final offsetCenter = Offset(
      size.width / 2,
      size.height / 2,
    );

    canvas.drawArc(Rect.fromCircle(center: offsetCenter, radius: radius - 2.0),
        pi / 1.3, (1.49 * (pi * (100 / 100))), false, paint);

    paint.color = ColorManager.green;
    canvas.drawArc(Rect.fromCircle(center: offsetCenter, radius: radius - 2.0),
        pi / 1.3, 1.49 * (pi * (completed / 100)), false, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return this != oldDelegate;
  }
}
