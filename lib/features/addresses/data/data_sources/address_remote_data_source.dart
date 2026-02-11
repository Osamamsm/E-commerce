import 'package:e_commerce/features/addresses/data/models/address_model.dart';

abstract class AddressRemoteDataSource {
  Future<void> addAddress(AddressModel address);
  Future<void> updateAddress(AddressModel address);
  Future<void> deleteAddress(String addressId);
  Future<List<AddressModel>> getAddresses();
  Future<void> setDefaultAddress(String addressId);
}
