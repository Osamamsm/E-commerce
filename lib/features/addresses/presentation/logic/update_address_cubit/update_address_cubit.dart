import 'package:e_commerce/features/addresses/domain/entities/address_entity.dart';
import 'package:e_commerce/features/addresses/domain/use_cases/update_address_use_case.dart';
import 'package:e_commerce/features/addresses/presentation/logic/update_address_cubit/update_address_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class UpdateAddressCubit extends Cubit<UpdateAddressState> {
  final UpdateAddressUseCase _case;
  UpdateAddressCubit(this._case) : super(UpdateAddressInitial());


  Future<void> updateAddress(AddressEntity address) async {
    emit(UpdateAddressLoading());
    final result = await _case.call(address);
    result.fold(
      (failure) => emit(UpdateAddressFailure(failure.message)),
      (addresses) => emit(UpdateAddressSuccess()),
    );
  }
}
