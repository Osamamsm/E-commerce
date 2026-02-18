import 'package:e_commerce/features/addresses/domain/entities/address_entity.dart';

class GetAddressesState {}

class GetAddressesInitial extends GetAddressesState {}

class GetAddressesLoading extends GetAddressesState {}

class GetAddressesSuccess extends GetAddressesState {
  final List<AddressEntity> addresses;
  GetAddressesSuccess(this.addresses);
}

class GetAddressesFailure extends GetAddressesState {
  final String message;
  GetAddressesFailure(this.message);
}
