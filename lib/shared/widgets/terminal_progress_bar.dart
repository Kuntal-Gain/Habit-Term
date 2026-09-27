import 'package:flutter/material.dart';

import 'package:habit_term/core/theme/app_colors.dart';


class TerminalProgressBar extends StatelessWidget {
  const TerminalProgressBar({
    super.key,
    required this.progress,
    this.height = 20,
  });

  final double progress;
  final double height;

  @override
  Widget build(BuildContext context) {
    final value = progress.clamp(0.0, 1.0);

    return Container(
      height: height,
      decoration: BoxDecoration(
        color: AppColors.background,
        border: Border.all(
          color: Colors.white,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(2),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: Align(
          alignment: Alignment.centerLeft,
          child: FractionallySizedBox(
            widthFactor: value,
            child: Container(
              color: AppColors.primary,
            ),
          ),
        ),
      ),
    );
  }
}

class _TerminalProgressPainter extends CustomPainter {
  const _TerminalProgressPainter({
    required this.progress,
  });

  final double progress;

  @override
  void paint(Canvas canvas, Size size) {
    const borderWidth = 1.0;

    final borderPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderWidth;

    final fillPaint = Paint()
      ..color = AppColors.primary
      ..style = PaintingStyle.fill;

    // Pixelated rectangular border.
    canvas.drawRect(
      Rect.fromLTWH(
        0,
        0,
        size.width - 1,
        size.height - 1,
      ),
      borderPaint,
    );

    // Progress fill.
    final progressWidth = (size.width - 2) * progress;

    if (progressWidth > 0) {
      canvas.drawRect(
        Rect.fromLTWH(
          1,
          1,
          progressWidth,
          size.height - 2,
        ),
        fillPaint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant _TerminalProgressPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}