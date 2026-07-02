/// Emergency type identifiers and response-action values.
/// These must match the `type` field stored in Firestore [emergencies].
abstract final class EmergencyConstants {
  // ── Emergency types ───────────────────────────────────────────────────
  static const String lockdown  = 'lockdown';
  static const String fire      = 'fire';
  static const String medical   = 'medical';
  static const String weather   = 'weather';
  static const String intruder  = 'intruder';
  static const String chemical  = 'chemical';
  static const String drill     = 'drill';

  // ── Response actions ──────────────────────────────────────────────────
  static const String responseSafe     = 'safe';
  static const String responseNeedHelp = 'need_help';
  static const String responseMissing  = 'missing';
  static const String responseUnknown  = 'unknown';

  // ── Emergency status ──────────────────────────────────────────────────
  static const String statusActive   = 'active';
  static const String statusEnded    = 'ended';
  static const String statusDrill    = 'drill';

  // ── Target scope ─────────────────────────────────────────────────────
  static const String targetSchool = 'school';
  static const String targetClass  = 'class';
  static const String targetGrade  = 'grade';

  // ── Timeouts ─────────────────────────────────────────────────────────
  /// Seconds before a non-responsive user is escalated.
  static const int escalationTimeoutSeconds = 300;
  /// Foreground location update interval during active emergency (seconds).
  static const int foregroundLocationIntervalSeconds = 10;
  /// Background location update interval during normal mode (seconds).
  static const int backgroundLocationIntervalSeconds = 120;
}
