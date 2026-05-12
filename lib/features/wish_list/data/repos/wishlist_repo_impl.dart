import 'package:e_commerce/features/product/data/models/product.dart';
import 'package:e_commerce/features/wish_list/data/data_sources/wishlist_remote_data_source.dart';
import 'package:e_commerce/features/wish_list/data/repos/wishlist_repo.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: WishListRepo)
class WishlistRepoImpl implements WishListRepo {
  final WishlistRemoteDataSource _remoteDataSource;

  WishlistRepoImpl(this._remoteDataSource);
  @override
  Future<void> addToWishList(String productId) {
    // TODO: implement addToWishList
    throw UnimplementedError();
  }

  @override
  Future<List<Product>> getWishList() {
    // TODO: implement getWishList
    throw UnimplementedError();
  }

  @override
  Future<void> removeFromWishList(String productId) {
    // TODO: implement removeFromWishList
    throw UnimplementedError();
  }
}
