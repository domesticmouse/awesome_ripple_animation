import 'package:flutter/material.dart';

class AnimatedCircle extends CustomPainter {
  AnimatedCircle(this.animation,
      {Key? key,
      this.color = Colors.teal,
      this.minRadius = 150,
      this.wavesCount = 2})
      : super(repaint: animation);

  final Color color;
  final double minRadius;
  final int wavesCount;
  final Animation<double>? animation;

  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = Rect.fromLTRB(0.0, 0.0, size.width, size.height);
    for (int wave = 0; wave <= wavesCount; wave++) {
      circle(
          canvas: canvas,
          rect: rect,
          wave: wave,
          value: animation!.value,
          length: wavesCount,
          minRadius: minRadius);
    }
  }

  void circle({
    required Canvas canvas,
    required Rect rect,
    double? minRadius,
    required int wave,
    required double value,
    int? length,
  }) {
    if (wave != 0) {
      double opacity = (1 - ((wave - 1) / length!) - value).clamp(0.0, 1.0);
      final r = minRadius! * (1 + ((wave * value))) * value;
      final Paint paint = Paint()..color = color.withOpacity(opacity);
      canvas.drawCircle(rect.center, r, paint);
    }
  }

  @override
  bool shouldRepaint(AnimatedCircle oldDelegate) => true;
}
