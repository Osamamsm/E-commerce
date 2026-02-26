import 'package:e_commerce/features/addresses/domain/entities/address_entity.dart';
import 'package:e_commerce/features/addresses/domain/use_cases/add_new_address_use_case.dart';
import 'package:e_commerce/features/addresses/domain/use_cases/delete_address_use_case.dart';
import 'package:e_commerce/features/addresses/domain/use_cases/get_addresses_use_case.dart';
import 'package:e_commerce/features/addresses/domain/use_cases/set_default_address_use_case.dart';
import 'package:e_commerce/features/addresses/domain/use_cases/update_address_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'addresses_state.dart';

@injectable
class AddressesCubit extends Cubit<AddressesState> {
  final GetAddressesUseCase _getAddressesUseCase;
  final AddNewAddressUseCase _addNewAddressUseCase;
  final DeleteAddressUseCase _deleteAddressUseCase;
  final SetDefaultAddressUseCase _setDefaultAddressUseCase;
  final UpdateAddressUseCase _updateAddressUseCase;

  AddressesCubit(
    this._getAddressesUseCase,
    this._addNewAddressUseCase,
    this._deleteAddressUseCase,
    this._setDefaultAddressUseCase,
    this._updateAddressUseCase,
  ) : super(AddressesInitial());

  Future<void> getAddresses() async {
    emit(GetAddressesLoading());
    final result = await _getAddressesUseCase();
    result.fold(
      (failure) => emit(GetAddressesFailure(failure.message)),
      (addresses) => emit(GetAddressesSuccess(addresses)),
    );
  }

  Future<void> addNewAddress(AddressEntity address) async {
    emit(AddNewAddressLoading());
    final result = await _addNewAddressUseCase.call(address);
    result.fold((failure) => emit(AddNewAddressFailure(failure.message)), (_) {
      emit(AddNewAddressSuccess());
    });
  }

  Future<void> deleteAddress(String addressId) async {
    emit(DeleteAddressLoading());
    final result = await _deleteAddressUseCase.call(addressId);
    result.fold((failure) => emit(DeleteAddressFailure(failure.message)), (_) {
      emit(DeleteAddressSuccess());
      getAddresses();
    });
  }

  Future<void> setDefaultAddress(String addressId) async {
    emit(SetDefaultAddressLoading());
    final result = await _setDefaultAddressUseCase.call(addressId);
    result.fold((failure) => emit(SetDefaultAddressFailure(failure.message)), (
      _,
    ) {
      emit(SetDefaultAddressSuccess());
      getAddresses();
    });
  }

  Future<void> updateAddress(AddressEntity address) async {
    emit(UpdateAddressLoading());
    final result = await _updateAddressUseCase.call(address);
    result.fold(
      (failure) => emit(UpdateAddressFailure(failure.message)),
      (_) => emit(UpdateAddressSuccess()),
    );
  }
}
