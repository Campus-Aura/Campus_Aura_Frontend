/// App-wide miscellaneous constants.
abstract final class AppConstants {
  static const String appName       = 'SchoolAura';
  static const String appVersion    = '1.0.0';

  // ── Pagination ────────────────────────────────────────────────────────
  static const int defaultPageSize  = 20;

  // ── Cache ─────────────────────────────────────────────────────────────
  static const Duration cacheExpiry = Duration(minutes: 15);

  // ── Map ───────────────────────────────────────────────────────────────
  static const double defaultMapZoom   = 15.0;
  static const double clusteringRadius = 50.0;

  // ── Notification channels (Android) ──────────────────────────────────
  static const String emergencyChannel  = 'emergency_alerts';
  static const String generalChannel    = 'general_notifications';
  static const String reminderChannel   = 'reminders';

  // ── Secure storage keys ───────────────────────────────────────────────
  static const String keyAuthToken      = 'auth_token';
  static const String keyUserRole       = 'user_role';
  static const String keySchoolId       = 'school_id';
  static const String keyFcmToken       = 'fcm_token';
}
