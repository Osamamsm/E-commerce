import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failure.dart';
import 'package:e_commerce/features/auth/domain/entities/app_user.dart';
import 'package:e_commerce/features/auth/domain/repos/auth_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginUseCase {
  final AuthRepo _authRepo;

  LoginUseCase(this._authRepo);

  Future<Either<Failure, AppUser?>> call(String email, String password) async {
    return _authRepo.login(email, password);
  }
}
