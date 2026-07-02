import 'package:cloud_firestore/cloud_firestore.dart';

/// Shared user model representing a document in the Firestore `users` collection.
/// Includes all roles and fields consumed across every feature.
class UserModel {
  const UserModel({
    required this.uid,
    required this.email,
    required this.role,
    required this.schoolId,
    required this.displayName,
    this.phoneNumber,
    this.photoUrl,
    this.classId,
    this.gradeLevel,
    this.fcmToken,
    this.isActive = true,
    this.createdAt,
    this.lastSeen,
  });

  final String   uid;
  final String   email;
  final String   role;          // See [RoleConstants]
  final String   schoolId;
  final String   displayName;
  final String?  phoneNumber;
  final String?  photoUrl;
  final String?  classId;       // null for non-students/teachers
  final String?  gradeLevel;
  final String?  fcmToken;
  final bool     isActive;
  final DateTime? createdAt;
  final DateTime? lastSeen;

  factory UserModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return UserModel(
      uid:         doc.id,
      email:       data['email']       as String,
      role:        data['role']        as String,
      schoolId:    data['schoolId']    as String,
      displayName: data['displayName'] as String,
      phoneNumber: data['phoneNumber'] as String?,
      photoUrl:    data['photoUrl']    as String?,
      classId:     data['classId']     as String?,
      gradeLevel:  data['gradeLevel']  as String?,
      fcmToken:    data['fcmToken']    as String?,
      isActive:    (data['isActive']   as bool?) ?? true,
      createdAt:   (data['createdAt']  as Timestamp?)?.toDate(),
      lastSeen:    (data['lastSeen']   as Timestamp?)?.toDate(),
    );
  }

  Map<String, dynamic> toFirestore() => {
    'email':       email,
    'role':        role,
    'schoolId':    schoolId,
    'displayName': displayName,
    'phoneNumber': phoneNumber,
    'photoUrl':    photoUrl,
    'classId':     classId,
    'gradeLevel':  gradeLevel,
    'fcmToken':    fcmToken,
    'isActive':    isActive,
    'createdAt':   createdAt != null ? Timestamp.fromDate(createdAt!) : FieldValue.serverTimestamp(),
    'lastSeen':    FieldValue.serverTimestamp(),
  };

  UserModel copyWith({
    String? displayName,
    String? phoneNumber,
    String? photoUrl,
    String? classId,
    String? gradeLevel,
    String? fcmToken,
    bool?   isActive,
  }) => UserModel(
    uid:         uid,
    email:       email,
    role:        role,
    schoolId:    schoolId,
    displayName: displayName ?? this.displayName,
    phoneNumber: phoneNumber ?? this.phoneNumber,
    photoUrl:    photoUrl    ?? this.photoUrl,
    classId:     classId     ?? this.classId,
    gradeLevel:  gradeLevel  ?? this.gradeLevel,
    fcmToken:    fcmToken    ?? this.fcmToken,
    isActive:    isActive    ?? this.isActive,
    createdAt:   createdAt,
    lastSeen:    lastSeen,
  );
}
