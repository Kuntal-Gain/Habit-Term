import '../constants/app_constants.dart';

/// Generic input validation helpers.
abstract class ValidationHelper {
  const ValidationHelper._();

  static bool isValidHabitName(String value) {
    final trimmed = value.trim();
    return trimmed.length >= AppConstants.minHabitNameLength &&
        trimmed.length <= AppConstants.maxHabitNameLength;
  }

  static bool isValidNote(String value) {
    return value.length <= AppConstants.maxHabitNoteLength;
  }
}
