/// Role constants matching the Firestore `users.role` field values.
/// Used by [RouterGuards], permission checks, and UI conditionals.
abstract final class RoleConstants {
  /// Full platform administrator – manages all schools.
  static const String systemAdmin = 'system_admin';

  /// Manages a single school (users, classes, settings).
  static const String schoolAdmin = 'school_admin';

  /// Authorised to start / end emergency events.
  static const String emergencyInitiator = 'emergency_initiator';

  /// Manages class roster; marks student status during emergencies.
  static const String teacher = 'teacher';

  /// End-user who responds to alerts and shares location.
  static const String student = 'student';

  /// Ordered list used for hierarchical permission checks.
  static const List<String> hierarchy = [
    systemAdmin,
    schoolAdmin,
    emergencyInitiator,
    teacher,
    student,
  ];

  /// Returns true if [role] has at least the privilege level of [minimum].
  static bool hasMinimumRole(String role, String minimum) {
    final roleIdx    = hierarchy.indexOf(role);
    final minimumIdx = hierarchy.indexOf(minimum);
    return roleIdx != -1 && minimumIdx != -1 && roleIdx <= minimumIdx;
  }
}
