class Failure {
  final String message;
  const Failure(this.message);
}

class AuthFailure extends Failure {
  const AuthFailure(super.message);
}

class NetworkFailure extends Failure {
  NetworkFailure() : super('No internet connection');
}

class UnknownFailure extends Failure {
  UnknownFailure() : super('Something went wrong');
}
