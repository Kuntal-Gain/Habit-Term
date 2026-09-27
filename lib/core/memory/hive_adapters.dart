import 'package:hive_flutter/hive_flutter.dart';

/// Registers Hive [TypeAdapter]s for all persisted models.
///
/// Each persisted model must have a stable `typeId` — see Architecture.md
/// §11. Register new adapters here explicitly typed, e.g.:
///
/// ```dart
/// Hive.registerAdapter<HabitModel>(HabitModelAdapter());
/// ```
abstract class HiveAdapters {
  const HiveAdapters._();

  static void registerAll() {
    // Feature adapters are registered here as features are implemented.
  }
}
