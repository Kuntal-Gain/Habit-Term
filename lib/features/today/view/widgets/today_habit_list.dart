import 'package:flutter/material.dart';

import 'package:habit_term/core/theme/app_spacing.dart';
import 'package:habit_term/features/today/model/today_habit.dart';
import 'package:habit_term/features/today/view/widgets/today_habit_tile.dart';

/// Vertical list of [TodayHabitTile]s for the `~/today` screen.
class TodayHabitList extends StatelessWidget {
  const TodayHabitList({super.key, required this.habits});

  final List<TodayHabit> habits;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (var i = 0; i < habits.length; i++)
          Padding(
            padding: EdgeInsets.only(
              bottom: i == habits.length - 1 ? 0 : AppSpacing.lg,
            ),
            child: TodayHabitTile(habit: habits[i]),
          ),
      ],
    );
  }
}
