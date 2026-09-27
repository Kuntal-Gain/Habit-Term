/// Centralized 4px-based spacing scale. See Design.md §6.
///
/// Prefer `AppSpacing.md` over a raw literal like `EdgeInsets.all(13)`.
abstract class AppSpacing {
  const AppSpacing._();

  static const double xs = 4;
  static const double sm = 8;
  static const double md = 12;
  static const double lg = 16;
  static const double xl = 20;
  static const double xxl = 24;
  static const double xxxl = 32;
  static const double section = 40;
  static const double majorSection = 48;

  // Recommended defaults, see Design.md §6.
  static const double screenHorizontalPadding = xxl;
  static const double sectionSpacing = xxl;
  static const double cardPadding = lg;
  static const double controlSpacing = md;
  static const double textToIconSpacing = sm;
}
