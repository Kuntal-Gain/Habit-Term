/// Generic application-wide constants unrelated to visual design.
///
/// Visual constants (colors, typography, spacing) belong in `core/theme/`
/// instead — see Architecture.md §4.
abstract class AppConstants {
  const AppConstants._();

  static const String appName = 'Habit-Term';

  static const int minHabitNameLength = 1;
  static const int maxHabitNameLength = 60;
  static const int maxHabitNoteLength = 280;
}
