import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../shared/services/firebase/firebase_auth_service.dart';
import '../../shared/services/firebase/firestore_service.dart';
import '../../shared/services/firebase/firebase_storage_service.dart';
import '../../shared/services/firebase/firebase_messaging_service.dart';
import '../../shared/services/location/location_service.dart';
import '../../shared/services/location/background_location_service.dart';
import '../../shared/services/notification/push_notification_service.dart';
import '../../shared/services/notification/in_app_notification_service.dart';
import '../../shared/services/storage/secure_storage_service.dart';
import '../../shared/services/storage/local_cache_service.dart';
import '../../shared/repositories/user_repository.dart';
import '../../shared/repositories/school_repository.dart';

// ── Firebase Services ─────────────────────────────────────────────────────

final firebaseAuthServiceProvider = Provider<FirebaseAuthService>(
  (_) => FirebaseAuthService(),
);

final firestoreServiceProvider = Provider<FirestoreService>(
  (_) => FirestoreService(),
);

final firebaseStorageServiceProvider = Provider<FirebaseStorageService>(
  (_) => FirebaseStorageService(),
);

final firebaseMessagingServiceProvider = Provider<FirebaseMessagingService>(
  (_) => FirebaseMessagingService(),
);

// ── Location Services ─────────────────────────────────────────────────────

final locationServiceProvider = Provider<LocationService>(
  (_) => LocationService(),
);

final backgroundLocationServiceProvider = Provider<BackgroundLocationService>(
  (_) => BackgroundLocationService(),
);

// ── Notification Services ─────────────────────────────────────────────────

final pushNotificationServiceProvider = Provider<PushNotificationService>(
  (_) => PushNotificationService(),
);

final inAppNotificationServiceProvider = Provider<InAppNotificationService>(
  (_) => InAppNotificationService(),
);

// ── Storage Services ──────────────────────────────────────────────────────

final secureStorageServiceProvider = Provider<SecureStorageService>(
  (_) => SecureStorageService(),
);

final localCacheServiceProvider = Provider<LocalCacheService>(
  (_) => LocalCacheService(),
);

// ── Shared Repositories ───────────────────────────────────────────────────

final userRepositoryProvider = Provider<UserRepository>((ref) {
  return UserRepository(
    firestoreService: ref.watch(firestoreServiceProvider),
    storageService:   ref.watch(firebaseStorageServiceProvider),
  );
});

final schoolRepositoryProvider = Provider<SchoolRepository>((ref) {
  return SchoolRepository(
    firestoreService: ref.watch(firestoreServiceProvider),
    storageService:   ref.watch(firebaseStorageServiceProvider),
  );
});
