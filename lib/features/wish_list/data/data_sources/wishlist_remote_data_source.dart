import 'package:e_commerce/core/supabase/supabase_service.dart';
import 'package:injectable/injectable.dart';

abstract class WishlistRemoteDataSource {
  Future<void> addToWishList(String productId);
  Future<void> removeFromWishList(String productId);
  Future<List<String>> getWishList();
}

@LazySingleton(as: WishlistRemoteDataSource)
class WishlistRemoteDataSourceImpl implements WishlistRemoteDataSource {

  final SupabaseService _supabaseService;

  WishlistRemoteDataSourceImpl(this._supabaseService);

  @override
  Future<void> addToWishList(String productId) {
    // TODO: implement addToWishList
    throw UnimplementedError();
  }

  @override
  Future<List<String>> getWishList() {
    // TODO: implement getWishList
    throw UnimplementedError();
  }

  @override
  Future<void> removeFromWishList(String productId) {
    // TODO: implement removeFromWishList
    throw UnimplementedError();
  }
}
