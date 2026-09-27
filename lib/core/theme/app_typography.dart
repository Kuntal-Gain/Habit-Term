import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_font_sizes.dart';

/// Centralized JetBrains Mono text styles. See Design.md §4.
///
/// Do not create ad hoc `TextStyle` instances inside widgets when one of
/// these already expresses the intent.
abstract class AppTypography {
  const AppTypography._();

  static const String fontFamily = 'JetBrainsMono';

  static TextStyle _base({
    required double fontSize,
    required FontWeight fontWeight,
    double letterSpacing = 0,
    Color color = AppColors.text,
  }) {
    return TextStyle(
      fontFamily: fontFamily,
      fontSize: fontSize,
      fontWeight: fontWeight,
      letterSpacing: letterSpacing,
      color: color,
    );
  }

  /// Display — 32px Bold, letter spacing 6px. Used for branding (HABIT-TERM).
  static TextStyle display({
    Color color = AppColors.primary,
    FontWeight fontWeight = FontWeight.w700,
  }) => _base(
    fontSize: AppFontSizes.display,
    fontWeight: fontWeight,
    letterSpacing: 6,
    color: color,
  );

  /// H1 — 24px Bold, letter spacing 1px.
  static TextStyle h1({
    Color color = AppColors.text,
    FontWeight fontWeight = FontWeight.w700,
  }) => _base(
    fontSize: AppFontSizes.h1,
    fontWeight: fontWeight,
    letterSpacing: 1,
    color: color,
  );

  /// H2 — 18px SemiBold.
  static TextStyle h2({
    Color color = AppColors.text,
    FontWeight fontWeight = FontWeight.w600,
  }) => _base(fontSize: AppFontSizes.h2, fontWeight: fontWeight, color: color);

  /// H3 — 16px SemiBold.
  static TextStyle h3({
    Color color = AppColors.text,
    FontWeight fontWeight = FontWeight.w600,
  }) => _base(fontSize: AppFontSizes.h3, fontWeight: fontWeight, color: color);

  /// Body — 14px Regular.
  static TextStyle body({
    Color color = AppColors.text,
    FontWeight fontWeight = FontWeight.w400,
  }) => _base(
    fontSize: AppFontSizes.body,
    fontWeight: fontWeight,
    color: color,
  );

  /// Command — 14px Medium. Used for prompts (`>`) and interactive commands.
  static TextStyle command({
    Color color = AppColors.primary,
    FontWeight fontWeight = FontWeight.w500,
  }) => _base(
    fontSize: AppFontSizes.command,
    fontWeight: fontWeight,
    color: color,
  );

  /// Metadata — 12px Regular.
  static TextStyle metadata({
    Color color = AppColors.textSecondary,
    FontWeight fontWeight = FontWeight.w400,
  }) => _base(
    fontSize: AppFontSizes.metadata,
    fontWeight: fontWeight,
    color: color,
  );

  /// Caption — 11px Regular.
  static TextStyle caption({
    Color color = AppColors.textMuted,
    FontWeight fontWeight = FontWeight.w400,
  }) => _base(
    fontSize: AppFontSizes.caption,
    fontWeight: fontWeight,
    color: color,
  );

  /// Stats — 16px Bold. Used for numeric stat values.
  static TextStyle stats({
    Color color = AppColors.text,
    FontWeight fontWeight = FontWeight.w700,
  }) => _base(
    fontSize: AppFontSizes.stats,
    fontWeight: fontWeight,
    color: color,
  );
}
