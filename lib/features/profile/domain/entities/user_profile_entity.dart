class UserProfileEntity {
  final String id;
  final String fullName;
  final String email;
  final String? phoneNumber;
  final String? avatarUrl;
  final String role;
  final DateTime createdAt;

  UserProfileEntity({
    required this.id,
    required this.fullName,
    required this.email,
    this.phoneNumber,
    this.avatarUrl,
    required this.role,
    required this.createdAt,
  });
}

extension UserProfileCopy on UserProfileEntity {
  UserProfileEntity copyWith({
    String? fullName,
    String? email,
    String? phoneNumber,
    String? avatarUrl,
  }) {
    return UserProfileEntity(
      id: id,
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      role: role,
      createdAt: createdAt,
    );
  }
}