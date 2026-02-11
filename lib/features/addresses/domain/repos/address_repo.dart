import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failure.dart';
import 'package:e_commerce/features/addresses/domain/entities/address_entity.dart';

abstract class AddressRepo {
  Future<Either<Failure, void>> addAddress(AddressEntity address);
  Future<Either<Failure, void>> updateAddress(AddressEntity address);
  Future<Either<Failure, void>> deleteAddress(String addressId);
  Future<Either<Failure, List<AddressEntity>>> getAddresses();
  Future<Either<Failure, void>> setDefaultAddress(String addressId);
}
