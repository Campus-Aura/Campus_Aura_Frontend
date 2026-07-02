/// Firestore collection / document path constants.
/// Centralising these prevents typos across data-sources and repositories.
abstract final class FirebaseConstants {
  // ── Collections ──────────────────────────────────────────────────────
  static const String users             = 'users';
  static const String schools           = 'schools';
  static const String emergencies       = 'emergencies';
  static const String emergencyTypes    = 'emergency_types';
  static const String classes           = 'classes';
  static const String notifications     = 'notifications';
  static const String locationRecords   = 'location_records';
  static const String responseActions   = 'response_actions';
  static const String notifTemplates    = 'notification_templates';
  static const String rolePermissions   = 'role_permissions';

  // ── Sub-collections ──────────────────────────────────────────────────
  static const String roster            = 'roster';          // schools/{id}/classes/{id}/roster
  static const String history           = 'history';         // emergencies/{id}/history

  // ── Storage paths ────────────────────────────────────────────────────
  static const String avatarsPath       = 'avatars';
  static const String schoolLogosPath   = 'school_logos';

  // ── FCM topic prefixes ───────────────────────────────────────────────
  static const String topicSchool       = 'school_';         // school_{schoolId}
  static const String topicClass        = 'class_';          // class_{classId}
  static const String topicGrade        = 'grade_';          // grade_{gradeLevel}
}
