import 'package:dartz/dartz.dart' show Either, Right, Left;
import 'package:e_commerce/core/error/failure.dart';
import 'package:e_commerce/features/profile/data/data_source/profile_remote_data_source.dart';
import 'package:e_commerce/features/profile/domain/entities/user_profile_entity.dart';
import 'package:e_commerce/features/profile/domain/repo/profile_repo.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ProfileRepo)
class ProfileRepoImpl implements ProfileRepo {
  final ProfileRemoteDataSource _remoteDataSource;

  ProfileRepoImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, UserProfileEntity>> getUserProfile() async {
    try {
      final userProfile = await _remoteDataSource.getUserProfile();
      return Right(userProfile.toEntity());
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
