import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failure.dart';
import 'package:e_commerce/features/addresses/domain/repos/address_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class DeleteAddressUseCase {
  final AddressRepo _repo;

  DeleteAddressUseCase(this._repo);


  Future<Either<Failure, void>> call(String addressId) {
    return _repo.deleteAddress(addressId);
  }
}
