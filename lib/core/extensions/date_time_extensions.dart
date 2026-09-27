/// Generic, application-wide [DateTime] convenience getters.
extension DateTimeExtensions on DateTime {
  bool isSameDay(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }

  bool get isToday => isSameDay(DateTime.now());

  bool get isYesterday {
    final yesterday = DateTime.now().subtract(const Duration(days: 1));
    return isSameDay(yesterday);
  }

  DateTime get dateOnly => DateTime(year, month, day);
}
