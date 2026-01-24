import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failure.dart';
import 'package:e_commerce/features/profile/domain/repo/profile_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class UpdateAvatarUseCase {
  final ProfileRepo _repo;

  UpdateAvatarUseCase(this._repo);

  Future<Either<Failure, String>> call(File avatar) async {
    return await _repo.updateAvatar(avatar);
  }
}
