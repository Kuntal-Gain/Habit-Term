import 'package:flutter/material.dart';

/// Centralized terminal color palette. See Design.md §3.
///
/// Never hardcode a `Color(...)` inside a feature or shared widget —
/// consume these tokens instead.
abstract class AppColors {
  const AppColors._();

  // Backgrounds
  static const Color background = Color(0xFF000800);
  static const Color surface = Color(0xFF001008);
  static const Color surfaceElevated = Color(0xFF001810);

  // Borders
  static const Color border = Color(0xFF185040);
  static const Color borderBright = Color(0xFF3CC878);

  // Primary
  static const Color primary = Color(0xFF58F8A0);
  static const Color primaryBright = Color(0xFF70FFB0);
  static const Color primaryDim = Color(0xFF22885A);

  // Text
  static const Color text = Color(0xFFE0FFE9);
  static const Color textSecondary = Color(0xFFA8C8B5);
  static const Color textMuted = Color(0xFF608070);

  // Semantic
  static const Color success = Color(0xFF58F8A0);
  static const Color warning = Color(0xFFFFD66B);
  static const Color danger = Color(0xFFFF6B7A);
  static const Color info = Color(0xFF63E6E2);
  static const Color purple = Color(0xFFD99AFF);

  // Base
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
}
