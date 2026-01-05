import 'package:e_commerce/features/auth/domain/entities/app_user.dart' show AppUser;



abstract class AuthRepo {
  Future<AppUser?> login(String email, String password);

  Future<AppUser?> signUp(String email, String password);

  Future<void> resetPassword(String email);

  Future<void> signOut();
}
