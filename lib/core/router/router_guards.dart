import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'route_names.dart';
import '../../shared/providers/auth_state_provider.dart';
import '../../core/constants/role_constants.dart';

/// Centralised navigation guards evaluated on every route change.
///
/// Rules:
///  • Unauthenticated → redirect to [RouteNames.login]
///  • Authenticated but no role set → redirect to [RouteNames.roleSelection]
///  • Admin-only routes → redirect non-admins to [RouteNames.home]
///  • Initiator-only routes → gate by [RoleConstants.initiator] or higher
abstract final class RouterGuards {
  static const _adminRoutes = {
    RouteNames.adminOverview,
    RouteNames.adminUsers,
    RouteNames.adminUserDetail,
    RouteNames.adminUserForm,
    RouteNames.adminClasses,
    RouteNames.adminClassDetail,
    RouteNames.adminClassForm,
    RouteNames.adminRealtimeMap,
    RouteNames.settings,
    RouteNames.schoolConfig,
    RouteNames.emergencyTypes,
    RouteNames.notificationTemplates,
    RouteNames.rolePermissions,
  };

  static const _initiatorRoutes = {
    RouteNames.startEmergency,
    RouteNames.emergencyControl,
    RouteNames.endEmergency,
  };

  static const _teacherRoutes = {
    RouteNames.teacherDashboard,
    RouteNames.classRoster,
  };

  static const _publicRoutes = {
    RouteNames.login,
    RouteNames.register,
    RouteNames.forgotPassword,
    RouteNames.roleSelection,
    RouteNames.locationPermission,
  };

  static String? redirect(Ref ref, GoRouterState state) {
    final authState = ref.read(authStateProvider);
    final isPublic = _publicRoutes.contains(state.matchedLocation);

    // Not authenticated
    if (authState == null) {
      return isPublic ? null : RouteNames.login;
    }

    // Authenticated but on public route → home
    if (isPublic && state.matchedLocation != RouteNames.roleSelection) {
      return RouteNames.home;
    }

    final role = authState.role;

    // Admin guard
    if (_adminRoutes.contains(state.matchedLocation) &&
        role != RoleConstants.systemAdmin &&
        role != RoleConstants.schoolAdmin) {
      return RouteNames.home;
    }

    // Initiator guard (admin also qualifies)
    if (_initiatorRoutes.contains(state.matchedLocation) &&
        role != RoleConstants.emergencyInitiator &&
        role != RoleConstants.systemAdmin &&
        role != RoleConstants.schoolAdmin) {
      return RouteNames.home;
    }

    // Teacher guard
    if (_teacherRoutes.contains(state.matchedLocation) &&
        role != RoleConstants.teacher &&
        role != RoleConstants.systemAdmin &&
        role != RoleConstants.schoolAdmin) {
      return RouteNames.home;
    }

    return null; // allow navigation
  }
}
