import 'package:flutter/material.dart';

import 'package:habit_term/core/theme/app_colors.dart';
import 'package:habit_term/core/theme/app_radii.dart';
import 'package:habit_term/core/theme/app_typography.dart';

/// Terminal-style `[x]` / `[ ]` checkbox. See Design.md §15.
class TerminalCheckbox extends StatelessWidget {
  const TerminalCheckbox({
    super.key,
    required this.checked,
    this.size = 28,
  });

  final bool checked;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: checked ? AppColors.primary : null,
        border: Border.all(
          color: checked ? AppColors.primary : AppColors.border,
        ),
        
      ),
      child: checked
          ? Text(
              '[x]',
              style: AppTypography.command(color: AppColors.black),
            )
          : null,
    );
  }
}
