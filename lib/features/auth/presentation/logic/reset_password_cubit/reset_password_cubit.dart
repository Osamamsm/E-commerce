import 'package:e_commerce/features/auth/domain/use_cases/reset_password_use_case.dart';
import 'package:e_commerce/features/auth/presentation/logic/reset_password_cubit/reset_password_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';


@injectable
class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  final ResetPasswordUseCase _case;
  ResetPasswordCubit(this._case) : super(ResetPasswordInitial());


  void resetPassword(String password) async {
    emit(ResetPasswordLoading());
    final result = await _case.call(password);
    result.fold(
      (failure) => emit(ResetPasswordFailure(message: failure.message)),
      (success) => emit(ResetPasswordSuccess()),
    );
  }
}
