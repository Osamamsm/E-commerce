

import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failure.dart';
import 'package:e_commerce/features/addresses/domain/entities/address_entity.dart';
import 'package:e_commerce/features/addresses/domain/repos/address_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class GetAddressesUseCase {
  final AddressRepo _repo;
  GetAddressesUseCase(this._repo);
  Future<Either<Failure, List<AddressEntity>>> call() async {
    return await _repo.getAddresses();
  }
}