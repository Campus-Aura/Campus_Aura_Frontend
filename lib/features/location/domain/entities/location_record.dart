import 'package:cloud_firestore/cloud_firestore.dart';

/// A point-in-time location record stored in Firestore.
class LocationRecord {
  const LocationRecord({
    required this.id,
    required this.userId,
    required this.schoolId,
    required this.latitude,
    required this.longitude,
    required this.accuracy,
    required this.recordedAt,
    this.altitude,
    this.speed,
    this.emergencyId,
    this.isForeground = false,
  });

  final String   id;
  final String   userId;
  final String   schoolId;
  final double   latitude;
  final double   longitude;

  /// Accuracy in metres.
  final double   accuracy;

  final DateTime recordedAt;
  final double?  altitude;

  /// Speed in m/s.
  final double?  speed;

  /// Non-null when recorded during an active emergency.
  final String?  emergencyId;

  /// True when the app was in foreground emergency mode.
  final bool     isForeground;

  factory LocationRecord.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return LocationRecord(
      id:           doc.id,
      userId:       data['userId']       as String,
      schoolId:     data['schoolId']     as String,
      latitude:     (data['latitude']    as num).toDouble(),
      longitude:    (data['longitude']   as num).toDouble(),
      accuracy:     (data['accuracy']    as num).toDouble(),
      recordedAt:   (data['recordedAt']  as Timestamp).toDate(),
      altitude:     (data['altitude']    as num?)?.toDouble(),
      speed:        (data['speed']       as num?)?.toDouble(),
      emergencyId:  data['emergencyId']  as String?,
      isForeground: (data['isForeground'] as bool?) ?? false,
    );
  }

  Map<String, dynamic> toFirestore() => {
    'userId':       userId,
    'schoolId':     schoolId,
    'latitude':     latitude,
    'longitude':    longitude,
    'accuracy':     accuracy,
    'recordedAt':   Timestamp.fromDate(recordedAt),
    'altitude':     altitude,
    'speed':        speed,
    'emergencyId':  emergencyId,
    'isForeground': isForeground,
  };
}
