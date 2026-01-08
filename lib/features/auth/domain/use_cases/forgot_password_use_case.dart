import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failure.dart';
import 'package:e_commerce/features/auth/domain/repos/auth_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class ForgotPasswordUseCase {
  final AuthRepo _authRepo;

  ForgotPasswordUseCase(this._authRepo);

  Future<Either<Failure, void>> call(String email) async {
    return _authRepo.requestPasswordReset(email);
  }
}
