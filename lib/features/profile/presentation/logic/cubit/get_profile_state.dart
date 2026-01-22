import 'package:e_commerce/features/profile/domain/entities/user_profile_entity.dart';

class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileSuccess extends ProfileState {
  final UserProfileEntity userProfileEntity;

  ProfileSuccess(this.userProfileEntity);
}

class ProfileError extends ProfileState {
  final String message;

  ProfileError(this.message);
}
