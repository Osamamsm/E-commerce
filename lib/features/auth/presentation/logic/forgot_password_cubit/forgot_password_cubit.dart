import 'package:e_commerce/features/auth/domain/use_cases/forgot_password_use_case.dart';
import 'package:e_commerce/features/auth/presentation/logic/forgot_password_cubit/forgot_password_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  final ForgotPasswordUseCase _case;
  ForgotPasswordCubit(this._case) : super(ForgotPasswordInitial());

  Future<void> requestPasswordReset(String email) async {
    emit(RequestPasswordResetLoading());
    final result = await _case(email);
    result.fold(
      (failure) => emit(RequestPasswordResetFailure(failure.message)),
      (success) => emit(RequestPasswordResetSuccess()),
    );
  }
}
