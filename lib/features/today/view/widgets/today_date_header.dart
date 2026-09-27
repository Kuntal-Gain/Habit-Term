import 'package:flutter/material.dart';

import 'package:habit_term/core/theme/app_colors.dart';
import 'package:habit_term/core/theme/app_typography.dart';

/// Top `Thu, 25 Sep 2025` / `09:41` row on the `~/today` screen.
class TodayDateHeader extends StatelessWidget {
  const TodayDateHeader({
    super.key,
    required this.dateLabel,
    required this.timeLabel,
  });

  final String dateLabel;
  final String timeLabel;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(dateLabel, style: AppTypography.body(color: AppColors.text)),
        Text(timeLabel, style: AppTypography.body(color: AppColors.text)),
      ],
    );
  }
}
