class Product {
  final String id;
  final String enName;
  final String arName;
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
      id: row['product_id'] as String,
      enName: row['en_name'] as String,
      arName: row['ar_name'] as String,
      categoryId: row['category_id'] as String,
      categoryEnName: row['category_en_name'] as String,
      categoryArName: row['category_ar_name'] as String,
      basePrice: (row['base_price'] as num).toDouble(),
      discountedPrice: (row['discounted_price'] as num).toDouble(),
      discountPercentage: row['discount_rate'] != null
          ? (row['discount_rate'] as num).toDouble()
          : null,
      rating: (row['avg_rating'] as num).toDouble(),
      reviewsCount: row['review_count'] as int,
      imageUrl: row['thumbnail_url'] as String?,
      totalStock: row['total_stock'] as int,
      totalCount: row['total_count'] as int,
    );
  }

  factory Product.placeholder() {
    return Product(
      id: 'placeholder',
      enName: 'Placeholder Product',
      arName: 'منتج تجريبي',
      categoryId: 'placeholder_category',
      categoryEnName: 'Placeholder Category',
      categoryArName: 'فئة تجريبية',
      basePrice: 0.0,
      discountedPrice: 0.0,
      discountPercentage: null,
      rating: 0.0,
      reviewsCount: 0,
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSOBI40yHJnZKP__Q7dSsrUmwifv4rApRJVtQ&s',
      totalStock: 0,
      totalCount: 0,
    );
  }
}
