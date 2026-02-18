import 'package:e_commerce/features/addresses/domain/use_cases/get_addresses_use_case.dart';
import 'package:e_commerce/features/addresses/presentation/logic/get_addresses_cubit/get_addresses_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetAddressesCubit extends Cubit<GetAddressesState> {
  final GetAddressesUseCase _addressesUseCase;
  GetAddressesCubit(this._addressesUseCase) : super(GetAddressesInitial());

  Future<void> getAddresses() async {
    emit(GetAddressesLoading());
    final result = await _addressesUseCase();
    result.fold(
      (failure) => emit(GetAddressesFailure(failure.message)),
      (addresses) => emit(GetAddressesSuccess(addresses)),
    );
  }
}
