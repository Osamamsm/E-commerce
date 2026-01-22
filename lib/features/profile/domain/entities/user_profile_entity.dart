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