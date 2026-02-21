import 'package:e_commerce/features/addresses/domain/entities/address_entity.dart';
import 'package:e_commerce/features/addresses/domain/use_cases/add_new_address_use_case.dart';
import 'package:e_commerce/features/addresses/presentation/logic/add_new_address_cubit/add_new_address_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddNewAddressCubit extends Cubit<AddNewAddressState> {
  final AddNewAddressUseCase _case;
  AddNewAddressCubit(this._case) : super(AddNewAddressInitial());

  Future<void> addNewAddress(AddressEntity address) async {
    emit(AddNewAddressLoading());
    final result = await _case.call(address);
    result.fold(
      (failure) => emit(AddNewAddressFailure(failure.message)),
      (addresses) => emit(AddNewAddressSuccess()),
    );
  }
}
