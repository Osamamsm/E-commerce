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
  Future<void> addAddress(AddressModel address) async {
    final user = _service.currentUser;
    if (user == null) {
      throw Exception('User not found');
    }
    await _service.rpc(
      function: "add_new_address",
      params: {
        'p_user_id': user.id,
        'p_governorate': address.governorate,
        'p_city': address.city,
        'p_district': address.district,
        'p_street':address.street,
        'p_building': address.building,
        'p_floor': address.floor,
        'p_apartment_number': address.apartmentNumber,
        'p_is_default': address.isDefault,
        'p_label': address.label,
        'p_additional_notes': address.additionalNotes,
      },
    );
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
    final response = await _service
        .from('addresses')
        .select()
        .eq('user_id', user.id);
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
