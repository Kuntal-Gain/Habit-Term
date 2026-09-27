/// Generic date formatting/calculation helpers.
///
/// Feature-specific date logic (e.g. streak calculation rules) belongs in
/// that feature's use cases, not here.
abstract class DateHelper {
  const DateHelper._();

  static const List<String> _weekdayShort = [
    'Mon',
    'Tue',
    'Wed',
    'Thu',
    'Fri',
    'Sat',
    'Sun',
  ];

  static const List<String> _monthShort = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
  ];

  static String weekdayShort(DateTime date) =>
      _weekdayShort[date.weekday - 1];

  static String monthShort(DateTime date) => _monthShort[date.month - 1];

  /// Formats as `Thu, 25 Sep 2025`.
  static String formatLongDate(DateTime date) {
    return '${weekdayShort(date)}, ${date.day} ${monthShort(date)} ${date.year}';
  }

  /// Formats as `09:41`.
  static String formatTime(DateTime date) {
    final hour = date.hour.toString().padLeft(2, '0');
    final minute = date.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }
}
