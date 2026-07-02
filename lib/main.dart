import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app.dart';
import 'core/config/firebase_config.dart';
import 'shared/services/notification/push_notification_service.dart';
import 'shared/services/location/background_location_service.dart';

/// Entry point – bootstraps Firebase, background services, then runs the app
/// under a [ProviderScope] so every Riverpod provider is available globally.
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 1. Initialise Firebase
  await Firebase.initializeApp(options: FirebaseConfig.currentPlatform);

  // 2. Initialise background services (location, FCM)
  await PushNotificationService.initialize();
  await BackgroundLocationService.initialize();

  runApp(
    const ProviderScope(
      child: SchoolAuraApp(),
    ),
  );
}
