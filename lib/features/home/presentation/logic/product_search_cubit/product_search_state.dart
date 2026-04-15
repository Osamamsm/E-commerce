
import 'package:e_commerce/features/product/data/models/product.dart';

class ProductSearchState {}

class ProductSearchInitial extends ProductSearchState {}

class ProductSearchLoading extends ProductSearchState {}

class ProductSearchLoaded extends ProductSearchState {
  final List<Product> products;
  ProductSearchLoaded(this.products);
}

class ProductSearchError extends ProductSearchState {
  final String message;
  ProductSearchError(this.message);
}
