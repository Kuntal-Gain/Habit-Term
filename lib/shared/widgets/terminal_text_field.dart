import 'package:flutter/material.dart';

import 'package:habit_term/core/theme/app_colors.dart';
import 'package:habit_term/core/theme/app_radii.dart';
import 'package:habit_term/core/theme/app_spacing.dart';
import 'package:habit_term/core/theme/app_typography.dart';

/// Bordered terminal-style text input. See Design.md §14.
class TerminalTextField extends StatelessWidget {
  const TerminalTextField({
    super.key,
    this.controller,
    this.hintText,
  });

  final TextEditingController? controller;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.lg,
        vertical: AppSpacing.md,
      ),
      decoration: BoxDecoration(
        color: AppColors.surface,
        border: Border.all(color: AppColors.border),
        borderRadius: AppRadii.panelRadius,
      ),
      child: TextField(
        controller: controller,
        style: AppTypography.body(color: AppColors.text),
        cursorColor: AppColors.primary,
        decoration: InputDecoration(
          isDense: true,
          filled: false,
          contentPadding: EdgeInsets.zero,
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          hintText: hintText,
          hintStyle: AppTypography.body(color: AppColors.textMuted),
        ),
      ),
    );
  }
}
