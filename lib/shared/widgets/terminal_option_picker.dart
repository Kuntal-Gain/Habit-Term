import 'package:flutter/material.dart';

import 'package:habit_term/core/theme/app_colors.dart';
import 'package:habit_term/core/theme/app_radii.dart';
import 'package:habit_term/core/theme/app_spacing.dart';
import 'package:habit_term/core/theme/app_typography.dart';

/// Opens a terminal-styled bottom sheet listing [options] and resolves to
/// the one the user selects, or `null` if dismissed without a choice.
Future<String?> showTerminalOptionPicker(
  BuildContext context, {
  required String title,
  required List<String> options,
  String? selected,
}) {
  return showModalBottomSheet<String>(
    context: context,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.surface,
              border: Border.all(color: AppColors.border),
              borderRadius: AppRadii.panelRadius,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(
                    AppSpacing.lg,
                    AppSpacing.lg,
                    AppSpacing.lg,
                    AppSpacing.md,
                  ),
                  child: Text(
                    title,
                    style: AppTypography.command(color: AppColors.primary),
                  ),
                ),
                const Divider(height: 1, color: AppColors.border),
                for (final option in options)
                  InkWell(
                    onTap: () => Navigator.of(context).pop(option),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSpacing.lg,
                        vertical: AppSpacing.md,
                      ),
                      decoration: BoxDecoration(
                        border: option == options.last
                            ? null
                            : const Border(
                                bottom: BorderSide(color: AppColors.border),
                              ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            option,
                            style: AppTypography.body(
                              color: option == selected
                                  ? AppColors.primary
                                  : AppColors.text,
                            ),
                          ),
                          if (option == selected)
                            const Icon(
                              Icons.check,
                              color: AppColors.primary,
                              size: 18,
                            ),
                        ],
                      ),
                    ),
                  ),
                const SizedBox(height: AppSpacing.sm),
              ],
            ),
          ),
        ),
      );
    },
  );
}
