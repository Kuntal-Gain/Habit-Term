import 'package:flutter/material.dart';

import 'package:habit_term/core/theme/app_colors.dart';
import 'package:habit_term/core/theme/app_typography.dart';
import 'package:habit_term/features/today/model/today_habit.dart';
import 'package:habit_term/shared/widgets/terminal_checkbox.dart';

/// One `[x] Habit Name        2/2` row on the `~/today` screen.
class TodayHabitTile extends StatelessWidget {
  const TodayHabitTile({super.key, required this.habit});

  final TodayHabit habit;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TerminalCheckbox(checked: habit.isCompleted),
        const SizedBox(width: 16),
        Expanded(
          child: Text(
            habit.name,
            style: AppTypography.body(
              color: habit.isCompleted ? AppColors.textSecondary : AppColors.text,
            ),
          ),
        ),
        Text(
          habit.progressLabel,
          style: AppTypography.body(color: AppColors.text),
        ),
      ],
    );
  }
}
