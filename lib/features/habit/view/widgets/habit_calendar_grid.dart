import 'package:flutter/material.dart';

import 'package:habit_term/core/theme/app_colors.dart';
import 'package:habit_term/core/theme/app_radii.dart';
import 'package:habit_term/core/theme/app_spacing.dart';
import 'package:habit_term/core/theme/app_typography.dart';
import 'package:habit_term/features/habit/model/habit_calendar_day.dart';

/// `Mo Tu We Th Fr Sa Su` header plus the day-number/dot grid for a month.
class HabitCalendarGrid extends StatelessWidget {
  const HabitCalendarGrid({
    super.key,
    required this.days,
    required this.selectedDate,
  });

  final List<HabitCalendarDay> days;
  final DateTime selectedDate;

  static const List<String> _weekdayLabels = [
    'Mo',
    'Tu',
    'We',
    'Th',
    'Fr',
    'Sa',
    'Su',
  ];

  bool _isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            for (final label in _weekdayLabels)
              Expanded(
                child: Center(
                  child: Text(
                    label,
                    style: AppTypography.metadata(color: AppColors.textSecondary),
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(height: AppSpacing.md),
        for (var week = 0; week < days.length ~/ 7; week++)
          Padding(
            padding: EdgeInsets.only(
              bottom: (week + 1) * 7 < days.length ? AppSpacing.sm : 0,
            ),
            child: Row(
              children: [
                for (var i = 0; i < 7; i++)
                  Expanded(
                    child: _CalendarDayCell(
                      day: days[week * 7 + i],
                      isSelected: _isSameDay(
                        days[week * 7 + i].date,
                        selectedDate,
                      ),
                    ),
                  ),
              ],
            ),
          ),
      ],
    );
  }
}

class _CalendarDayCell extends StatelessWidget {
  const _CalendarDayCell({required this.day, required this.isSelected});

  final HabitCalendarDay day;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final textColor = !day.isInCurrentMonth
        ? AppColors.textMuted
        : AppColors.text;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 2),
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.xs),
      decoration: BoxDecoration(
        border: isSelected ? Border.all(color: AppColors.primary) : null,
        borderRadius: AppRadii.smallControlRadius,
      ),
      child: Column(
        children: [
          Text(
            '${day.date.day}',
            style: AppTypography.body(color: textColor),
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(
            day.isCompleted ? '●' : '',
            style: AppTypography.caption(color: AppColors.primary),
          ),
        ],
      ),
    );
  }
}
