import 'package:flutter/widgets.dart';

/// Centralized corner radius scale. See Design.md §8.
///
/// The interface should stay mostly sharp — avoid 16px+ or pill shapes.
abstract class AppRadii {
  const AppRadii._();

  static const double smallControl = 4;
  static const double card = 6;
  static const double panel = 8;
  static const double button = 4;

  static const BorderRadius smallControlRadius = BorderRadius.all(
    Radius.circular(smallControl),
  );
  static const BorderRadius cardRadius = BorderRadius.all(
    Radius.circular(card),
  );
  static const BorderRadius panelRadius = BorderRadius.all(
    Radius.circular(panel),
  );
  static const BorderRadius buttonRadius = BorderRadius.all(
    Radius.circular(button),
  );
}
