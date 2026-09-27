import 'package:flutter/material.dart';

import 'package:habit_term/core/theme/app_colors.dart';
import 'package:habit_term/core/theme/app_typography.dart';

/// `< September 2025 >` month navigation row.
class HabitCalendarMonthHeader extends StatelessWidget {
  const HabitCalendarMonthHeader({
    super.key,
    required this.monthLabel,
    this.onPrevious,
    this.onNext,
  });

  final String monthLabel;
  final VoidCallback? onPrevious;
  final VoidCallback? onNext;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: onPrevious,
          icon: const Icon(Icons.chevron_left, color: AppColors.warning),
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
        ),
        Text(
          monthLabel,
          style: AppTypography.h3(color: AppColors.warning),
        ),
        IconButton(
          onPressed: onNext,
          icon: const Icon(Icons.chevron_right, color: AppColors.warning),
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
        ),
      ],
    );
  }
}
