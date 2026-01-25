import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failure.dart';
import 'package:e_commerce/features/profile/domain/entities/user_profile_entity.dart';
import 'package:e_commerce/features/profile/domain/repo/profile_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetProfileDataUseCase {
  final ProfileRepo _profileRepo;

  GetProfileDataUseCase(this._profileRepo);

  Future<Either<Failure, UserProfileEntity>> call() async {
    return await _profileRepo.getUserProfile();
  }
}
