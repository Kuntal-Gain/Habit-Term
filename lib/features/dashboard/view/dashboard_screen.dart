import 'package:flutter/material.dart';
import 'package:habit_term/core/extensions/context_extensions.dart';

import 'package:habit_term/core/theme/app_colors.dart';
import 'package:habit_term/core/theme/app_typography.dart';
import 'package:habit_term/shared/widgets/terminal_screen_scaffold.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({
    super.key,
    this.onContinue,
  });

  final VoidCallback? onContinue;

  @override
  Widget build(BuildContext context) {
    return TerminalScreenScaffold(
      commandLabel: 'whoami',
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ─────────────────────────────────────────────
          // Description
          // ─────────────────────────────────────────────

          const _TerminalInfoBox(),

          const SizedBox(height: 42),

          // ─────────────────────────────────────────────
          // Features
          // ─────────────────────────────────────────────

          const _FeatureItem(
            text: 'Track habits',
          ),

          const SizedBox(height: 24),

          const _FeatureItem(
            text: 'Stay consistent',
          ),

          const SizedBox(height: 24),

          const _FeatureItem(
            text: 'Level up your life',
          ),

          // Push the continue control to the bottom of the available body.
          const Spacer(),

          // ─────────────────────────────────────────────
          // Continue
          // ─────────────────────────────────────────────

          

          const SizedBox(height: 14),
        ],
      ),
    );
  }
}

class _TerminalInfoBox extends StatelessWidget {
  const _TerminalInfoBox();

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _DashedBorderPainter(
        color: AppColors.primary,
        strokeWidth: 1.5,
        radius: 8,
        dashWidth: 7,
        dashSpace: 5,
      ),
      child: SizedBox(
        width: context.screenWidth ,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 28,
            vertical: 28,
          ),
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: AppTypography.body(
                color: AppColors.primary,
              ),
              children: [
                TextSpan(
                  text: 'A habit tracker for\n',
                  style: AppTypography.body(
                    color: AppColors.warning,
                  ),
                ),
                TextSpan(
                  text: 'people who love progress.',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _FeatureItem extends StatelessWidget {
  const _FeatureItem({
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 40),
      child: Row(
        children: [
          Icon(
            Icons.done,
            color: AppColors.primary,
            size: 20,
          ),

          const SizedBox(width: 16),

          Text(
            text,
            style: AppTypography.body(
              color: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }
}

class _TerminalPinIcon extends StatelessWidget {
  const _TerminalPinIcon();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 24,
      height: 30,
      child: CustomPaint(
        painter: _TerminalPinPainter(
          color: AppColors.primary,
        ),
      ),
    );
  }
}

class _TerminalPinPainter extends CustomPainter {
  const _TerminalPinPainter({
    required this.color,
  });

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.square;

    final center = Offset(size.width / 2, 9);

    // Head.
    canvas.drawCircle(
      center,
      7,
      paint,
    );

    // Stem.
    canvas.drawLine(
      Offset(size.width / 2, 16),
      Offset(size.width / 2, 26),
      paint,
    );

    // Small bottom point.
    canvas.drawLine(
      Offset(size.width / 2 - 3, 26),
      Offset(size.width / 2, 29),
      paint,
    );

    canvas.drawLine(
      Offset(size.width / 2, 29),
      Offset(size.width / 2 + 3, 26),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant _TerminalPinPainter oldDelegate) {
    return oldDelegate.color != color;
  }
} 

class _DashedBorderPainter extends CustomPainter {
  const _DashedBorderPainter({
    required this.color,
    required this.strokeWidth,
    required this.radius,
    required this.dashWidth,
    required this.dashSpace,
  });

  final Color color;
  final double strokeWidth;
  final double radius;
  final double dashWidth;
  final double dashSpace;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final path = Path()
      ..addRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(
            strokeWidth / 2,
            strokeWidth / 2,
            size.width - strokeWidth,
            size.height - strokeWidth,
          ),
          Radius.circular(radius),
        ),
      );

    final metrics = path.computeMetrics();

    for (final metric in metrics) {
      double distance = 0;

      while (distance < metric.length) {
        final end = (distance + dashWidth).clamp(
          0.0,
          metric.length,
        );

        canvas.drawPath(
          metric.extractPath(distance, end),
          paint,
        );

        distance += dashWidth + dashSpace;
      }
    }
  }

  @override
  bool shouldRepaint(covariant _DashedBorderPainter oldDelegate) {
    return color != oldDelegate.color ||
        strokeWidth != oldDelegate.strokeWidth ||
        radius != oldDelegate.radius;
  }
}

