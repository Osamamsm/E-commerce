import 'package:e_commerce/features/product/data/models/product.dart';
import 'package:e_commerce/features/wish_list/data/repos/wishlist_repo.dart';

class WishlistRepoImpl implements WishListRepo {
  @override
  Future<void> addToWishList(String productId) {
    // TODO: implement addToWishList
    throw UnimplementedError();
  }

  @override
  Future<List<Product>> getWishList(String userId) {
    // TODO: implement getWishList
    throw UnimplementedError();
  }

  @override
  Future<void> removeFromWishList(String productId) {
    // TODO: implement removeFromWishList
    throw UnimplementedError();
  }
}
