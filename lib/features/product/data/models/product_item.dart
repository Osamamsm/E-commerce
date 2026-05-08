import 'variation_option.dart';

class ProductItem {
  final String id;
  final String sku;
  final double price;
  final int stock;
  final List<VariationOption> variations;

  const ProductItem({
    required this.id,
    required this.sku,
    required this.price,
    required this.stock,
    required this.variations,
  });

  factory ProductItem.fromJson(Map<String, dynamic> j) => ProductItem(
    id: j['id'],
    sku: j['sku'],
    price: (j['price'] as num).toDouble(),
    stock: j['stock'],
    variations: (j['variations'] as List)
        .map((v) => VariationOption.fromJson(v))
        .toList(),
  );

  String? optionFor(String variationEn) {
    try {
      return variations
          .firstWhere((v) => v.variationEn == variationEn)
          .optionEn;
    } catch (_) {
      return null;
    }
  }
}
