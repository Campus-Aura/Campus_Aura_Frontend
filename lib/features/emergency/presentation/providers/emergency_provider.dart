import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/di/injection_container.dart';
import '../../../../shared/providers/auth_state_provider.dart';
import '../data/repositories/emergency_repository_impl.dart';
import '../domain/entities/emergency.dart';
import '../domain/entities/response_action.dart';
import '../domain/usecases/watch_emergency_stream.dart';
import '../domain/usecases/submit_response_action.dart';
import '../domain/usecases/toggle_location_sharing.dart';

// ── Repository ────────────────────────────────────────────────────────────

final emergencyRepositoryProvider = Provider<EmergencyRepositoryImpl>((ref) {
  return EmergencyRepositoryImpl(
    firestoreService: ref.watch(firestoreServiceProvider),
  );
});

// ── Use-cases ─────────────────────────────────────────────────────────────

final watchEmergencyStreamProvider = StreamProvider.autoDispose<Emergency?>((ref) {
  final repo     = ref.watch(emergencyRepositoryProvider);
  final authUser = ref.watch(authStateProvider).value;
  if (authUser == null) return const Stream.empty();

  return WatchEmergencyStream(repo).call(authUser.schoolId);
});

final submitResponseActionProvider = Provider<SubmitResponseAction>((ref) {
  return SubmitResponseAction(ref.watch(emergencyRepositoryProvider));
});

final toggleLocationSharingProvider = StateProvider<bool>((ref) => false);

// ── Response Actions Stream ───────────────────────────────────────────────

/// Streams all [ResponseAction]s for the current active emergency.
/// Consumed by the admin map and teacher roster screens.
final responseActionsStreamProvider =
    StreamProvider.autoDispose.family<List<ResponseAction>, String>(
  (ref, emergencyId) {
    final repo = ref.watch(emergencyRepositoryProvider);
    return repo.watchResponseActions(emergencyId);
  },
);
