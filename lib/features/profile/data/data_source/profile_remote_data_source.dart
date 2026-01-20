import 'package:e_commerce/core/supabase/supabase_service.dart';
import 'package:e_commerce/features/profile/data/models/user_profile_model.dart';
import 'package:injectable/injectable.dart';

abstract class ProfileRemoteDataSource {
  Future<UserProfileModel> getUserProfile();
}

@LazySingleton(as: ProfileRemoteDataSource)
class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final SupabaseService _supabaseService;

  ProfileRemoteDataSourceImpl(this._supabaseService);

  @override
  Future<UserProfileModel> getUserProfile() async {
    final user = _supabaseService.currentUser;
    if (user == null) {
      throw Exception('User not found');
    }
    final response = await _supabaseService
        .from('profiles')
        .select()
        .eq('id', user.id)
        .single();
    return UserProfileModel.fromMap(response);
  }
}
