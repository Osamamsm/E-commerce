import 'package:e_commerce/features/profile/domain/entities/user_profile_entity.dart';
import 'package:e_commerce/features/profile/domain/use_cases/get_profile_use_case.dart';
import 'package:e_commerce/features/profile/domain/use_cases/update_profile_use_case.dart';
import 'package:e_commerce/features/profile/presentation/logic/cubit/profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProfileCubit extends Cubit<ProfileState> {
  final GetProfileDataUseCase _getProfileDataUseCase;
  final UpdateProfileUseCase _updateProfileUseCase;
  ProfileCubit(this._getProfileDataUseCase, this._updateProfileUseCase)
    : super(ProfileInitial());

  UserProfileEntity? _profile;
  UserProfileEntity? get profile => _profile;

  Future<void> getProfile() async {
    emit(ProfileLoading());
    final result = await _getProfileDataUseCase();
    result.fold(
      (failure) => emit(ProfileError(failure.message)),
      (userProfileEntity) {
        _profile = userProfileEntity; 
        emit(GetProfileSuccess(userProfileEntity));
      },
    );
  }

  Future<void> updateProfile(UserProfileEntity updatedProfile) async {
    emit(ProfileLoading());
    final result = await _updateProfileUseCase(updatedProfile);
    result.fold(
      (failure) => emit(ProfileError(failure.message)),
      (_) {
        _profile = updatedProfile;
        emit(ProfileUpdated());
      },
    );
  }
}
