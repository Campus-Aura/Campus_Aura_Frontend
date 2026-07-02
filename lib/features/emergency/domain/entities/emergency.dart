import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../core/constants/emergency_constants.dart';

/// Domain entity representing an active or past emergency event.
class Emergency {
  const Emergency({
    required this.id,
    required this.schoolId,
    required this.type,
    required this.status,
    required this.message,
    required this.targetScope,
    required this.initiatedByUid,
    required this.createdAt,
    this.targetClassId,
    this.targetGradeLevel,
    this.endedAt,
    this.endedByUid,
  });

  final String   id;
  final String   schoolId;

  /// Emergency type – see [EmergencyConstants] for valid values.
  final String   type;

  /// Current status: [EmergencyConstants.statusActive], [statusEnded], [statusDrill].
  final String   status;

  final String   message;

  /// Broadcast scope: school / class / grade – see [EmergencyConstants].
  final String   targetScope;

  final String   initiatedByUid;
  final DateTime createdAt;

  final String?  targetClassId;
  final String?  targetGradeLevel;
  final DateTime? endedAt;
  final String?  endedByUid;

  bool get isActive => status == EmergencyConstants.statusActive;

  factory Emergency.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Emergency(
      id:               doc.id,
      schoolId:         data['schoolId']         as String,
      type:             data['type']             as String,
      status:           data['status']           as String,
      message:          data['message']          as String,
      targetScope:      data['targetScope']      as String,
      initiatedByUid:   data['initiatedByUid']   as String,
      createdAt:        (data['createdAt']        as Timestamp).toDate(),
      targetClassId:    data['targetClassId']    as String?,
      targetGradeLevel: data['targetGradeLevel'] as String?,
      endedAt:          (data['endedAt']          as Timestamp?)?.toDate(),
      endedByUid:       data['endedByUid']       as String?,
    );
  }

  Map<String, dynamic> toFirestore() => {
    'schoolId':         schoolId,
    'type':             type,
    'status':           status,
    'message':          message,
    'targetScope':      targetScope,
    'initiatedByUid':   initiatedByUid,
    'createdAt':        Timestamp.fromDate(createdAt),
    'targetClassId':    targetClassId,
    'targetGradeLevel': targetGradeLevel,
    'endedAt':          endedAt != null ? Timestamp.fromDate(endedAt!) : null,
    'endedByUid':       endedByUid,
  };
}
