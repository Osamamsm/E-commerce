import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failure.dart';
import 'package:e_commerce/features/profile/domain/entities/user_profile_entity.dart';

abstract class ProfileRepo {
  Future<Either<Failure, UserProfileEntity>> getUserProfile();
  Future<Either<Failure, void>> updateProfile(UserProfileEntity updatedProfile);
}
