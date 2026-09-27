/// Generic, application-wide [num] convenience getters.
extension NumExtensions on num {
  double clampPercent() => clamp(0, 100).toDouble();

  double get toFraction => clamp(0, 1).toDouble();
}
