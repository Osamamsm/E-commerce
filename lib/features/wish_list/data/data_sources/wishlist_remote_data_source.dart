import 'package:e_commerce/core/supabase/supabase_service.dart';
import 'package:e_commerce/features/product/data/models/product.dart';
import 'package:injectable/injectable.dart';

abstract class WishlistRemoteDataSource {
  Future<void> addToWishList(String productId);
  Future<void> removeFromWishList(String productId);
  Future<List<Product>> getWishList();
}

@LazySingleton(as: WishlistRemoteDataSource)
class WishlistRemoteDataSourceImpl implements WishlistRemoteDataSource {
  final SupabaseService _supabaseService;

  WishlistRemoteDataSourceImpl(this._supabaseService);

  @override
  Future<void> addToWishList(String productId) async {
    final currentUser = _supabaseService.currentUser;
    if (currentUser == null) {
      throw Exception('User not authenticated');
    }

    return await _supabaseService.from('wish_list').insert({
      'user_id': currentUser.id,
      'product_id': productId,
    });
  }

  @override
  Future<List<Product>> getWishList() async {
    final currentUser = _supabaseService.currentUser;
    if (currentUser == null) {
      throw Exception('User not authenticated');
    }
    final List<dynamic> response = await _supabaseService.rpc(
      function: 'get_wishlist',
      params: {'p_user_id': currentUser.id},
    );
    final List<Product> products = response
        .map((row) => Product.fromSupabaseRow(row))
        .toList();
    return products;
  }

  @override
  Future<void> removeFromWishList(String productId) async {
    final currentUser = _supabaseService.currentUser;
    if (currentUser == null) {
      throw Exception('User not authenticated');
    }

    return await _supabaseService
        .from('wish_list')
        .delete()
        .eq('user_id', currentUser.id)
        .eq('product_id', productId);
  }
}
