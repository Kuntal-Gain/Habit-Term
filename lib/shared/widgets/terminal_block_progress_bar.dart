import 'package:flutter/material.dart';

import 'package:habit_term/core/theme/app_colors.dart';
import 'package:habit_term/core/theme/app_radii.dart';
import 'package:habit_term/core/theme/app_spacing.dart';

/// Segmented block-style progress bar. See Design.md §16.
class TerminalBlockProgressBar extends StatelessWidget {
  const TerminalBlockProgressBar({
    super.key,
    required this.segmentCount,
    required this.filledCount,
    this.height = 20,
  });

  final int segmentCount;
  final int filledCount;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Row(
        children: [
          for (var i = 0; i < segmentCount; i++) ...[
            if (i != 0) const SizedBox(width: AppSpacing.xs),
            Expanded(
              child: Container(
                height: height,
                decoration: BoxDecoration(
                  color: i < filledCount ? AppColors.primary : Colors.transparent,
                  border: Border.all(
                    color: i < filledCount ? AppColors.primary : AppColors.border,
                  ),
                 
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
