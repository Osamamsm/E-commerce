abstract class DeepLinkState {}

class DeepLinkInitial extends DeepLinkState {}

class DeepLinkResetPassword extends DeepLinkState {}

class DeepLinkEmailVerification extends DeepLinkState {}

class DeepLinkError extends DeepLinkState {
  final String message;

  DeepLinkError(this.message);
}
