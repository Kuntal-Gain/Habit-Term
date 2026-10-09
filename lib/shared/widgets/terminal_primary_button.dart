import 'package:flutter/material.dart';

import 'package:habit_term/core/theme/app_colors.dart';
import 'package:habit_term/core/theme/app_radii.dart';
import 'package:habit_term/core/theme/app_spacing.dart';
import 'package:habit_term/core/theme/app_typography.dart';

/// `[ Label ]` filled primary action button. See Design.md §13.
class TerminalPrimaryButton extends StatelessWidget {
  const TerminalPrimaryButton({
    super.key,
    required this.label,
    this.onTap,
  });

  final String label;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: AppRadii.buttonRadius,
      child: Container(
        width: double.infinity,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.lg),
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: AppRadii.buttonRadius,
        ),
        child: Text(
          '[ $label ]',
          style: AppTypography.command(
            color: AppColors.background,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
