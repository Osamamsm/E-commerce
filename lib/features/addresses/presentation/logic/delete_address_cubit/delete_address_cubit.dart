import 'package:e_commerce/features/addresses/domain/use_cases/delete_address_use_case.dart';
import 'package:e_commerce/features/addresses/presentation/logic/delete_address_cubit/delete_address_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeleteAddressCubit extends Cubit<DeleteAddressState> {
  final DeleteAddressUseCase _case;
  DeleteAddressCubit(this._case) : super(DeleteAddressInitial());

  Future<void> deleteAddress(String addressId) async {
    emit(DeleteAddressLoading());
    final result = await _case.call(addressId);
    result.fold(
      (failure) => emit(DeleteAddressFailure(failure.message)),
      (addresses) => emit(DeleteAddressSuccess()),
    );
  }
}
