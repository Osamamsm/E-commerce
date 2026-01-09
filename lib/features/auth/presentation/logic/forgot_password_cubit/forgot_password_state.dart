class ForgotPasswordState {}

class ForgotPasswordInitial extends ForgotPasswordState {}

class RequestPasswordResetSuccess extends ForgotPasswordState {}

class RequestPasswordResetLoading extends ForgotPasswordState {}

class RequestPasswordResetFailure extends ForgotPasswordState {
  final String message;

  RequestPasswordResetFailure(this.message);
}