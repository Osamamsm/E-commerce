import 'dart:io';

import 'package:e_commerce/core/supabase/supabase_service.dart';
import 'package:e_commerce/features/profile/data/models/user_profile_model.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class ProfileRemoteDataSource {
  Future<UserProfileModel> getUserProfile();
  Future<void> updateProfile(UserProfileModel updatedProfile);
  Future<String> updateAvatar(File avatar);
  Future<void> deleteAvatar(String avatarUrl);
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

  @override
  Future<void> updateProfile(UserProfileModel updatedProfile) {
    final user = _supabaseService.currentUser;
    if (user == null) {
      throw Exception('User not found');
    }
    return _supabaseService
        .from('profiles')
        .update({
          'fullName': updatedProfile.fullName,
          'phoneNumber': updatedProfile.phoneNumber,
          if (updatedProfile.avatarUrl != null)
            'avatarUrl': updatedProfile.avatarUrl,
        })
        .eq('id', user.id);
  }

  @override
  Future<String> updateAvatar(File avatar) async {
    final user = _supabaseService.currentUser!;
    final bucket = _supabaseService.storage.from('avatars');
    final fileName = 'avatar_${DateTime.now().millisecondsSinceEpoch}.jpg';
    final newPath = '${user.id}/$fileName';

    await bucket.upload(
      newPath,
      avatar,
      fileOptions: const FileOptions(upsert: true),
    );

    /*Return public URL to use in the profile views*/
    return bucket.getPublicUrl(newPath);
  }

  @override
  Future<void> deleteAvatar(String avatarUrl) async {
    final user = _supabaseService.currentUser!;
    final bucket = _supabaseService.storage.from('avatars');
    final oldPath = Uri.parse(avatarUrl).pathSegments.last;
    await bucket.remove(['${user.id}/$oldPath']);
  }
}
