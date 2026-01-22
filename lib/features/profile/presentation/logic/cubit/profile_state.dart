import 'package:e_commerce/features/profile/domain/entities/user_profile_entity.dart';

class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileUpdating extends ProfileState {}

class ProfileUpdated extends ProfileState {}

class GetProfileSuccess extends ProfileState {
  final UserProfileEntity userProfileEntity;

  GetProfileSuccess(this.userProfileEntity);
}

class ProfileError extends ProfileState {
  final String message;

  ProfileError(this.message);
}
