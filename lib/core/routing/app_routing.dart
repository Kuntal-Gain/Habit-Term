import 'package:go_router/go_router.dart';
import 'package:habit_term/features/add_habit/view/screen/add_habit_screen.dart';
import 'package:habit_term/features/dashboard/view/dashboard_screen.dart';

import 'package:habit_term/features/habit/view/screen/habit_tracker_screen.dart';
import 'package:habit_term/features/splash/view/splash_screen.dart';
import 'package:habit_term/features/today/view/screen/today_screen.dart';

import '../../features/inspiration/view/screen/inspiration_screen.dart';
import 'app_routes.dart';

/// Centralized GoRouter configuration. See Architecture.md §41.
///
/// Feature routes are registered here as their screens are implemented.
/// Add new `GoRoute` entries pointing at the paths defined in [AppRoutes].
abstract class AppRouting {
  const AppRouting._();

  static final GoRouter router = GoRouter(
    initialLocation: AppRoutes.splash,
    routes: [
      GoRoute(
        path: AppRoutes.splash,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: AppRoutes.dashboard,
        builder: (context, state) => const IntroScreen(),
      ),
      GoRoute(
        path: AppRoutes.today,
        builder: (context, state) => const TodayScreen(),
      ),
      GoRoute(
        path: AppRoutes.addHabit,
        builder: (context, state) => const AddHabitScreen(),
      ),
      GoRoute(
        path: AppRoutes.habit,
        builder: (context, state) => HabitTrackerScreen(
          habitId: state.pathParameters['id'] ?? '1',
        ),
      ),
      GoRoute(
        path : AppRoutes.inspire,
        builder : (_ , _) => InspirationScreen(),
      ),
    ],
  );
}
