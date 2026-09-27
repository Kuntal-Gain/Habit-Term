import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:habit_term/core/routing/app_routes.dart';
import 'package:habit_term/core/theme/app_colors.dart';
import 'package:habit_term/core/theme/app_typography.dart';
import 'package:habit_term/shared/widgets/terminal_command_input.dart';

/// Common terminal chrome shared by every screen: a `> <command>` header,
/// a divider, the screen's own [body], and the `/`-command input at the
/// bottom. See CLAUDE.md — screens are skeletons that plug their content
/// into this instead of re-declaring the header/input on their own.
class TerminalScreenScaffold extends StatelessWidget {
  const TerminalScreenScaffold({
    super.key,
    required this.commandLabel,
    required this.body,
    this.suggestions = defaultCommandSuggestions,
    this.onSubmit,
  });

  /// The word shown after `> ` in the header, e.g. `whoami`, `today`, `stats`.
  final String commandLabel;

  final Widget body;
  final List<String> suggestions;

  /// Handles a submitted command. Defaults to `context.push(command)`.
  final ValueChanged<String>? onSubmit;

  static const List<String> defaultCommandSuggestions = [
    AppRoutes.today,
    AppRoutes.addHabit,
    '/habit/1',
    AppRoutes.stats,
    AppRoutes.achievements,
    AppRoutes.inspire,
    AppRoutes.settings,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 18),

              // ─────────────────────────────────────────────
              // Terminal command header
              // ─────────────────────────────────────────────

              Row(
                children: [
                  Text(
                    '> ',
                    style: AppTypography.h2(color: AppColors.primary),
                  ),
                  Text(
                    commandLabel,
                    style: AppTypography.h2(color: AppColors.primary),
                  ),
                ],
              ),

              const SizedBox(height: 28),

              // ─────────────────────────────────────────────
              // Divider
              // ─────────────────────────────────────────────

              Container(
                height: 1,
                width: double.infinity,
                color: AppColors.border,
              ),

              const SizedBox(height: 22),

              // ─────────────────────────────────────────────
              // Screen body
              // ─────────────────────────────────────────────

              Expanded(child: body),

              const SizedBox(height: 14),

              // ─────────────────────────────────────────────
              // Command input
              // ─────────────────────────────────────────────
Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Row(
                children: [
                  Text(
                    'Press ',
                    style: AppTypography.body(
                      color: AppColors.primary,
                    ),
                  ),
                  Text(
                    '[ Enter ]',
                    style: AppTypography.body(
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    ' to continue ',
                    style: AppTypography.body(
                      color: AppColors.primary,
                    ),
                  ),
                  Text(
                    '→',
                    style: AppTypography.body(
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 14),
              TerminalCommandInput(
                suggestions: suggestions,
                onSubmit: onSubmit ?? (command) => context.push(command),
              ),

              const SizedBox(height: 14),
            ],
          ),
        ),
      ),
    );
  }
}
