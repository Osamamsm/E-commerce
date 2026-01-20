import 'package:e_commerce/features/profile/domain/entities/user_profile_entity.dart';

class UserProfileModel {
  final String id;
  final String fullName;
  final String? phoneNumber;
  final String? avatarUrl;
  final String role;
  final DateTime createdAt;

  UserProfileModel({
    required this.id,
    required this.fullName,
    this.phoneNumber,
    this.avatarUrl,
    required this.role,
    required this.createdAt,
  });

  factory UserProfileModel.fromMap(Map<String, dynamic> map) {
    return UserProfileModel(
      id: map['id'],
      fullName: map['fullName'],
      phoneNumber: map['phoneNumber'],
      avatarUrl: map['avatarUrl'],
      role: map['role'],
      createdAt: DateTime.parse(map['createdAt']),
    );
  }

  UserProfileEntity toEntity() {
    return UserProfileEntity(
      id: id,
      fullName: fullName,
      phoneNumber: phoneNumber,
      avatarUrl: avatarUrl,
      role: role,
      createdAt: createdAt,
    );
  }
}
