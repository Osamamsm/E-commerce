import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/exception_mapper.dart';
import 'package:e_commerce/core/error/failure.dart';
import 'package:e_commerce/features/product/data/data_source/remote_data_source/products_remote_data_source.dart';
import 'package:e_commerce/features/product/data/models/category.dart';
import 'package:e_commerce/features/product/data/models/product.dart';
import 'package:e_commerce/features/product/data/models/product_details.dart';
import 'package:e_commerce/features/product/domain/repos/product_repo.dart';

class ProductRepoImpl implements ProductRepo {
  final ProductRemoteDataSource _remoteDataSource;

  ProductRepoImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, List<Category>>> getCategories() {
    // TODO: implement getCategories
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, ProductDetails>> getProductDetails(String productId) {
    // TODO: implement getProductDetails
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Product>>> getProducts() async {
    try {
      final products = await _remoteDataSource.getProducts();
      return Right(products);
    } catch (e) {
      return Left(ExceptionMapper.mapExceptionToFailure(e));
    }
  }

  @override
  Future<Either<Failure, List<Product>>> getProductsByCategory(
    String category,
  ) {
    // TODO: implement getProductsByCategory
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Product>>> getRelatedProducts(String productId) {
    // TODO: implement getRelatedProducts
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Product>>> searchProducts(String query) {
    // TODO: implement searchProducts
    throw UnimplementedError();
  }
}
