import 'product_image.dart';
import 'product_item.dart';

class ProductDetails {
  final String productId;
  final String enName;
  final String arName;
  final String enDescription;
  final String arDescription;
  final String categoryId;
  final String categoryEnName;
  final String categoryArName;
  final List<ProductImage> images;
  final List<ProductItem> productItems;
  final double basePrice;
  final double? discountedPrice;
  final double? discountRate;
  final double avgRating;
  final int reviewCount;

  const ProductDetails({
    required this.productId,
    required this.enName,
    required this.arName,
    required this.enDescription,
    required this.arDescription,
    required this.categoryId,
    required this.categoryEnName,
    required this.categoryArName,
    required this.images,
    required this.productItems,
    required this.basePrice,
    this.discountedPrice,
    this.discountRate,
    required this.avgRating,
    required this.reviewCount,
  });

  factory ProductDetails.fromJson(Map<String, dynamic> j) => ProductDetails(
    productId: j['product_id'],
    enName: j['en_name'],
    arName: j['ar_name'],
    enDescription: j['en_description'],
    arDescription: j['ar_description'],
    categoryId: j['category_id'],
    categoryEnName: j['category_en_name'],
    categoryArName: j['category_ar_name'],
    images: (j['images'] as List).map((i) => ProductImage.fromJson(i)).toList(),
    productItems: (j['product_items'] as List)
        .map((i) => ProductItem.fromJson(i))
        .toList(),
    basePrice: (j['base_price'] as num).toDouble(),
    discountedPrice: j['discounted_price'] != null
        ? (j['discounted_price'] as num).toDouble()
        : null,
    discountRate: j['discount_rate'] != null
        ? (j['discount_rate'] as num).toDouble()
        : null,
    avgRating: (j['avg_rating'] as num).toDouble(),
    reviewCount: j['review_count'],
  );
}
