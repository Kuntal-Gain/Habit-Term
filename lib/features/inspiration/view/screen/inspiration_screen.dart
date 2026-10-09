import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:habit_term/shared/widgets/terminal_screen_scaffold.dart';
import 'package:habit_term/shared/widgets/terminal_shortcut_bar.dart';

import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';

class InspirationScreen extends StatefulWidget {
  const InspirationScreen({super.key});

  @override
  State<InspirationScreen> createState() => _InspirationScreenState();
}

class _InspirationScreenState extends State<InspirationScreen> {
  static const List<String> _quotes = [
    "You don't have to be perfect. You just have to keep showing up.",
    'Discipline is just self-love in the terminal.',
    'Small steps. Big version of you.',
    'Consistency compiles into character.',
  ];

  int _quoteIndex = 0;

  void _nextQuote() {
    setState(() => _quoteIndex = (_quoteIndex + 1) % _quotes.length);
  }

  @override
  Widget build(BuildContext context) {
    return TerminalScreenScaffold(
      commandLabel: '~/ inspiration',
      showCommandInput: true,
      body: Column(
        children: [
          Container(
            height: context.screenHeight * 0.4,
            width: context.screenWidth * 0.9,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.primary),
              borderRadius: BorderRadius.circular(9.5),
            ),
            child: Column(
              children: [
                Image.asset('assets/inspire.png'),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    '"${_quotes[_quoteIndex]}"',
                    style: const TextStyle(fontSize: 17, color: AppColors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.xxl),
          TerminalShortcutBar(
            shortcuts: [
              TerminalShortcut(
                shortcutKey: '1',
                label: 'Next Quote',
                onTap: _nextQuote,
              ),
              TerminalShortcut(
                shortcutKey: '2',
                label: 'Quit',
                onTap: () => context.pop(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
