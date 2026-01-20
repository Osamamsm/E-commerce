import 'package:e_commerce/features/profile/domain/entities/user_profile_entity.dart';

class GetProfileState {}

class GetProfileInitial extends GetProfileState {}

class GetProfileLoading extends GetProfileState {}

class GetProfileSuccess extends GetProfileState {
  final UserProfileEntity userProfileEntity;

  GetProfileSuccess(this.userProfileEntity);
}

class GetProfileError extends GetProfileState {
  final String message;

  GetProfileError(this.message);
}
