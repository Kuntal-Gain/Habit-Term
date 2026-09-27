/// Generates locally-unique identifiers for persisted models.
///
/// Offline-first means IDs must be generable without a server round trip.
abstract class IdHelper {
  const IdHelper._();

  static String generate() {
    final timestamp = DateTime.now().microsecondsSinceEpoch;
    final random = (timestamp * 2654435761) % 0xFFFFFFFF;
    return '${timestamp.toRadixString(36)}${random.toRadixString(36)}';
  }
}
