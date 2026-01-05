import 'package:e_commerce/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:e_commerce/features/auth/domain/entities/app_user.dart';
import 'package:e_commerce/features/auth/domain/repos/auth_repo.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AuthRepo)
class AuthRepoImpl implements AuthRepo {
  final AuthRemoteDataSource _remoteDataSource;

  AuthRepoImpl(this._remoteDataSource);

  @override
  Future<AppUser?> login(String email, String password) async {
    final response = await _remoteDataSource.login(
      email: email,
      password: password,
    );
    final user = response.user;
    if (user == null) return null;
    return AppUser(id: user.id, email: user.email!);
  }

  @override
  Future<AppUser?> signUp(String email, String password) async {
    final response = await _remoteDataSource.signUp(
      email: email,
      password: password,
    );
    final user = response.user;
    if (user == null) return null;
    return AppUser(id: user.id, email: user.email!);
  }

  @override
  Future<void> resetPassword(String email) {
    throw UnimplementedError();
  }

  @override
  Future<void> signOut() {
    throw UnimplementedError();
  }
}
