import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failure.dart';
import 'package:e_commerce/features/addresses/data/data_sources/address_remote_data_source.dart';
import 'package:e_commerce/features/addresses/domain/entities/address_entity.dart';
import 'package:e_commerce/features/addresses/domain/repos/address_repo.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AddressRepo)
class AddressRepoImpl implements AddressRepo{
  final AddressRemoteDataSource _remoteDataSource;
  AddressRepoImpl(this._remoteDataSource);
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
  Future<Either<Failure, List<AddressEntity>>> getAddresses() async {
    try {
      final addresses = await _remoteDataSource.getAddresses();
      return Right(addresses.map((e) => e.toEntity()).toList());
    } catch (e) {
      return Left(Failure(e.toString()));
    }
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