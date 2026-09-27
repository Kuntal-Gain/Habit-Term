/// A single day cell rendered in the habit tracker's month calendar.
class HabitCalendarDay {
  const HabitCalendarDay({
    required this.date,
    required this.isInCurrentMonth,
    required this.isCompleted,
  });

  final DateTime date;
  final bool isInCurrentMonth;
  final bool isCompleted;
}
