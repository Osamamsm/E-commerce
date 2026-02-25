class DeleteAddressState {}

class DeleteAddressInitial extends DeleteAddressState {}

class DeleteAddressLoading extends DeleteAddressState {}

class DeleteAddressSuccess extends DeleteAddressState {}

class DeleteAddressFailure extends DeleteAddressState {
  String message;

  DeleteAddressFailure(this.message);
}
