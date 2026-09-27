import 'package:hive_flutter/hive_flutter.dart';

import 'hive_adapters.dart';

/// Owns Hive initialization and box lifecycle.
///
/// This is the only place in the app that should call into `Hive`
/// directly for setup — feature data layers depend on this service rather
/// than initializing Hive themselves. See Architecture.md §10.1.
class HiveService {
  const HiveService();

  Future<void> init() async {
    await Hive.initFlutter();
    HiveAdapters.registerAll();
  }

  Future<Box<T>> openBox<T>(String name) {
    if (Hive.isBoxOpen(name)) {
      return Future.value(Hive.box<T>(name));
    }
    return Hive.openBox<T>(name);
  }

  Future<void> closeBox(String name) async {
    if (Hive.isBoxOpen(name)) {
      await Hive.box(name).close();
    }
  }

  Future<void> closeAll() => Hive.close();
}
