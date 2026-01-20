import 'package:e_commerce/features/profile/domain/use_cases/get_profile_use_case.dart';
import 'package:e_commerce/features/profile/presentation/logic/cubit/get_profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';


@injectable
class GetProfileCubit extends Cubit<GetProfileState> {
  final GetProfileDataUseCase getProfileDataUseCase;
  GetProfileCubit(this.getProfileDataUseCase) : super(GetProfileInitial());

  Future<void> getProfile() async {
    emit(GetProfileLoading());
    final result = await getProfileDataUseCase();
    result.fold(
      (failure) => emit(GetProfileError(failure.message)),
      (userProfileEntity) => emit(GetProfileSuccess(userProfileEntity)),
    );
  }
}
