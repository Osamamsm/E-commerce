import 'package:e_commerce/core/supabase/supabase_service.dart';
import 'package:e_commerce/features/product/data/models/category.dart';
import 'package:e_commerce/features/product/data/models/product.dart';
import 'package:e_commerce/features/product/data/models/product_details.dart';

abstract class ProductRemoteDataSource {
  Future<List<Product>> getProducts();
  Future<List<Category>> getCategories();
  Future<ProductDetails> getProductDetails(String productId);
  Future<List<Product>> getProductsByCategory(String category);
  Future<List<Product>> searchProducts(String query);
  Future<List<Product>> getRelatedProducts(String productId);
}

class ProductSupabaseDataSourceImpl implements ProductRemoteDataSource {
  final SupabaseService _service;

  ProductSupabaseDataSourceImpl(this._service);

  @override
  Future<List<Category>> getCategories() {
    // TODO: implement getCategories
    throw UnimplementedError();
  }

  @override
  Future<ProductDetails> getProductDetails(String productId) {
    // TODO: implement getProductDetails
    throw UnimplementedError();
  }

  @override
  Future<List<Product>> getProducts() async {
    final List<Map<String, dynamic>> response = await _service.rpc(
      function: 'get_products',
    );
    final List<Product> products = response
        .map((row) => Product.fromSupabaseRow(row))
        .toList();
    return products;
  }

  @override
  Future<List<Product>> getProductsByCategory(String category) {
    // TODO: implement getProductsByCategory
    throw UnimplementedError();
  }

  @override
  Future<List<Product>> getRelatedProducts(String productId) {
    // TODO: implement getRelatedProducts
    throw UnimplementedError();
  }

  @override
  Future<List<Product>> searchProducts(String query) {
    // TODO: implement searchProducts
    throw UnimplementedError();
  }
}
