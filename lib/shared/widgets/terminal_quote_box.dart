import 'package:flutter/material.dart';

import 'package:habit_term/core/theme/app_colors.dart';
import 'package:habit_term/core/theme/app_radii.dart';
import 'package:habit_term/core/theme/app_spacing.dart';
import 'package:habit_term/core/theme/app_typography.dart';

/// Bordered terminal quote panel. See Design.md §35 `TerminalQuote`.
class TerminalQuoteBox extends StatelessWidget {
  const TerminalQuoteBox({
    super.key,
    required this.quote,
    required this.attribution,
  });

  final String quote;
  final String attribution;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.border),
        borderRadius: AppRadii.panelRadius,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '"$quote"',
            style: AppTypography.body(color: AppColors.primaryBright),
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            '- $attribution',
            style: AppTypography.body(color: AppColors.white),
          ),
        ],
      ),
    );
  }
}
