import 'package:flutter/material.dart';

import 'package:habit_term/core/theme/app_spacing.dart';
import 'package:habit_term/core/theme/app_typography.dart';
import 'package:habit_term/shared/widgets/terminal_dashed_border_box.dart';

/// A single `[key] Label` shortcut entry.
class TerminalShortcut {
  const TerminalShortcut({
    required this.shortcutKey,
    required this.label,
    this.onTap,
  });

  final String shortcutKey;
  final String label;
  final VoidCallback? onTap;
}

/// Dashed-topped bar of keyboard shortcuts laid out two per row.
/// See Design.md §31.
class TerminalShortcutBar extends StatelessWidget {
  const TerminalShortcutBar({super.key, required this.shortcuts});

  final List<TerminalShortcut> shortcuts;

  @override
  Widget build(BuildContext context) {
    return TerminalDashedBorderBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          for (var i = 0; i < shortcuts.length; i += 2)
            Padding(
              padding: EdgeInsets.only(
                bottom: i + 2 < shortcuts.length ? AppSpacing.md : 0,
              ),
              child: Row(
                children: [
                  Expanded(child: _ShortcutEntry(shortcut: shortcuts[i])),
                  if (i + 1 < shortcuts.length)
                    Expanded(child: _ShortcutEntry(shortcut: shortcuts[i + 1])),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class _ShortcutEntry extends StatelessWidget {
  const _ShortcutEntry({required this.shortcut});

  final TerminalShortcut shortcut;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: shortcut.onTap,
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: '[${shortcut.shortcutKey}] ',
              style: AppTypography.body(),
            ),
            TextSpan(
              text: shortcut.label,
              style: AppTypography.body(),
            ),
          ],
        ),
      ),
    );
  }
}
