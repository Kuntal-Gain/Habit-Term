import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'hive_service.dart';

/// Exposes [HiveService] for dependency injection into feature data layers.
/// See Architecture.md §33.
final hiveServiceProvider = Provider<HiveService>((ref) {
  return const HiveService();
});
