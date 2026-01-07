import 'package:e_commerce/features/auth/domain/use_cases/sign_out_use_case.dart';
import 'package:e_commerce/features/auth/presentation/logic/sign_out_cubit/sign_out_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignOutCubit extends Cubit<SignOutState> {
  final SignOutUseCase _signOutUseCase;
  SignOutCubit(this._signOutUseCase) : super(SignOutInitial());

  Future<void> signOut() async {
    emit(SignOutLoading());
    final result = await _signOutUseCase.call();
    result.fold(
      (failure) => emit(SignOutFailure(failure.message)),
      (user) => emit(SignOutSuccess()),
    );
  }
}
