import 'package:e_commerce/core/supabase/supabase_service.dart';
import 'package:e_commerce/features/profile/domain/entities/user_profile_entity.dart';
import 'package:injectable/injectable.dart';

abstract class ProfileRemoteDataSource {
  Future<UserProfileEntity> getUserProfile();
}

@LazySingleton(as: ProfileRemoteDataSource)
class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final SupabaseService _supabaseService;

  ProfileRemoteDataSourceImpl(this._supabaseService);

  @override
  Future<UserProfileEntity> getUserProfile() {
    throw UnimplementedError();
  }
}
