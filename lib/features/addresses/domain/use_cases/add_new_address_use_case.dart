import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failure.dart';
import 'package:e_commerce/features/addresses/domain/entities/address_entity.dart';
import 'package:e_commerce/features/addresses/domain/repos/address_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddNewAddressUseCase {
  final AddressRepo _repo;

  AddNewAddressUseCase(this._repo);

  Future<Either<Failure, void>> call(AddressEntity address) {
    return _repo.addAddress(address);
  }
}
