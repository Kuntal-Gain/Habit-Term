/// Centralized copy and terminal path strings. See Design.md §11, §36.
///
/// Screens should reference these instead of inlining terminal paths or
/// branding copy so wording stays consistent across the app.
abstract class AppTextConstants {
  const AppTextConstants._();

  // Branding
  static const String appName = 'HABIT-TERM';
  static const String tagline = 'small steps.\nbig version of you.';
  // static const String splashLoading = 'Initializing your better self...';
  static const List<String> splashMessages = [
    'Waking up your better self...',
    'Loading your habits...',
    "Checking today's goals...",
    'Preparing your daily routine...',
    'Restoring your streaks...',
    'Calibrating your consistency...',
    'Analyzing your progress...',
    'Building your focus...',
    'Almost ready. Stay consistent...',
    'Preparing your next win...',
    "You're ready. Let's build better habits.",
  ];

  // Terminal paths (used as screen titles)
  static const String pathToday = '~/today';
  static const String pathAdd = '~/add';
  static const String pathStats = '~/stats';
  static const String pathAchievements = '~/achievements';
  static const String pathSettings = '~/settings';
  static const String pathInspire = '~/inspire';
  static const String pathComplete = '~/complete';
  static String pathHabit(String id) => '~/habit/$id';

  // Prompt symbol
  static const String promptSymbol = '>';
}
