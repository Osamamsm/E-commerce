import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/exception_mapper.dart';
import 'package:e_commerce/core/error/failure.dart';
import 'package:e_commerce/features/profile/domain/entities/user_profile_entity.dart';
import 'package:e_commerce/features/profile/domain/repo/profile_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class UpdateProfileWithAvatarUseCase {
  final ProfileRepo _repo;

  UpdateProfileWithAvatarUseCase(this._repo);

  Future<Either<Failure, UserProfileEntity>> call({
    required UserProfileEntity oldProfile,
    required UserProfileEntity newProfile,
    File? avatar,
  }) async {
    String? uploadedAvatarUrl;
    try {
      /*Upload avatar if provided and update avatarUrl*/
      if (avatar != null) {
        final avatarResult = await _repo.updateAvatar(avatar);
        uploadedAvatarUrl = avatarResult.fold(
          (failure) => throw Exception(failure.message),
          (url) => url,
        );
      }

      /*Update profile with correct avatarUrl and
      return updated profile if the update is successful*/
      final updatedProfile = newProfile.copyWith(avatarUrl: uploadedAvatarUrl);

      final updateResult = await _repo.updateProfile(updatedProfile);

      return updateResult.fold(
        (failure) {
          // If update fails, delete the newly uploaded avatar
          if (uploadedAvatarUrl != null) {
            _repo.deleteAvatar(uploadedAvatarUrl);
          }
          return Left(failure);
        },
        (_) async {
          // Update successful, delete old avatar
          if (avatar != null && oldProfile.avatarUrl != null) {
            await _repo.deleteAvatar(oldProfile.avatarUrl!);
          }
          return Right(updatedProfile);
        },
      );
    } on Exception catch (e) {
      // Handle other exceptions
      if (uploadedAvatarUrl != null) {
        await _repo.deleteAvatar(uploadedAvatarUrl);
      }
      return Left(ExceptionMapper.mapExceptionToFailure(e));
    }
  }
}
