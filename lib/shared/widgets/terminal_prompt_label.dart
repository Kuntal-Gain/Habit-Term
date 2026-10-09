import 'package:flutter/material.dart';

import 'package:habit_term/core/theme/app_colors.dart';
import 'package:habit_term/core/theme/app_text_constants.dart';
import 'package:habit_term/core/theme/app_typography.dart';

/// `> label` prompt used to introduce a form field or section. See
/// Design.md §12.
class TerminalPromptLabel extends StatelessWidget {
  const TerminalPromptLabel({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: '${AppTextConstants.promptSymbol} ',
            style: AppTypography.command(color: AppColors.primary),
          ),
          TextSpan(
            text: label,
            style: AppTypography.command(color: AppColors.primary),
          ),
        ],
      ),
    );
  }
}
