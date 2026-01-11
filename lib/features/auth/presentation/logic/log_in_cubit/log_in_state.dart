

class LogInState {}


class LogInInitial extends LogInState {}

class LogInLoading extends LogInState {}

class LogInSuccess extends LogInState {}

class LogInFailure extends LogInState {
  final String errMessage;

  LogInFailure(this.errMessage);
}
