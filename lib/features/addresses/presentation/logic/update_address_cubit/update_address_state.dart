class UpdateAddressState {}

class UpdateAddressInitial extends UpdateAddressState {}

class UpdateAddressLoading extends UpdateAddressState {}

class UpdateAddressSuccess extends UpdateAddressState {}

class UpdateAddressFailure extends UpdateAddressState {
  String message;

  UpdateAddressFailure(this.message);
}
