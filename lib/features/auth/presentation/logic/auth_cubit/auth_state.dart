enum AuthStatus { cleared, unknown, authenticated, unauthenticated }

enum AuthFlow { normal, passwordReset }

class AppAuthState {
  final AuthStatus status;
  final AuthFlow authFlow;

  const AppAuthState(this.status, {this.authFlow = AuthFlow.normal});
}
