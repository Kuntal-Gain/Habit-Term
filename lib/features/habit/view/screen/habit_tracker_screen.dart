import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:habit_term/core/theme/app_colors.dart';
import 'package:habit_term/core/theme/app_spacing.dart';
import 'package:habit_term/features/habit/model/habit_calendar_day.dart';
import 'package:habit_term/features/habit/view/widgets/habit_calendar_grid.dart';
import 'package:habit_term/features/habit/view/widgets/habit_calendar_month_header.dart';
import 'package:habit_term/features/habit/view/widgets/habit_identity_card.dart';
import 'package:habit_term/features/habit/view/widgets/habit_streak_stats.dart';
import 'package:habit_term/shared/widgets/terminal_screen_scaffold.dart';
import 'package:habit_term/shared/widgets/terminal_shortcut_bar.dart';

/// `~/habit/:id` screen — a single habit's calendar, streak, and actions.
///
/// Currently backed by dummy data only; wiring to Riverpod/Hive lands
/// separately. See CLAUDE.md — this screen only composes widgets.
class HabitTrackerScreen extends StatelessWidget {
  const HabitTrackerScreen({super.key, required this.habitId});

  final String habitId;

  static const List<String> _monthLabels = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];

  static final DateTime _visibleMonth = DateTime(2025, 9);
  static final DateTime _selectedDate = DateTime(2025, 9, 26);

  List<HabitCalendarDay> _buildCalendarDays() {
    final firstOfMonth = DateTime(_visibleMonth.year, _visibleMonth.month, 1);
    final leadingOffset = firstOfMonth.weekday - DateTime.monday;
    final gridStart = firstOfMonth.subtract(Duration(days: leadingOffset));

    return List.generate(42, (index) {
      final date = gridStart.add(Duration(days: index));
      return HabitCalendarDay(
        date: date,
        isInCurrentMonth: date.month == _visibleMonth.month,
        isCompleted: date.month == _visibleMonth.month && date.day % 2 == 0,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return TerminalScreenScaffold(
      commandLabel: 'habit/$habitId',
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HabitIdentityCard(
              icon: Icons.menu_book_rounded,
              name: 'Read Book',
              subtitle: 'Daily · 1 time',
            ),
            const SizedBox(height: AppSpacing.xxl),
            HabitCalendarMonthHeader(
              monthLabel:
                  '${_monthLabels[_visibleMonth.month - 1]} ${_visibleMonth.year}',
            ),
            const SizedBox(height: AppSpacing.lg),
            HabitCalendarGrid(
              days: _buildCalendarDays(),
              selectedDate: _selectedDate,
            ),
            const SizedBox(height: AppSpacing.xxl),
            Container(height: 1, color: AppColors.border),
            const SizedBox(height: AppSpacing.xxl),
            const HabitStreakStats(
              streakDays: 12,
              longestStreakDays: 21,
              completionRate: 0.78,
            ),
            const SizedBox(height: AppSpacing.xxl),
            TerminalShortcutBar(
              shortcuts: [
                TerminalShortcut(
                  shortcutKey: '✓',
                  label: 'Mark Done',
                ),
                TerminalShortcut(
                  shortcutKey: 'e',
                  label: 'Edit',
                ),
                TerminalShortcut(
                  shortcutKey: 'd',
                  label: 'Delete',
                ),
                TerminalShortcut(
                  shortcutKey: 'b',
                  label: 'Back',
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
