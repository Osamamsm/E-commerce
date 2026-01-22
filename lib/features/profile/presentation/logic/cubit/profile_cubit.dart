import 'package:e_commerce/features/profile/domain/use_cases/get_profile_use_case.dart';
import 'package:e_commerce/features/profile/presentation/logic/cubit/profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProfileCubit extends Cubit<ProfileState> {
  final GetProfileDataUseCase _getProfileDataUseCase;
  ProfileCubit(this._getProfileDataUseCase) : super(ProfileInitial());

  Future<void> getProfile() async {
    emit(ProfileLoading());
    final result = await _getProfileDataUseCase();
    result.fold(
      (failure) => emit(ProfileError(failure.message)),
      (userProfileEntity) => emit(ProfileSuccess(userProfileEntity)),
    );
  }
}
