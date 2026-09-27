/// Generic value formatting helpers for terminal-style output.
abstract class FormattingHelper {
  const FormattingHelper._();

  /// Formats a 0..1 fraction as a whole-number percent string, e.g. `71%`.
  static String percent(double fraction) {
    return '${(fraction.clamp(0, 1) * 100).round()}%';
  }

  /// Renders a block-style progress bar, e.g. `[██████░░░░] 60%`.
  static String blockProgressBar(
    double fraction, {
    int length = 20,
    String filledChar = '█',
    String emptyChar = '░',
  }) {
    final clamped = fraction.clamp(0, 1);
    final filled = (clamped * length).round();
    final empty = length - filled;
    return '[${filledChar * filled}${emptyChar * empty}] ${percent(clamped.toDouble())}';
  }

  /// Pads a right-aligned value to line up with a label, e.g. `2/2`.
  static String ratio(int completed, int target) => '$completed/$target';
}
