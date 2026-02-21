class AddNewAddressState {}

class AddNewAddressInitial extends AddNewAddressState {}

class AddNewAddressLoading extends AddNewAddressState {}

class AddNewAddressSuccess extends AddNewAddressState {}

class AddNewAddressFailure extends AddNewAddressState {
  String message;

  AddNewAddressFailure(this.message);
}
