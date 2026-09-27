import 'package:flutter/material.dart';

import 'package:habit_term/core/theme/app_colors.dart';

/// Horizontal dashed rule used to separate terminal sections.
class TerminalDashedDivider extends StatelessWidget {
  const TerminalDashedDivider({
    super.key,
    this.color = AppColors.border,
    this.dashWidth = 6,
    this.dashSpace = 4,
    this.thickness = 1,
  });

  final Color color;
  final double dashWidth;
  final double dashSpace;
  final double thickness;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: thickness,
      width: double.infinity,
      child: CustomPaint(
        painter: _DashedLinePainter(
          color: color,
          dashWidth: dashWidth,
          dashSpace: dashSpace,
        ),
      ),
    );
  }
}

class _DashedLinePainter extends CustomPainter {
  const _DashedLinePainter({
    required this.color,
    required this.dashWidth,
    required this.dashSpace,
  });

  final Color color;
  final double dashWidth;
  final double dashSpace;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;
    double x = 0;
    while (x < size.width) {
      canvas.drawRect(Rect.fromLTWH(x, 0, dashWidth, size.height), paint);
      x += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant _DashedLinePainter oldDelegate) {
    return oldDelegate.color != color ||
        oldDelegate.dashWidth != dashWidth ||
        oldDelegate.dashSpace != dashSpace;
  }
}
