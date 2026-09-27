/// Centralized route path constants. See Architecture.md §41.
///
/// Feature screens and `AppRouting` should reference these instead of
/// inlining path strings, so route paths stay consistent across the app.
abstract class AppRoutes {
  const AppRoutes._();

  static const String splash                      = '/';
  static const String dashboard                   = '/dashboard';
  static const String today                       = '/today';
  static const String addHabit                    = '/add';
  static const String habit                       = '/habit/:id';
  static const String stats                       = '/stats';
  static const String achievements                = '/achievements';
  static const String settings                    = '/settings';
  static const String inspire                     = '/inspire';
  static const String complete                    = '/complete';

  static String habitPath(String id)              => '/habit/$id';
}
