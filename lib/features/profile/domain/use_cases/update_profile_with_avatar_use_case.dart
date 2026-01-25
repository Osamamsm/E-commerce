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
          (failure) => throw failure,
          (url) => url,
        );
      }

      /*Update profile with correct avatarUrl and
      return updated profile if the update is successful*/
      final updatedProfile = newProfile.copyWith(avatarUrl: uploadedAvatarUrl);

      await _repo.updateProfile(updatedProfile);

      /*Delete old avatar if it exists*/
      if (avatar != null && oldProfile.avatarUrl != null) {
        await _repo.deleteAvatar(oldProfile.avatarUrl!);
      }

      return Right(updatedProfile);
    } on Exception catch (e) {
      /*Delete the new uploaded avatar if the update fails */
      if (uploadedAvatarUrl != null) {
        await _repo.deleteAvatar(uploadedAvatarUrl);
      }
      return Left(ExceptionMapper.mapExceptionToFailure(e));
    }
  }
}
