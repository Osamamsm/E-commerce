import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failure.dart';
import 'package:e_commerce/features/auth/domain/repos/auth_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class ResetPasswordUseCase {
  final AuthRepo _repo;

  ResetPasswordUseCase(this._repo);

  Future<Either<Failure, void>> call(String password) async {
    return _repo.resetPassword(password);
  }
}
