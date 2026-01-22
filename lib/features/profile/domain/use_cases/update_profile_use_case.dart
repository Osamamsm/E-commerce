import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failure.dart';
import 'package:e_commerce/features/profile/domain/entities/user_profile_entity.dart';
import 'package:e_commerce/features/profile/domain/repo/profile_repo.dart';

class UpdateProfileUseCase {
  final ProfileRepo _repo;

  UpdateProfileUseCase(this._repo);

  Future<Either<Failure, void>> call(UserProfileEntity updatedProfile) async {
    return _repo.updateProfile(updatedProfile);
  }
}
