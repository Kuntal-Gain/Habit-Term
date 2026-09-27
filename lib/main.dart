import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/memory/hive_service.dart';
import 'core/routing/app_routing.dart';
import 'core/theme/app_text_constants.dart';
import 'core/theme/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await const HiveService().init();
  runApp(const ProviderScope(child: HabitTermApp()));
}

class HabitTermApp extends StatelessWidget {
  const HabitTermApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: AppTextConstants.appName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.dark,
      routerConfig: AppRouting.router,
    );
  }
}
