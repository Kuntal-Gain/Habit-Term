import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_radii.dart';
import 'app_typography.dart';

/// Assembles the Flutter [ThemeData] from the centralized design tokens.
///
/// Features must consume this theme rather than defining their own colors
/// or typography. See Design.md §34 and Architecture.md §5.
abstract class AppTheme {
  const AppTheme._();

  static ThemeData get dark {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.background,
      fontFamily: AppTypography.body().fontFamily,
      colorScheme: const ColorScheme.dark(
        surface: AppColors.background,
        primary: AppColors.primary,
        secondary: AppColors.primaryDim,
        error: AppColors.danger,
        onSurface: AppColors.text,
        onPrimary: AppColors.background,
      ),
      textTheme: TextTheme(
        displayLarge: AppTypography.display(),
        headlineLarge: AppTypography.h1(),
        headlineMedium: AppTypography.h2(),
        headlineSmall: AppTypography.h3(),
        bodyLarge: AppTypography.body(),
        bodyMedium: AppTypography.command(),
        labelMedium: AppTypography.metadata(),
        labelSmall: AppTypography.caption(),
        titleMedium: AppTypography.stats(),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.background,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        titleTextStyle: AppTypography.h2(),
        iconTheme: const IconThemeData(color: AppColors.primary),
      ),
      dividerTheme: const DividerThemeData(
        color: AppColors.border,
        thickness: 1,
        space: 1,
      ),
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: AppColors.primary,
        selectionColor: AppColors.primaryDim,
        selectionHandleColor: AppColors.primary,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.surface,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 10,
        ),
        border: OutlineInputBorder(
          borderRadius: AppRadii.smallControlRadius,
          borderSide: const BorderSide(color: AppColors.border),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: AppRadii.smallControlRadius,
          borderSide: const BorderSide(color: AppColors.border),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: AppRadii.smallControlRadius,
          borderSide: const BorderSide(color: AppColors.primary),
        ),
        hintStyle: AppTypography.body(color: AppColors.textMuted),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.background,
          textStyle: AppTypography.command(color: AppColors.background),
          shape: RoundedRectangleBorder(borderRadius: AppRadii.buttonRadius),
          elevation: 0,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.primary,
          side: const BorderSide(color: AppColors.border),
          textStyle: AppTypography.command(),
          shape: RoundedRectangleBorder(borderRadius: AppRadii.buttonRadius),
        ),
      ),
      checkboxTheme: CheckboxThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(2),
        ),
        side: const BorderSide(color: AppColors.border),
        fillColor: WidgetStateProperty.resolveWith(
          (states) => states.contains(WidgetState.selected)
              ? AppColors.primary
              : Colors.transparent,
        ),
      ),
    );
  }
}
