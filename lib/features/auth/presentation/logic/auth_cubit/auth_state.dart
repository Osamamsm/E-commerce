enum AuthStatus { unknown, authenticated, unauthenticated }

class AppAuthState {
  final AuthStatus status;

  const AppAuthState(this.status);
}
