import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'route_names.dart';
import 'router_guards.dart';
import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/auth/presentation/screens/register_screen.dart';
import '../../features/auth/presentation/screens/forgot_password_screen.dart';
import '../../features/auth/presentation/screens/role_selection_screen.dart';
import '../../features/home/presentation/screens/home_screen.dart';
import '../../features/emergency/presentation/screens/active_emergency_screen.dart';
import '../../features/emergency/presentation/screens/emergency_map_screen.dart';
import '../../features/emergency/presentation/screens/emergency_instructions_screen.dart';
import '../../features/teacher/presentation/screens/class_roster_screen.dart';
import '../../features/teacher/presentation/screens/teacher_dashboard_screen.dart';
import '../../features/admin/presentation/screens/overview/admin_overview_screen.dart';
import '../../features/admin/presentation/screens/users/user_list_screen.dart';
import '../../features/admin/presentation/screens/users/user_detail_screen.dart';
import '../../features/admin/presentation/screens/users/user_form_screen.dart';
import '../../features/admin/presentation/screens/classes/class_list_screen.dart';
import '../../features/admin/presentation/screens/classes/class_detail_screen.dart';
import '../../features/admin/presentation/screens/classes/class_form_screen.dart';
import '../../features/admin/presentation/screens/map/admin_realtime_map_screen.dart';
import '../../features/emergency_management/presentation/screens/start_emergency_screen.dart';
import '../../features/emergency_management/presentation/screens/active_emergency_control_screen.dart';
import '../../features/emergency_management/presentation/screens/end_emergency_screen.dart';
import '../../features/notifications/presentation/screens/notification_center_screen.dart';
import '../../features/account/presentation/screens/profile_screen.dart';
import '../../features/account/presentation/screens/edit_profile_screen.dart';
import '../../features/account/presentation/screens/change_password_screen.dart';
import '../../features/account/presentation/screens/delete_account_screen.dart';
import '../../features/settings/presentation/screens/settings_screen.dart';
import '../../features/settings/presentation/screens/school_config_screen.dart';
import '../../features/settings/presentation/screens/emergency_types_screen.dart';
import '../../features/settings/presentation/screens/notification_templates_screen.dart';
import '../../features/settings/presentation/screens/role_permissions_screen.dart';
import '../../features/location/presentation/screens/location_permission_screen.dart';

/// Riverpod provider that exposes the configured [GoRouter] instance.
/// Guards redirect unauthenticated users to [RouteNames.login] and
/// role-gate restricted routes via [RouterGuards].
final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    debugLogDiagnostics: kDebugMode,
    initialLocation: RouteNames.login,
    redirect: (context, state) => RouterGuards.redirect(ref, state),
    routes: [
      // ── Authentication ──────────────────────────────────────────────
      GoRoute(path: RouteNames.login,            builder: (_, __) => const LoginScreen()),
      GoRoute(path: RouteNames.register,         builder: (_, __) => const RegisterScreen()),
      GoRoute(path: RouteNames.forgotPassword,   builder: (_, __) => const ForgotPasswordScreen()),
      GoRoute(path: RouteNames.roleSelection,    builder: (_, __) => const RoleSelectionScreen()),

      // ── Common ──────────────────────────────────────────────────────
      GoRoute(path: RouteNames.home,             builder: (_, __) => const HomeScreen()),
      GoRoute(path: RouteNames.locationPermission, builder: (_, __) => const LocationPermissionScreen()),

      // ── Account ─────────────────────────────────────────────────────
      GoRoute(path: RouteNames.profile,          builder: (_, __) => const ProfileScreen()),
      GoRoute(path: RouteNames.editProfile,      builder: (_, __) => const EditProfileScreen()),
      GoRoute(path: RouteNames.changePassword,   builder: (_, __) => const ChangePasswordScreen()),
      GoRoute(path: RouteNames.deleteAccount,    builder: (_, __) => const DeleteAccountScreen()),

      // ── Emergency (student/staff view) ──────────────────────────────
      GoRoute(path: RouteNames.activeEmergency,  builder: (_, __) => const ActiveEmergencyScreen()),
      GoRoute(path: RouteNames.emergencyMap,     builder: (_, __) => const EmergencyMapScreen()),
      GoRoute(path: RouteNames.emergencyInstructions, builder: (_, __) => const EmergencyInstructionsScreen()),

      // ── Teacher ─────────────────────────────────────────────────────
      GoRoute(path: RouteNames.teacherDashboard, builder: (_, __) => const TeacherDashboardScreen()),
      GoRoute(path: RouteNames.classRoster,      builder: (_, __) => const ClassRosterScreen()),

      // ── Admin dashboard ─────────────────────────────────────────────
      GoRoute(path: RouteNames.adminOverview,    builder: (_, __) => const AdminOverviewScreen()),
      GoRoute(path: RouteNames.adminUsers,       builder: (_, __) => const UserListScreen()),
      GoRoute(path: RouteNames.adminUserDetail,  builder: (ctx, state) => UserDetailScreen(userId: state.pathParameters['id']!)),
      GoRoute(path: RouteNames.adminUserForm,    builder: (_, __) => const UserFormScreen()),
      GoRoute(path: RouteNames.adminClasses,     builder: (_, __) => const ClassListScreen()),
      GoRoute(path: RouteNames.adminClassDetail, builder: (ctx, state) => ClassDetailScreen(classId: state.pathParameters['id']!)),
      GoRoute(path: RouteNames.adminClassForm,   builder: (_, __) => const ClassFormScreen()),
      GoRoute(path: RouteNames.adminRealtimeMap, builder: (_, __) => const AdminRealtimeMapScreen()),

      // ── Emergency Management (initiator / admin) ─────────────────────
      GoRoute(path: RouteNames.startEmergency,   builder: (_, __) => const StartEmergencyScreen()),
      GoRoute(path: RouteNames.emergencyControl, builder: (_, __) => const ActiveEmergencyControlScreen()),
      GoRoute(path: RouteNames.endEmergency,     builder: (_, __) => const EndEmergencyScreen()),

      // ── Notifications ────────────────────────────────────────────────
      GoRoute(path: RouteNames.notifications,    builder: (_, __) => const NotificationCenterScreen()),

      // ── Settings (admin only) ────────────────────────────────────────
      GoRoute(path: RouteNames.settings,         builder: (_, __) => const SettingsScreen()),
      GoRoute(path: RouteNames.schoolConfig,     builder: (_, __) => const SchoolConfigScreen()),
      GoRoute(path: RouteNames.emergencyTypes,   builder: (_, __) => const EmergencyTypesScreen()),
      GoRoute(path: RouteNames.notificationTemplates, builder: (_, __) => const NotificationTemplatesScreen()),
      GoRoute(path: RouteNames.rolePermissions,  builder: (_, __) => const RolePermissionsScreen()),
    ],
  );
});
