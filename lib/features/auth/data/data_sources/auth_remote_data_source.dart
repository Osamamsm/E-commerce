import 'package:e_commerce/core/supabase/supabase_service.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class AuthRemoteDataSource {
  Future<AuthResponse> login({required String email, required String password});

  Future<AuthResponse> signUp({required String email, required String password});

  Future<void> resetPassword({required String email});

  Future<void> signOut();
}

@LazySingleton(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  final SupabaseService _service;

  AuthRemoteDataSourceImpl(this._service);

  @override
  Future<AuthResponse> login({required String email, required String password}) async {
    throw UnimplementedError();
  }

  @override
  Future<AuthResponse> signUp({required String email, required String password}) async {
    AuthResponse response = await _service.auth.signUp(
      email: email,
      password: password,
    );
    return response;
  }

  @override 
  Future<void> resetPassword({required String email}) {
    throw UnimplementedError();
  }

  @override
  Future<void> signOut() {
    throw UnimplementedError();
  }
}
