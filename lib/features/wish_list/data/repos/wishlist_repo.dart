import 'package:e_commerce/features/product/data/models/product.dart';

abstract class WishListRepo {
  Future<void> addToWishList(String productId);
  Future<void> removeFromWishList(String productId);
  Future<List<Product>> getWishList(String userId);
}