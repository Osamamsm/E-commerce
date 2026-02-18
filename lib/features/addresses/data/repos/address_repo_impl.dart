import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failure.dart';
import 'package:e_commerce/features/addresses/domain/entities/address_entity.dart';
import 'package:e_commerce/features/addresses/domain/repos/address_repo.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AddressRepo)
class AddressRepoImpl implements AddressRepo{
  @override
  Future<Either<Failure, void>> addAddress(AddressEntity address) {
    // TODO: implement addAddress
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> deleteAddress(String addressId) {
    // TODO: implement deleteAddress
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<AddressEntity>>> getAddresses() {
    // TODO: implement getAddresses
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> setDefaultAddress(String addressId) {
    // TODO: implement setDefaultAddress
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> updateAddress(AddressEntity address) {
    // TODO: implement updateAddress
    throw UnimplementedError();
  }
}