/// Centralised route name constants used by [AppRouter] and throughout
/// the codebase for type-safe navigation via GoRouter.
abstract final class RouteNames {
  // ── Auth ──────────────────────────────────────────────────────────────
  static const String login            = '/login';
  static const String register         = '/register';
  static const String forgotPassword   = '/forgot-password';
  static const String roleSelection    = '/role-selection';

  // ── Common ────────────────────────────────────────────────────────────
  static const String home             = '/home';
  static const String locationPermission = '/location-permission';

  // ── Account ───────────────────────────────────────────────────────────
  static const String profile          = '/profile';
  static const String editProfile      = '/profile/edit';
  static const String changePassword   = '/profile/change-password';
  static const String deleteAccount    = '/profile/delete-account';

  // ── Emergency (user view) ─────────────────────────────────────────────
  static const String activeEmergency       = '/emergency/active';
  static const String emergencyMap          = '/emergency/map';
  static const String emergencyInstructions = '/emergency/instructions';

  // ── Teacher ───────────────────────────────────────────────────────────
  static const String teacherDashboard = '/teacher';
  static const String classRoster      = '/teacher/roster';

  // ── Admin dashboard ───────────────────────────────────────────────────
  static const String adminOverview    = '/admin';
  static const String adminUsers       = '/admin/users';
  static const String adminUserDetail  = '/admin/users/:id';
  static const String adminUserForm    = '/admin/users/new';
  static const String adminClasses     = '/admin/classes';
  static const String adminClassDetail = '/admin/classes/:id';
  static const String adminClassForm   = '/admin/classes/new';
  static const String adminRealtimeMap = '/admin/map';

  // ── Emergency Management ──────────────────────────────────────────────
  static const String startEmergency   = '/emergency-management/start';
  static const String emergencyControl = '/emergency-management/control';
  static const String endEmergency     = '/emergency-management/end';

  // ── Notifications ─────────────────────────────────────────────────────
  static const String notifications    = '/notifications';

  // ── Settings ──────────────────────────────────────────────────────────
  static const String settings              = '/settings';
  static const String schoolConfig          = '/settings/school';
  static const String emergencyTypes        = '/settings/emergency-types';
  static const String notificationTemplates = '/settings/notification-templates';
  static const String rolePermissions       = '/settings/role-permissions';
}
