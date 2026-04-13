
class Product {
  final String id;
  final String enName;
  final String arName;
  final String description;
  final String categoryId;
  final String categoryEnName;
  final String categoryArName;
  final double basePrice;
  final double discountedPrice;
  final double? discountPercentage;
  final double rating;
  final int reviewsCount;
  final String? imageUrl;
  final int totalStock;
  final int totalCount;

  Product({
    required this.id,
    required this.enName,
    required this.arName,
    required this.description,
    required this.categoryId,
    required this.categoryEnName,
    required this.categoryArName,
    required this.basePrice,
    required this.discountedPrice,
    this.discountPercentage,
    required this.rating,
    required this.reviewsCount,
    this.imageUrl,
    required this.totalStock,
    required this.totalCount,
  });


  factory Product.fromSupabaseRow(Map<String, dynamic> row) {
    return Product(
      id: row['id'] as String,
      enName: row['en_name'] as String,
      arName: row['ar_name'] as String,
      description: row['description'] as String,
      categoryId: row['category_id'] as String,
      categoryEnName: row['category_en_name'] as String,
      categoryArName: row['category_ar_name'] as String,
      basePrice: (row['base_price'] as num).toDouble(),
      discountedPrice: (row['discounted_price'] as num).toDouble(),
      discountPercentage: row['discount_percentage'] != null
          ? (row['discount_percentage'] as num).toDouble()
          : null,
      rating: (row['rating'] as num).toDouble(),
      reviewsCount: row['reviews_count'] as int,
      imageUrl: row['image_url'] as String?,
      totalStock: row['total_stock'] as int,
      totalCount: row['total_count'] as int,
    );
  }

}