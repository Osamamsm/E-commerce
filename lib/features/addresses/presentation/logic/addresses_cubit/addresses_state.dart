part of 'addresses_cubit.dart';

enum AddressesStatus { initial, loading, success, failure }

enum AddressesAction {
  none,
  getAddresses,
  addAddress,
  updateAddress,
  deleteAddress,
  setDefault,
}

class AddressesState extends Equatable {
  final AddressesStatus status;
  final AddressesAction action;
  final List<AddressEntity> addresses;
  final String? errorMessage;

  const AddressesState({
    this.status = AddressesStatus.initial,
    this.action = AddressesAction.none,
    this.addresses = const [],
    this.errorMessage,
  });

  AddressesState copyWith({
    AddressesStatus? status,
    AddressesAction? action,
    List<AddressEntity>? addresses,
    String? errorMessage,
  }) {
    return AddressesState(
      status: status ?? this.status,
      action: action ?? this.action,
      addresses: addresses ?? this.addresses,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, action, addresses, errorMessage];
}
