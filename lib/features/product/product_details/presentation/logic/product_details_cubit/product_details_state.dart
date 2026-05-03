
import 'package:e_commerce/features/product/data/models/product_details.dart';
import 'package:e_commerce/features/product/data/models/product_item.dart';
import 'package:e_commerce/features/product/data/models/variation_option.dart';

class ProductDetailsState {}

class ProductDetailsInitial extends ProductDetailsState {}

class ProductDetailsLoading extends ProductDetailsState {}

class ProductDetailsError extends ProductDetailsState {
  final String message;
  ProductDetailsError(this.message);
}

class ProductDetailsLoaded extends ProductDetailsState {
  final ProductDetails product;
  final Map<String, String> selectedOptions;

  ProductDetailsLoaded({
    required this.product,
    this.selectedOptions = const {},
  });


  List<String> get variationNames {
    final seen = <String>{};
    return product.productItems
        .expand((item) => item.variations.map((v) => v.variationEn))
        .where((name) => seen.add(name))
        .toList();
  }

  List<VariationOption> availableOptionsFor(String variationEn) {
    final seen = <String>{};
  return product.productItems
      .expand((item) => item.variations.where((v) => v.variationEn == variationEn))
      .where((v) => seen.add(v.optionEn))
      .toList();
  }

  bool isOptionOutOfStock(String variationEn, String optionEn) {
    final testSelection = {...selectedOptions, variationEn: optionEn};
    final matching = product.productItems.where((item) =>
        testSelection.entries.every((e) => item.optionFor(e.key) == e.value));
    return matching.isEmpty || matching.every((item) => item.stock == 0);
  }

  ProductItem? get selectedItem {
    if (selectedOptions.length != variationNames.length) return null;
    try {
      return product.productItems.firstWhere((item) =>
          selectedOptions.entries.every((e) => item.optionFor(e.key) == e.value));
    } catch (_) {
      return null;
    }
  }

  String? get selectedItemId => selectedItem?.id;

  bool get canAddToCart => selectedItem != null && selectedItem!.stock > 0;


  ProductDetailsLoaded copyWith({
    ProductDetails? product,
    Map<String, String>? selectedOptions,
  }) =>
      ProductDetailsLoaded(
        product:         product ?? this.product,
        selectedOptions: selectedOptions ?? this.selectedOptions,
      );
}