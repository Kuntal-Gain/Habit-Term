import 'package:flutter/material.dart';

import 'app_colors.dart';

/// Centralized border widths/styles. See Design.md §7.
///
/// Borders carry the terminal aesthetic — keep them thin (1px) and rely on
/// them (rather than shadows) for visual hierarchy.
abstract class AppBorders {
  const AppBorders._();

  static const double width = 1;

  static const Border defaultBorder = Border.fromBorderSide(
    BorderSide(color: AppColors.border, width: width),
  );

  static const Border focusedBorder = Border.fromBorderSide(
    BorderSide(color: AppColors.borderBright, width: width),
  );

  static const Border primaryBorder = Border.fromBorderSide(
    BorderSide(color: AppColors.primary, width: width),
  );
}
