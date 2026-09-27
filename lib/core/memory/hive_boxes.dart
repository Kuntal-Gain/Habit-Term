/// Names of Hive boxes used across the app.
///
/// Feature data layers open boxes by these names through [HiveService];
/// they must not hardcode box name strings themselves. See Architecture.md
/// §10.1.
abstract class HiveBoxes {
  const HiveBoxes._();

  // Feature boxes are added here as features are implemented, e.g.:
  // static const String habits = 'habits';
}
