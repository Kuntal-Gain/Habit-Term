import 'package:flutter/material.dart';

import 'package:habit_term/core/theme/app_colors.dart';
import 'package:habit_term/core/theme/app_radii.dart';
import 'package:habit_term/core/theme/app_spacing.dart';
import 'package:habit_term/core/theme/app_typography.dart';
import 'package:svg_flutter/svg.dart';

/// Icon, name, and `Frequency · Target` subtitle for a single habit.
class HabitIdentityCard extends StatelessWidget {
  const HabitIdentityCard({
    super.key,
    required this.icon,
    required this.name,
    required this.subtitle,
  });

  final IconData icon;
  final String name;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.cardPadding),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.primary),
        borderRadius: AppRadii.panelRadius,
      ),
      child: Row(
        children: [
          Container(
            width: 56,
            height: 56,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.primary),
              borderRadius: AppRadii.cardRadius,
            ),
            child: SvgPicture.asset('assets/icons/task_finisher.svg'),
          ),
          const SizedBox(width: AppSpacing.lg),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(name, style: AppTypography.h2(color: AppColors.text)),
                const SizedBox(height: AppSpacing.xs),
                Text(
                  subtitle,
                  style: AppTypography.body(color: AppColors.textSecondary),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
