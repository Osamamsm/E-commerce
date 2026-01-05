import 'package:e_commerce/features/auth/domain/use_cases/login_use_case.dart';
import 'package:e_commerce/features/auth/presentation/logic/log_in_cubit/log_in_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class LogInCubit extends Cubit<LogInState> {
  final LoginUseCase _logInUseCase;

  LogInCubit(this._logInUseCase) : super(LogInInitial());

  Future<void> logIn(String email, String password) async {
    emit(LogInLoading());
    try {
      await _logInUseCase(email, password);
      emit(LogInSuccess());
    } catch (e) {
      emit(LogInFailure(e.toString()));
    }
  }
}
