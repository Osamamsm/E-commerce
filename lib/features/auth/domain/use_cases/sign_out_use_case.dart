import 'package:e_commerce/features/auth/domain/repos/auth_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignOutUseCase {
  final AuthRepo _authRepo;
  SignOutUseCase(this._authRepo);

  Future<void> call() async {
    await _authRepo.signOut();
  }
}
