import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failure.dart';
import 'package:e_commerce/features/auth/domain/repos/auth_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignOutUseCase {
  final AuthRepo _authRepo;
  SignOutUseCase(this._authRepo);

  Future<Either<Failure, void>> call() async {
    return _authRepo.signOut();
  }
}
