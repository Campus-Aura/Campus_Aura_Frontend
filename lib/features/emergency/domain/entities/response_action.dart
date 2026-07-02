import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../core/constants/emergency_constants.dart';

/// A user's response to an active emergency event.
class ResponseAction {
  const ResponseAction({
    required this.id,
    required this.emergencyId,
    required this.userId,
    required this.schoolId,
    required this.action,
    required this.respondedAt,
    this.classId,
    this.latitude,
    this.longitude,
    this.note,
  });

  final String   id;
  final String   emergencyId;
  final String   userId;
  final String   schoolId;

  /// One of [EmergencyConstants.responseSafe], [responseNeedHelp], [responseMissing].
  final String   action;

  final DateTime respondedAt;
  final String?  classId;
  final double?  latitude;
  final double?  longitude;
  final String?  note;

  bool get isSafe      => action == EmergencyConstants.responseSafe;
  bool get needsHelp   => action == EmergencyConstants.responseNeedHelp;
  bool get isMissing   => action == EmergencyConstants.responseMissing;

  factory ResponseAction.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return ResponseAction(
      id:           doc.id,
      emergencyId:  data['emergencyId']  as String,
      userId:       data['userId']       as String,
      schoolId:     data['schoolId']     as String,
      action:       data['action']       as String,
      respondedAt:  (data['respondedAt'] as Timestamp).toDate(),
      classId:      data['classId']      as String?,
      latitude:     (data['latitude']    as num?)?.toDouble(),
      longitude:    (data['longitude']   as num?)?.toDouble(),
      note:         data['note']         as String?,
    );
  }

  Map<String, dynamic> toFirestore() => {
    'emergencyId':  emergencyId,
    'userId':       userId,
    'schoolId':     schoolId,
    'action':       action,
    'respondedAt':  Timestamp.fromDate(respondedAt),
    'classId':      classId,
    'latitude':     latitude,
    'longitude':    longitude,
    'note':         note,
  };
}
