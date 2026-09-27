import 'package:flutter/material.dart';

import 'package:habit_term/core/theme/app_colors.dart';
import 'package:habit_term/core/theme/app_spacing.dart';
import 'package:habit_term/core/theme/app_typography.dart';

/// `Streak` / `Longest Streak` / `Completion Rate` label-value rows.
/// See Design.md §21.
class HabitStreakStats extends StatelessWidget {
  const HabitStreakStats({
    super.key,
    required this.streakDays,
    required this.longestStreakDays,
    required this.completionRate,
  });

  final int streakDays;
  final int longestStreakDays;
  final double completionRate;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _StatRow(label: 'Streak', value: '$streakDays days'),
        const SizedBox(height: AppSpacing.md),
        _StatRow(label: 'Longest Streak', value: '$longestStreakDays days'),
        const SizedBox(height: AppSpacing.md),
        _StatRow(
          label: 'Completion Rate',
          value: '${(completionRate * 100).round()}%',
        ),
      ],
    );
  }
}

class _StatRow extends StatelessWidget {
  const _StatRow({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: AppTypography.body(color: AppColors.text)),
        Text(value, style: AppTypography.body(color: AppColors.warning)),
      ],
    );
  }
}
