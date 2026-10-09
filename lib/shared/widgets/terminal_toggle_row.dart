import 'package:flutter/material.dart';

import 'package:habit_term/core/theme/app_colors.dart';
import 'package:habit_term/core/theme/app_spacing.dart';
import 'package:habit_term/core/theme/app_typography.dart';
import 'package:habit_term/shared/widgets/terminal_checkbox.dart';

/// `[x] Label` toggle row — a checkbox paired with a tappable label, used
/// for form options (e.g. "Add to today", "Set reminder"). See
/// Design.md §15.
class TerminalToggleRow extends StatelessWidget {
  const TerminalToggleRow({
    super.key,
    required this.label,
    required this.checked,
    this.onChanged,
  });

  final String label;
  final bool checked;
  final ValueChanged<bool>? onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onChanged == null ? null : () => onChanged!(!checked),
      child: Row(
        children: [
          TerminalCheckbox(checked: checked, size: 24),
          const SizedBox(width: AppSpacing.md),
          Text(label, style: AppTypography.body(color: AppColors.text)),
        ],
      ),
    );
  }
}
