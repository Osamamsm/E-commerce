import 'package:e_commerce/core/supabase/supabase_service.dart';
import 'package:e_commerce/features/addresses/data/models/address_model.dart';
import 'package:injectable/injectable.dart';

abstract class AddressRemoteDataSource {
  Future<void> addAddress(AddressModel address);
  Future<void> updateAddress(AddressModel address);
  Future<void> deleteAddress(String addressId);
  Future<List<AddressModel>> getAddresses();
  Future<void> setDefaultAddress(String addressId);
}

@LazySingleton(as: AddressRemoteDataSource)
class AddressRemoteDataSourceImpl implements AddressRemoteDataSource {
  final SupabaseService _service;
  AddressRemoteDataSourceImpl(this._service);
  @override
  Future<void> addAddress(AddressModel address) {
    // TODO: implement addAddress
    throw UnimplementedError();
  }

  @override
  Future<void> deleteAddress(String addressId) {
    // TODO: implement deleteAddress
    throw UnimplementedError();
  }

  @override
  Future<List<AddressModel>> getAddresses() async {
    final user = _service.currentUser;
    if (user == null) {
      throw Exception('User not found');
    }
    final response = await _service.from('user_address').select().eq('user_id', user.id);
    return response.map((e) => AddressModel.fromJson(e)).toList();
  }

  @override
  Future<void> setDefaultAddress(String addressId) {
    // TODO: implement setDefaultAddress
    throw UnimplementedError();
  }

  @override
  Future<void> updateAddress(AddressModel address) {
    // TODO: implement updateAddress
    throw UnimplementedError();
  }
}
