import 'dart:io';

import 'package:dartz/dartz.dart';
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
    String? avatarUrl = oldProfile.avatarUrl;
    // 1️⃣ Upload avatar if provided
    if (avatar != null) {
      final avatarResult = await _repo.updateAvatar(
        avatar,
        oldProfile.avatarUrl,
      );
      avatarUrl = avatarResult.fold((failure) => throw failure, (url) => url);
    }
    // 2️⃣ Update profile with correct avatarUrl
    final updatedProfile = newProfile.copyWith(avatarUrl: avatarUrl);

    final updateResult = await _repo.updateProfile(updatedProfile);

    return updateResult.map((_) => updatedProfile);
  }
}
