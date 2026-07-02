import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../di/injection_container.dart';
import '../../shared/models/user_model.dart';

/// Watches Firebase Auth state and resolves the full [UserModel] from
/// Firestore (including role) on every auth-state change.
///
/// Emits `null` when the user is signed out.
final authStateProvider = StreamProvider<UserModel?>((ref) {
  final authService      = ref.watch(firebaseAuthServiceProvider);
  final userRepository   = ref.watch(userRepositoryProvider);

  return authService.authStateChanges.asyncMap((firebaseUser) async {
    if (firebaseUser == null) return null;
    return userRepository.getUserById(firebaseUser.uid);
  });
});
