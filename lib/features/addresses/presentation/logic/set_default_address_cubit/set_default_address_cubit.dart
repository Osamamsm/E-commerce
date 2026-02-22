import 'package:e_commerce/features/addresses/domain/use_cases/set_default_address_use_case.dart';
import 'package:e_commerce/features/addresses/presentation/logic/set_default_address_cubit/set_default_address_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class SetDefaultAddressCubit extends Cubit<SetDefaultAddressState> {
  final SetDefaultAddressUseCase _case;
  SetDefaultAddressCubit(this._case) : super(SetDefaultAddressInitial());

  Future<void> addNewAddress(String addressId) async {
    emit(SetDefaultAddressLoading());
    final result = await _case.call(addressId);
    result.fold(
      (failure) => emit(SetDefaultAddressFailure(failure.message)),
      (addresses) => emit(SetDefaultAddressSuccess()),
    );
  }
}
