import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

import 'package:habit_term/core/helpers/date_helper.dart';
import 'package:habit_term/core/routing/app_routes.dart';
import 'package:habit_term/core/theme/app_spacing.dart';
import 'package:habit_term/features/today/model/today_habit.dart';
import 'package:habit_term/features/today/view/widgets/today_date_header.dart';
import 'package:habit_term/features/today/view/widgets/today_habit_list.dart';
import 'package:habit_term/features/today/view/widgets/today_progress_section.dart';
import 'package:habit_term/shared/widgets/terminal_quote_box.dart';
import 'package:habit_term/shared/widgets/terminal_screen_scaffold.dart';
import 'package:habit_term/shared/widgets/terminal_shortcut_bar.dart';

/// `~/today` screen — today's habits and completion progress.
///
/// Currently backed by dummy data only; wiring to Riverpod/Hive lands
/// separately. See CLAUDE.md — this screen only composes widgets.
class TodayScreen extends StatelessWidget {
  const TodayScreen({super.key});

  static const List<TodayHabit> _dummyHabits = [
    TodayHabit(name: 'Drink Water', completedCount: 2, targetCount: 2),
    TodayHabit(name: 'Workout', completedCount: 1, targetCount: 1),
    TodayHabit(name: 'Read Book', completedCount: 0, targetCount: 1),
    TodayHabit(name: 'Meditate', completedCount: 1, targetCount: 1),
    TodayHabit(name: 'No Social Media', completedCount: 0, targetCount: 1),
  ];

  int get _completedHabitCount =>
      _dummyHabits.where((habit) => habit.isCompleted).length;

  void _handleCommand(BuildContext context, String command) {
    switch (command) {
      case '1':
        context.push(AppRoutes.addHabit);
      case '2':
        context.push(AppRoutes.stats);
      case '3':
        context.push(AppRoutes.settings);
      case '4':
        context.pop();
      default:
        context.push(command);
    }
  }

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();

    return TerminalScreenScaffold(
      commandLabel: '~/today',
      suggestions: const [
        '1',
        '2',
        '3',
        '4',
        AppRoutes.addHabit,
        AppRoutes.stats,
        AppRoutes.settings,
        '/habit/1',
      ],
      onSubmit: (command) => _handleCommand(context, command),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TodayDateHeader(
              dateLabel: DateHelper.formatLongDate(now),
              timeLabel: DateHelper.formatTime(now),
            ),
            const SizedBox(height: AppSpacing.lg),
            const TerminalQuoteBox(
              quote: 'Discipline is just\nself-love in the terminal.',
              attribution: 'anonymous',
            ),
            const SizedBox(height: AppSpacing.xxl),
            TodayProgressSection(
              completedCount: _completedHabitCount,
              totalCount: _dummyHabits.length,
            ),
            const SizedBox(height: AppSpacing.xxl),
            TodayHabitList(habits: _dummyHabits),
            const SizedBox(height: AppSpacing.xxl),
            TerminalShortcutBar(
              shortcuts: [
                TerminalShortcut(
                  shortcutKey: '1',
                  label: 'Add Habit',
                  onTap: () => context.push(AppRoutes.addHabit),
                ),
                TerminalShortcut(
                  shortcutKey: '2',
                  label: 'View Stats',
                  onTap: () => context.push(AppRoutes.stats),
                ),
                TerminalShortcut(
                  shortcutKey: '3',
                  label: 'Settings',
                  onTap: () => context.push(AppRoutes.settings),
                ),
                TerminalShortcut(
                  shortcutKey: '4',
                  label: 'Quit',
                  onTap: () => context.pop(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
