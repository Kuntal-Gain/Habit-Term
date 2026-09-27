import 'package:flutter/material.dart';

import 'package:habit_term/core/theme/app_colors.dart';
import 'package:habit_term/core/theme/app_spacing.dart';
import 'package:habit_term/core/theme/app_text_constants.dart';
import 'package:habit_term/core/theme/app_typography.dart';
import 'package:habit_term/shared/widgets/terminal_block_progress_bar.dart';

/// `> today` command line, `x / y completed` count, and the block progress
/// bar for the `~/today` screen.
class TodayProgressSection extends StatelessWidget {
  const TodayProgressSection({
    super.key,
    required this.completedCount,
    required this.totalCount,
    this.segmentCount,
  });

  final int completedCount;
  final int totalCount;

  /// Number of blocks to render. Defaults to [totalCount] so each habit
  /// maps to exactly one block.
  final int? segmentCount;

  @override
  Widget build(BuildContext context) {
    final segments = segmentCount ?? totalCount;
    final filledSegments = totalCount == 0
        ? 0
        : ((completedCount / totalCount) * segments).round();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              '${AppTextConstants.promptSymbol} ',
              style: AppTypography.h2(color: AppColors.primary),
            ),
            Text(
              'today',
              style: AppTypography.h2(color: AppColors.primary),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.lg),
        Text(
          '$completedCount / $totalCount completed',
          style: AppTypography.body(color: AppColors.text),
        ),
        const SizedBox(height: AppSpacing.sm),
        TerminalBlockProgressBar(
          segmentCount: segments,
          filledCount: filledSegments,
        ),
      ],
    );
  }
}
