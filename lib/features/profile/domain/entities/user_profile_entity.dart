class UserProfileEntity {
  final String id;
  final String fullName;
  final String? phoneNumber;
  final String? avatarUrl;
  final String role;
  final DateTime createdAt;

  UserProfileEntity({
    required this.id,
    required this.fullName,
    this.phoneNumber,
    this.avatarUrl,
    required this.role,
    required this.createdAt,
  });
}