/// A single habit entry shown on the `~/today` screen.
class TodayHabit {
  const TodayHabit({
    required this.name,
    required this.completedCount,
    required this.targetCount,
  });

  final String name;
  final int completedCount;
  final int targetCount;

  bool get isCompleted => completedCount >= targetCount;

  String get progressLabel => '$completedCount/$targetCount';
}
