// import 'package:flutter/material.dart';

// import 'package:habit_term/core/theme/app_colors.dart';
// import 'package:habit_term/core/theme/app_spacing.dart';
// import 'package:habit_term/core/theme/app_text_constants.dart';
// import 'package:habit_term/core/theme/app_typography.dart';
// import 'package:habit_term/shared/widgets/terminal_progress_bar.dart';

// import '../../../core/extensions/context_extensions.dart';

// /// Boot screen shown while the app initializes (Hive, theme, providers).
// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {

//  double _progress = 0.0;

//   @override
//   void initState() {
//     super.initState();
//     _startLoading();
//   }

//   Future<void> _startLoading() async {
//     const duration = Duration(milliseconds: 250);

//     for (var i = 0; i <= 100; i++) {
//       await Future.delayed(duration);

//       if (!mounted) return;

//       setState(() {
//         _progress = i / 100;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.background,
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xxl),
//           child: Column(
//             children: [
//               const SizedBox(height: AppSpacing.majorSection),
//               Image.asset('assets/brand.png', width: context.screenWidth * 0.55),
//               const SizedBox(height: AppSpacing.lg),
//               Text(
//                 AppTextConstants.tagline,
//                 textAlign: TextAlign.center,
//                 style: AppTypography.body(color: AppColors.textSecondary),
//               ),
//               Expanded(
//                 child: Center(
//                   child: Image.asset(
//                     'assets/splash.png',
//                     fit: BoxFit.contain,
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                 child: const TerminalProgressBar(progress: 0.65),
//               ),
//               const SizedBox(height: AppSpacing.md),
//               Text(
//                 AppTextConstants.splashLoading,
//                 textAlign: TextAlign.center,
//                 style: AppTypography.caption(
//                   color: AppColors.primary,
//                 ),
//               ),
//               const SizedBox(height: AppSpacing.xxl),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:habit_term/core/theme/app_colors.dart';
import 'package:habit_term/core/theme/app_spacing.dart';
import 'package:habit_term/core/theme/app_text_constants.dart';
import 'package:habit_term/core/theme/app_typography.dart';
import 'package:habit_term/shared/widgets/terminal_progress_bar.dart';

import '../../../core/extensions/context_extensions.dart';
import '../../../core/routing/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _progress = 0.0;

  @override
  void initState() {
    super.initState();
    _startLoading();
  }

  Future<void> _startLoading() async {
    const duration = Duration(milliseconds: 50);

    for (var i = 0; i <= 100; i++) {
      await Future.delayed(duration);

      if (!mounted) return;

      setState(() {
        _progress = i / 100;
      });
    }

    context.go(AppRoutes.dashboard);
  }

  String get _loadingMessage {
    final messages = AppTextConstants.splashMessages;

    final index = (_progress * messages.length)
        .floor()
        .clamp(0, messages.length - 1);

    return messages[index];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: AppSpacing.majorSection),
        
            Padding(
               padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.xxl,
          ),
              child: Image.asset(
                'assets/brand.png',
                width: context.screenWidth * 0.55,
              ),
            ),
        
            const SizedBox(height: AppSpacing.lg),
        
            Padding(
              padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.xxl,
          ),
              child: Text(
                AppTextConstants.tagline,
                textAlign: TextAlign.center,
                style: AppTypography.body(
                  color: AppColors.primary,
                ),
              ),
            ),
        
            Expanded(
              child: Center(
                child: Image.asset(
                  'assets/splash.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
        
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: TerminalProgressBar(
                progress: _progress,
              ),
            ),
        
            const SizedBox(height: AppSpacing.md),
        
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              child: Text(
                _loadingMessage,
                key: ValueKey(_loadingMessage),
                textAlign: TextAlign.center,
                style: AppTypography.caption(
                  color: Colors.white,
                ),
              ),
            ),
        
             SizedBox(height: context.screenHeight * 0.11),
          ],
        ),
      ),
    );
  }
}