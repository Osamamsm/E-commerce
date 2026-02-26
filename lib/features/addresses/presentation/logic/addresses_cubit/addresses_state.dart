part of 'addresses_cubit.dart';

sealed class AddressesState extends Equatable {
  const AddressesState();

  @override
  List<Object> get props => [];
}

// ── Initial ────────────────────────────────────────────────────────────
final class AddressesInitial extends AddressesState {}

// ── Get Addresses ──────────────────────────────────────────────────────
final class GetAddressesLoading extends AddressesState {}

final class GetAddressesSuccess extends AddressesState {
  final List<AddressEntity> addresses;
  const GetAddressesSuccess(this.addresses);

  @override
  List<Object> get props => [addresses];
}

final class GetAddressesFailure extends AddressesState {
  final String message;
  const GetAddressesFailure(this.message);

  @override
  List<Object> get props => [message];
}

// ── Add New Address ────────────────────────────────────────────────────
final class AddNewAddressLoading extends AddressesState {}

final class AddNewAddressSuccess extends AddressesState {}

final class AddNewAddressFailure extends AddressesState {
  final String message;
  const AddNewAddressFailure(this.message);

  @override
  List<Object> get props => [message];
}

// ── Delete Address ─────────────────────────────────────────────────────
final class DeleteAddressLoading extends AddressesState {}

final class DeleteAddressSuccess extends AddressesState {}

final class DeleteAddressFailure extends AddressesState {
  final String message;
  const DeleteAddressFailure(this.message);

  @override
  List<Object> get props => [message];
}

// ── Set Default Address ────────────────────────────────────────────────
final class SetDefaultAddressLoading extends AddressesState {}

final class SetDefaultAddressSuccess extends AddressesState {}

final class SetDefaultAddressFailure extends AddressesState {
  final String message;
  const SetDefaultAddressFailure(this.message);

  @override
  List<Object> get props => [message];
}

// ── Update Address ─────────────────────────────────────────────────────
final class UpdateAddressLoading extends AddressesState {}

final class UpdateAddressSuccess extends AddressesState {}

final class UpdateAddressFailure extends AddressesState {
  final String message;
  const UpdateAddressFailure(this.message);

  @override
  List<Object> get props => [message];
}
