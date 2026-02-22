class SetDefaultAddressState {}

class SetDefaultAddressInitial extends SetDefaultAddressState {}

class SetDefaultAddressLoading extends SetDefaultAddressState {}

class SetDefaultAddressSuccess extends SetDefaultAddressState {}

class SetDefaultAddressFailure extends SetDefaultAddressState {
  String message;

  SetDefaultAddressFailure(this.message);
}
